package com.techm.inventory.service;

import java.util.List;

import com.techm.inventory.dto.ItemRequest;
import com.techm.inventory.model.Product;

import jakarta.servlet.http.HttpSession;

public interface ProductService {

    public Product addNewItem(ItemRequest addNewItemRequest,HttpSession session);

    public Product editProduct(ItemRequest editProduct, Integer productId);

    public Product findProductById(Integer id);

    public Product findProductByProductCode(String productId);

    public List<Product> allProducts();

    public List<Product> findProductsByCategory(String category);

    public Integer getQuantityByProductId(Integer productId);

    public Boolean isQuantityAvailable(Integer productId,Integer requiredQuantity);

    public Boolean updateProductQuantity(Integer productId,Integer noOfQunatity);

    public Product deleteProductById(Integer productId);

    public List<Product> getAllActiveProduct();

    public Product restoreProductById(Integer productId);

}
