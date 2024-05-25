package com.techm.inventory.service;

import java.util.List;

import com.techm.inventory.model.Category;

public interface CategoryService {
	List<Category> getAllCategories();
	Category saveCategory(Category category);
	Category getCategoryById(Integer id);
	Category editCategory(Category category,Integer id);
}
