package com.techm.inventory.utill;

import java.util.Comparator;

import com.techm.inventory.model.Product;

public class SortByProductPrice implements Comparator<Product> {
	@Override
	public int compare(Product p1, Product p2) {
		if (p1.getPrice() == p2.getPrice())
			return 0;
		else if (p1.getPrice() > p2.getPrice())
			return 1;
		else
			return -1;
	}

	@Override
	public Comparator<Product> reversed() {
		return Comparator.super.reversed();
	}
}
