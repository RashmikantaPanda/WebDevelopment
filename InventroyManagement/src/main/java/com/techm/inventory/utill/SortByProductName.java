package com.techm.inventory.utill;

import java.util.Comparator;

import com.techm.inventory.model.Product;

public class SortByProductName implements Comparator<Product> {

	@Override
	public int compare(Product p1, Product p2) {
		return p1.getProductName().compareTo(p2.getProductName());
	}
	@Override
	public Comparator<Product> reversed() {
		return Comparator.super.reversed();
	}

}
