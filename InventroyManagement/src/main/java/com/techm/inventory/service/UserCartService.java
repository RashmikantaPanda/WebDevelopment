package com.techm.inventory.service;

import java.util.List;

import com.techm.inventory.model.UserCart;

import jakarta.servlet.http.HttpSession;

public interface UserCartService {
	public UserCart saveUserCart(UserCart userCart);

	public UserCart saveUserCartDetails(UserCart userCart);

	public List<UserCart> getAllUserCartsByUserId(Integer userId);

	public List<UserCart> getAllUserCarts();

	public Boolean addItemToUserCart(HttpSession session, UserCart userCart);

	public Boolean plusOneItemInUserCart(int index, HttpSession session);

	public Boolean minusOneItemInUserCart(int index, HttpSession session);

	public Boolean deleteItemFromUserCart(int index, HttpSession session);

	public Integer noOfQuantitySold();
}
