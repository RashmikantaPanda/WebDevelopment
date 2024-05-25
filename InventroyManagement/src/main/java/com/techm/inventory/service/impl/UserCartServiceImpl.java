package com.techm.inventory.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.techm.inventory.model.Product;
import com.techm.inventory.model.User;
import com.techm.inventory.model.UserCart;
import com.techm.inventory.repository.UserCartRepository;
import com.techm.inventory.service.ProductService;
import com.techm.inventory.service.UserCartService;
import com.techm.inventory.service.UserService;

import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class UserCartServiceImpl implements UserCartService {

	@Autowired
	private UserCartRepository userCartRepository;

	@Autowired
	ProductService productService;

	@Autowired
	UserService userService;

	@Override
	public UserCart saveUserCart(UserCart userCart) {
		return userCartRepository.save(userCart);
	}

	@Override
	public UserCart saveUserCartDetails(UserCart userCart) {
		Product product = new Product();
		if (userCart.getProductId() != null) {
			log.info("Fetching Product by Product ID");
			product = productService.findProductById(userCart.getProductId());
		} else if (userCart.getProductCode() != null) {
			log.info("Fetching Product by PRODUCT CODE");
			product = productService.findProductByProductCode(userCart.getProductCode());
			System.out.println("PRODUCT CODE : " + userCart.getProductCode());
		} else {
			log.warn("NULL PRODUCT CAN NOT BE ADDED TO CART");
			return null;
		}
		userCart.setProductCode(product.getProductId());
		userCart.setProductName(product.getProductName());
		userCart.setPrice(product.getPrice());
		userCart.setTotalPrice(product.getPrice() * userCart.getQuantity());
		return userCartRepository.save(userCart);

	}

	@Override
	public List<UserCart> getAllUserCartsByUserId(Integer userId) {
		return userCartRepository.getUserCartsByUserId(userId);
	}

	@Override
	public List<UserCart> getAllUserCarts() {
		return userCartRepository.findAll();
	}

	@SuppressWarnings("unchecked")
	@Override
	public Boolean addItemToUserCart(HttpSession session, UserCart userCart) {
		List<UserCart> userCartItems;
		if (session.getAttribute("userCartItems") == null) {
			userCartItems = new ArrayList<>();
		} else {
			userCartItems = (List<UserCart>) session.getAttribute("userCartItems");
		}
		Product product = new Product();
		User user = new User();
		if (userCart.getProductId() != null) {
			log.info("Fetching Product by Product ID");
			product = productService.findProductById(userCart.getProductId());
			userCart.setProductCode(product.getProductId());
			userCart.setProductName(product.getProductName());
		} else if (userCart.getProductCode() != null) {
			log.info("Fetching Product by PRODUCT CODE");
			product = productService.findProductByProductCode(userCart.getProductCode());
			if (product == null) {
				session.setAttribute("failMsg", "Product Not Found");
				return false;
			}
			if (product.getStatus().equals("INACTIVE")) {
				session.setAttribute("failMsg", "Product is Deleted");
				return false;
			}
			userCart.setProductId(product.getId());
			userCart.setProductCode(product.getProductId());
			userCart.setProductName(product.getProductName());
			System.out.println("PRODUCT CODE : " + userCart.getProductCode());
		} else {
			log.warn("NULL PRODUCT CAN NOT BE ADDED TO CART");
			return false;
		}

		if (userCartItems.contains(userCart)) {
			int index = userCartItems.indexOf(userCart);
			System.out.println("DUPLICATE product found");

			// Check whether product's quantity available for user cart's quantity or not
			if (!productService.isQuantityAvailable(product.getId(),
					(userCartItems.get(index).getQuantity() + userCart.getQuantity()))) {
				session.setAttribute("failMsg", "Quantity not available (available- "
						+ productService.getQuantityByProductId(product.getId()) + ")");
				System.out.println("Not available");
				return false;
			}

			userCartItems.get(index).setQuantity(userCartItems.get(index).getQuantity() + userCart.getQuantity());
			userCartItems.get(index)
					.setTotalPrice(userCartItems.get(index).getPrice() * userCartItems.get(index).getQuantity());
			session.setAttribute("userCartItems", userCartItems);
			System.out.println(userCartItems);

			return true;
		}

		// Check whether product's quantity available for user cart's quantity or not
		if (!productService.isQuantityAvailable(product.getId(), userCart.getQuantity())) {
			session.setAttribute("failMsg", "Quantity not available (available- "
					+ productService.getQuantityByProductId(product.getId()) + ")");
			return false;
		}

		user = userService.getUserById(userCart.getUserId());
		userCart.setPrice(product.getPrice());
		userCart.setTotalPrice(product.getPrice() * userCart.getQuantity());
		userCart.setUserName(user.getFirstName().concat(" ").concat(user.getLastName()));
		userCartItems.add(userCart);
		session.setAttribute("userCartItems", userCartItems);
		System.out.println(userCartItems);

		return true;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Boolean plusOneItemInUserCart(int index, HttpSession session) {
		List<UserCart> userCartItems;
		if (session.getAttribute("userCartItems") != null) {
			userCartItems = (List<UserCart>) session.getAttribute("userCartItems");
			System.out.println("Incresing Product Quantity");

			// Check whether product's quantity available for user cart's quantity or not
			if (!productService.isQuantityAvailable(userCartItems.get(index).getProductId(),
					userCartItems.get(index).getQuantity() + 1)) {
				System.out.println("Increasing Product Quantity Failed Due to Unavailablity of Products!");
				session.setAttribute("failMsg", "Quantity not available (available- "
						+ productService.getQuantityByProductId(userCartItems.get(index).getProductId()) + ")");
				return false;
			}
			userCartItems.get(index).setQuantity(userCartItems.get(index).getQuantity() + 1);
			userCartItems.get(index)
					.setTotalPrice(userCartItems.get(index).getPrice() * userCartItems.get(index).getQuantity());

			session.setAttribute("userCartItems", userCartItems);
			return true;
		}
		return false;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Boolean minusOneItemInUserCart(int index, HttpSession session) {
		List<UserCart> userCartItems;
		if (session.getAttribute("userCartItems") != null) {
			userCartItems = (List<UserCart>) session.getAttribute("userCartItems");
			System.out.println("Decreasing Product Quantity");
			userCartItems.get(index).setQuantity(userCartItems.get(index).getQuantity() - 1);
			userCartItems.get(index)
					.setTotalPrice(userCartItems.get(index).getPrice() * userCartItems.get(index).getQuantity());
			if (userCartItems.get(index).getQuantity() < 1) {
				deleteItemFromUserCart(index + 1, session);
			}
			session.setAttribute("userCartItems", userCartItems);
			return true;
		}
		return false;
	}

	@SuppressWarnings("unchecked")
	@Override
	public Boolean deleteItemFromUserCart(int index, HttpSession session) {
		List<UserCart> userCartItems;
		if (session.getAttribute("userCartItems") != null) {
			userCartItems = (List<UserCart>) session.getAttribute("userCartItems");
			System.out.println(userCartItems);
			userCartItems.remove(index - 1);
			System.out.println("After Deletion");
			System.out.println(userCartItems);
			session.setAttribute("userCartItems", userCartItems);
		}
		return null;
	}

	@Override
	public Integer noOfQuantitySold() {
		List<UserCart> soldItems = userCartRepository.findAll();
		int totalQuantity = soldItems.stream().map(item -> item.getQuantity()).reduce(0, (a, b) -> a + b);
		System.out.println("Total Quantity Sold : " + totalQuantity);
		return totalQuantity;
	}
}
