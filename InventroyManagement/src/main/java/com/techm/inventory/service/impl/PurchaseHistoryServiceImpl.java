package com.techm.inventory.service.impl;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.techm.inventory.dto.EmailDto;
import com.techm.inventory.model.PurchasedHistory;
import com.techm.inventory.model.User;
import com.techm.inventory.model.UserCart;
import com.techm.inventory.repository.PurchaseHistoryRepository;
import com.techm.inventory.service.ProductService;
import com.techm.inventory.service.PurchaseHistoryService;
import com.techm.inventory.service.UserCartService;
import com.techm.inventory.service.UserService;
import com.techm.inventory.utill.EmailMsgUtility;

@Service
public class PurchaseHistoryServiceImpl implements PurchaseHistoryService {

    @Autowired
    private PurchaseHistoryRepository purchaseHistoryRepository;

    @Autowired
    private UserService userService;

    @Autowired
    private UserCartService userCartService;

    @Autowired
    private ProductService productService;
    /*
     * @Autowired private EmailService emailService;
     */

    @Override
    public PurchasedHistory savePurchasedHistory(PurchasedHistory purchasedHistory) {
        return purchaseHistoryRepository.save(purchasedHistory);
    }

    @Override
    public PurchasedHistory saveUsersPurchasedHistory(List<UserCart> listOfUserCarts, String paymentMethod,
                                                      String remark) {
        User user = userService.getUserById(listOfUserCarts.get(0).getUserId());
        PurchasedHistory purchasedHistory = new PurchasedHistory();
        double totalAmount = 0.0;
        for (UserCart userCart : listOfUserCarts) {
            productService.updateProductQuantity(userCart.getProductId(), userCart.getQuantity());
            userCartService.saveUserCart(userCart);
            totalAmount += userCart.getTotalPrice();
        }
        purchasedHistory.setProductCart(listOfUserCarts);
        purchasedHistory.setUser(user);
        purchasedHistory.setAmount(totalAmount);
        purchasedHistory.setPurchasedDateTime(LocalDateTime.now());
        purchasedHistory.setPaymentMethod(paymentMethod);
        purchasedHistory.setRemark(remark);

        /* Set Email Details for User */
        EmailDto emailDto = new EmailDto();
        emailDto.setReceiver(user.getEmail());
        emailDto.setSubject("Purchase Details");
        emailDto.setBody(EmailMsgUtility.purchaseListTableFormat(listOfUserCarts, user,totalAmount));

        /* Send mail */
//		emailService.sendMailWithHtmlBody(emailDto); //Use Own Wi-fi For Sending Mail (Office Internet not Working)

        return purchaseHistoryRepository.save(purchasedHistory);
    }

    @Override
    public List<PurchasedHistory> viewPurchasedHistoryByUserId(Integer userId) {
        User user = userService.getUserById(userId);

        return purchaseHistoryRepository.getPurchasedHistoriesByUser(user);
    }

    @Override
    public List<PurchasedHistory> viewAllPurchaseHistory() {
        return purchaseHistoryRepository.findAll();
    }

    @Override
    public PurchasedHistory findPurchaseHistoryById(Integer purchaseId) {
        return purchaseHistoryRepository.findById(purchaseId).orElse(null);
    }

}
