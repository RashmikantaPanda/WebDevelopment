package com.techm.inventory.service;

import java.util.List;

import com.techm.inventory.model.PurchasedHistory;
import com.techm.inventory.model.UserCart;

public interface PurchaseHistoryService {

	PurchasedHistory savePurchasedHistory(PurchasedHistory purchasedHistory);
	PurchasedHistory saveUsersPurchasedHistory(List<UserCart> listOfUserCarts,String paymentMethod,String remark);

	List<PurchasedHistory> viewPurchasedHistoryByUserId(Integer userId);
	List<PurchasedHistory> viewAllPurchaseHistory();

	PurchasedHistory findPurchaseHistoryById(Integer purchaseId);

}
