package com.techm.banking.service.impl;

import com.techm.banking.model.Account;
import com.techm.banking.model.TransactionHistory;
import com.techm.banking.repository.TransactionHistoryRepository;
import com.techm.banking.service.TransactionHistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.util.List;

@Service
public class TransactionHistoryImpl implements TransactionHistoryService {
    @Autowired
    TransactionHistoryRepository transactionHistoryRepository;
    @Override
    public void saveTransaction(Account account, String type, Double amount, Double availableBalance) {
        TransactionHistory transaction = new TransactionHistory();
        transaction.setAccount(account);
        transaction.setTransactionDateTime(new Timestamp(System.currentTimeMillis()));
        transaction.setTransactionType(type);
        transaction.setAmount(amount);
        transaction.setAvailableBalance(availableBalance);

        transactionHistoryRepository.save(transaction);
    }

    @Override
    public List<TransactionHistory> viewTransactions(Account account) {
       return transactionHistoryRepository.findTransactionHistoriesByAccount(account);
    }
}
