package com.techm.banking.service;

import com.techm.banking.model.Account;
import com.techm.banking.model.Card;
import com.techm.banking.model.TransactionHistory;
import com.techm.banking.model.User;

import java.util.List;
import java.util.Optional;

public interface AccountService {
    Optional<Account> createAccountWithoutCard(User user, Account account);
    Optional<Account> createAccountWithCard(User user, Account account, Card card);


    Optional<Double> depositBalance(String accountNo, Double depositAmount);

    Optional<Double> withdrawBalance(String accountNo, Double withdrawAmount, String password);

    Optional<Double> checkBalance(String accountNo, String password);

    Optional<Double> transferMoney(String fromAccNo, String toAccNo, Double amount, String password);

    List<TransactionHistory> viewTransactions(String accountNo);

    Optional<Account> accountDetails(String accountNo,String password);
}
