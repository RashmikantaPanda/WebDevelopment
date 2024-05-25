package com.techm.inventory.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.techm.inventory.model.UserCart;

@Repository
public interface UserCartRepository extends JpaRepository<UserCart, Integer> {
	public List<UserCart> getUserCartsByUserId(Integer userId);
}
