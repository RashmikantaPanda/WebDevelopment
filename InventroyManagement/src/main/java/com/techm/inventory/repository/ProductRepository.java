package com.techm.inventory.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.techm.inventory.model.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer> {
    public List<Product> findProductsByCategory(String category);

    public Product getProductByProductId(String productId);

    @Query(value = "select quantity from product where id = :id", nativeQuery = true)
    public Integer getQuantityById(@Param("id") Integer productId);
}
