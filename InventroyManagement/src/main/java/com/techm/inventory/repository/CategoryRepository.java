package com.techm.inventory.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.techm.inventory.model.Category;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Integer> {

}
