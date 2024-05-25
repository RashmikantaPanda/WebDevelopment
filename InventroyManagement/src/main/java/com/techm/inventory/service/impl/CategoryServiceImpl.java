package com.techm.inventory.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.techm.inventory.model.Category;
import com.techm.inventory.repository.CategoryRepository;
import com.techm.inventory.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	private CategoryRepository categoryRepository;

	@Override
	public List<Category> getAllCategories() {
		return categoryRepository.findAll();
	}

	@Override
	public Category saveCategory(Category category) {
		return categoryRepository.save(category);
	}

	@Override
	public Category getCategoryById(Integer id) {
		return categoryRepository.findById(id).orElse(null);
	}

	@Override
	public Category editCategory(Category category, Integer id) {
		Optional<Category> categoryOptional = categoryRepository.findById(id);
		if (categoryOptional.isPresent()) {
			categoryOptional.get().setCategoryCode(category.getCategoryCode());
			categoryOptional.get().setCategoryName(category.getCategoryName());
			return categoryRepository.save(categoryOptional.get());
		}
		return null;
	}
}
