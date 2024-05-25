package com.techm.inventory.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.techm.inventory.model.PurchasedHistory;
import com.techm.inventory.model.User;

@Repository
public interface PurchaseHistoryRepository extends JpaRepository<PurchasedHistory, Integer> {
	List<PurchasedHistory> getPurchasedHistoriesByUser(User user);
}
