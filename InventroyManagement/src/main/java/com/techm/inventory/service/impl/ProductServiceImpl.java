package com.techm.inventory.service.impl;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.Optional;

import com.techm.inventory.dto.ItemRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;

import com.techm.inventory.model.Product;
import com.techm.inventory.repository.ProductRepository;
import com.techm.inventory.service.ProductService;

import jakarta.servlet.http.HttpSession;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductRepository productRepository;

    @Override
    public Product addNewItem(ItemRequest addNewItemRequest, HttpSession session) {
        Product p = productRepository.getProductByProductId(addNewItemRequest.getProductId());
        if (p != null) {
            session.setAttribute("failMsg", "Duplicate Product Code !");
            session.setAttribute("filledProduct", addNewItemRequest);
            System.out.println("Duplicate Product CODE : " + p.getProductId());
            System.out.println(addNewItemRequest);
            return null;
        }
        Product product = new Product();
        product.setProductName(addNewItemRequest.getProductName());
        product.setProductId(addNewItemRequest.getProductId());
        product.setCategory(addNewItemRequest.getCategory());
        product.setDescription(addNewItemRequest.getDescription());
        product.setImageName(addNewItemRequest.getFile().getOriginalFilename());
        product.setQuantity(addNewItemRequest.getQuantity());
        product.setPrice(addNewItemRequest.getPrice());

        try {
            File saveFile = new ClassPathResource("static/Img").getFile();
            Path path = Paths.get(
                    saveFile.getAbsolutePath() + File.separator + addNewItemRequest.getFile().getOriginalFilename());
            System.out.println("Path : " + path);
            Files.copy(addNewItemRequest.getFile().getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return productRepository.save(product);
    }

    @Override
    public Product editProduct(ItemRequest editProduct, Integer productId) {
        System.out.println(editProduct);
        Optional<Product> oldProduct = productRepository.findById(productId);
        if (oldProduct.isPresent()) {
            oldProduct.get().setProductName(editProduct.getProductName());
            oldProduct.get().setProductId(editProduct.getProductId());
            oldProduct.get().setCategory(editProduct.getCategory());
            oldProduct.get().setDescription(editProduct.getDescription());
            oldProduct.get().setPrice(editProduct.getPrice());
            oldProduct.get().setQuantity(editProduct.getQuantity());

            if (!editProduct.getFile().isEmpty()) {
                oldProduct.get().setImageName(editProduct.getFile().getOriginalFilename());
                try {
                    File saveFile = new ClassPathResource("static/Img").getFile();
                    Path path = Paths.get(
                            saveFile.getAbsolutePath() + File.separator + editProduct.getFile().getOriginalFilename());
                    System.out.println("Path : " + path);
                    Files.copy(editProduct.getFile().getInputStream(), path, StandardCopyOption.REPLACE_EXISTING);
                } catch (Exception e) {
                    System.out.println(e.getMessage());
                }
            }
            return productRepository.save(oldProduct.get());
        }
        return null;
    }

    @Override
    public Product findProductById(Integer productId) {
        Optional<Product> product = productRepository.findById(productId);
        return product.orElse(null);
    }

    @Override
    public List<Product> allProducts() {
        return productRepository.findAll();
    }

    @Override
    public List<Product> findProductsByCategory(String category) {
        return productRepository.findProductsByCategory(category);
    }

    @Override
    public Product findProductByProductCode(String productId) {
        return productRepository.getProductByProductId(productId);
    }

    @Override
    public Integer getQuantityByProductId(Integer productId) {
        return productRepository.getQuantityById(productId);
    }

    @Override
    public Boolean isQuantityAvailable(Integer productId, Integer requiredQuantity) {
        Integer availableQuantity = productRepository.getQuantityById(productId);
        if ((availableQuantity - requiredQuantity) < 0)
            return false;
        return true;
    }

    @Override
    public Boolean updateProductQuantity(Integer productId, Integer noOfQunatity) {
        Optional<Product> oldProduct = productRepository.findById(productId);
        if (oldProduct.isPresent()) {
            oldProduct.get().setQuantity(oldProduct.get().getQuantity() - noOfQunatity);
            productRepository.save(oldProduct.get());
            return true;
        }
        return false;
    }

    @Override
    public Product deleteProductById(Integer productId) {
        Optional<Product> product = productRepository.findById(productId);
        if (product.isPresent()) {
            product.get().setStatus("INACTIVE");
            return productRepository.save(product.get());
        }
        return null;
    }

    @Override
    public Product restoreProductById(Integer productId) {
        Optional<Product> product = productRepository.findById(productId);
        if (product.isPresent()) {
            product.get().setStatus("ACTIVE");
            return productRepository.save(product.get());
        }
        return null;
    }

    @Override
    public List<Product> getAllActiveProduct() {
        List<Product> activeProducts = productRepository.findAll().stream()
                .filter(product -> product.getStatus().equals("ACTIVE")).toList();
        return activeProducts;
    }

}
