package com.techm.banking.service;

import com.techm.banking.model.Account;
import com.techm.banking.model.TransactionHistory;

import java.util.List;

public interface TransactionHistoryService {
    void saveTransaction(Account account, String type, Double amount, Double availableBalance);

    List<TransactionHistory> viewTransactions(Account account);
}
