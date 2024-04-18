package com.techm.banking.service.impl;

import com.techm.banking.dto.EmailDto;
import com.techm.banking.model.*;
import com.techm.banking.repository.AccountRepository;
import com.techm.banking.service.*;
import com.techm.banking.utility.AccountMsgUtility;
import com.techm.banking.utility.AccountUtility;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

@Service
public class AccountServiceImpl implements AccountService {
    @Autowired
    AccountRepository accountRepository;
    @Autowired
    UserService userService;
    @Autowired
    TransactionHistoryService transactionHistoryService;
    @Autowired
    EmailService emailService;
    @Autowired
    CardService cardService;

    @Override
    public Optional<Account> createAccountWithoutCard(User user, Account account) {
        account.setAccountNo(AccountUtility.generateAccountNumber());
        account.setUser(user);
        account.setAccountType("Saving");
        account.setBalance(1000.0);
        account.setPassword(user.getPassword());

        //userService.registerUser(user);
        accountRepository.save(account);

        //Sending email to User regarding the account no
        EmailDto accountEmail = new EmailDto();
        accountEmail.setRecipient(user.getEmail());
        accountEmail.setSubject("Account Details");
        accountEmail.setMsgBody(AccountMsgUtility.accountCreateWithoutCardMsg(account,user));
        emailService.sendMailWithHtmlBody(accountEmail);

        return Optional.of(account);
    }

    @Override
    public Optional<Account> createAccountWithCard(User user, Account account,Card card) {
        account.setAccountNo(AccountUtility.generateAccountNumber());
        account.setUser(user);
        account.setAccountType(account.getAccountType());
        account.setBalance(1000.0);
        account.setPassword(user.getPassword());

        card.setCardNo(AccountUtility.generateAtmCardNumber());
        card.setCardHolderName(account.getUser().getFirstName()+" "+account.getUser().getLastName());
        card.setIssueDate(AccountUtility.todayDateInYYMMDD());
        card.setExpiryDate(AccountUtility.addYearInTodayDate(5));
        card.setCardPin("0000");
        card.setAccount(account);
        account.setCard(card);

        //userService.registerUser(user);
        accountRepository.save(account);

        //Sending email to User regarding the account no
        EmailDto accountEmail = new EmailDto();
        accountEmail.setRecipient(user.getEmail());
        accountEmail.setSubject("Account Details");

        accountEmail.setMsgBody(AccountMsgUtility.accountCreatedMsg(account,user));
        emailService.sendMailWithHtmlBody(accountEmail);
        return Optional.of(account);
    }

    @Override
    public Optional<Double> depositBalance(String accountNo, Double depositAmount) {
        Account account = accountRepository.findByAccountNo(accountNo);
        account.setBalance(account.getBalance() + depositAmount);
        accountRepository.save(account);
        transactionHistoryService.saveTransaction(account, "Credit", depositAmount, account.getBalance());

        //Send email(sms) to the user regarding deposit
        EmailDto depositEmail = new EmailDto();
        depositEmail.setRecipient(account.getUser().getEmail());
        depositEmail.setSubject("Balance Credited");

        depositEmail.setMsgBody(AccountMsgUtility.depositBalanceMsg(account,depositAmount));
        emailService.sendMailWithHtmlBody(depositEmail);
        return Optional.ofNullable(account.getBalance());
    }

    @Override
    public Optional<Double> withdrawBalance(String accountNo, Double withdrawAmount, String password) {
        Account account = accountRepository.findByAccountNo(accountNo);
        if (account.getUser().getPassword().equals(password)) {
            if (account.getBalance() >= withdrawAmount) {
                account.setBalance(account.getBalance() - withdrawAmount);
                accountRepository.save(account);
                transactionHistoryService.saveTransaction(account, "Debit", withdrawAmount, account.getBalance());

                //Send email(sms) to the user regarding deposit
                EmailDto withdrawEmail = new EmailDto();
                withdrawEmail.setRecipient(account.getUser().getEmail());
                withdrawEmail.setSubject("Balance Credited");

                withdrawEmail.setMsgBody(AccountMsgUtility.withdrawBalanceMsg(account,withdrawAmount));
                emailService.sendMailWithHtmlBody(withdrawEmail);

            } else
                return Optional.empty();
        }
        return Optional.ofNullable(account.getBalance());
    }

    @Override
    public Optional<Double> checkBalance(String accNo, String password) {
        Account account = accountRepository.findByAccountNo(accNo);
        if (account.getUser().getPassword().equals(password)) {
            return Optional.ofNullable(account.getBalance());
        } else {
            return Optional.empty();
        }
    }

    @Override
    public Optional<Double> transferMoney(String fromAccNo, String toAccNo, Double amount, String password) {

        Optional<Account> optionalFromAccount = Optional.ofNullable(accountRepository.findByAccountNo(fromAccNo));
        Optional<Account> optionalToAccount = Optional.ofNullable(accountRepository.findByAccountNo(toAccNo));

        if (optionalFromAccount.isPresent() && optionalToAccount.isPresent() &&
                optionalFromAccount.map(Account::getUser)
                        .map(User::getPassword)
                        .filter(password::equals)
                        .isPresent()) {

            Account fromAccount = optionalFromAccount.get();
            Account toAccount = optionalToAccount.get();

            if (fromAccount.getBalance() >= amount) {
                Double fromAccBalance = fromAccount.getBalance() - amount;
                Double toAccBalance = toAccount.getBalance() + amount;
                fromAccount.setBalance(fromAccBalance);
                toAccount.setBalance(toAccBalance);
                accountRepository.save(fromAccount);
                accountRepository.save(toAccount);
                transactionHistoryService.saveTransaction(fromAccount, "Debit", amount, fromAccount.getBalance());
                transactionHistoryService.saveTransaction(toAccount, "Credit", amount, toAccount.getBalance());

                //Send email to both toAccountHolder and fromAccountHolder
                EmailDto fromAccountEmailDto = new EmailDto();
                EmailDto toAccountEmailDto = new EmailDto();

                fromAccountEmailDto.setRecipient(fromAccount.getUser().getEmail());
                toAccountEmailDto.setRecipient(toAccount.getUser().getEmail());

                fromAccountEmailDto.setSubject("Balance Debited");
                toAccountEmailDto.setSubject("Balance Credited");

                fromAccountEmailDto.setMsgBody(AccountMsgUtility.transferMoneyMsgForFromAccount(fromAccount,toAccount,amount));
                toAccountEmailDto.setMsgBody(AccountMsgUtility.transferMoneyMsgForToAccount(fromAccount,toAccount,amount));

                emailService.sendMailWithHtmlBody(fromAccountEmailDto);
                emailService.sendMailWithHtmlBody(toAccountEmailDto);

                return Optional.ofNullable(fromAccount.getBalance());
            }

        }
        return Optional.empty();
    }

    @Override
    public List<TransactionHistory> viewTransactions(String accountNo) {
        Account account1 = accountRepository.findByAccountNo(accountNo);

        if (account1 != null) {
            return transactionHistoryService.viewTransactions(account1);
        } else {
            return Collections.emptyList();
        }
    }

    @Override
    public Optional<Account> accountDetails(String accountNo, String password) {

        Account account = accountRepository.findByAccountNo(accountNo);
        if (account.getUser().getPassword().equals(password)) {
//            Optional<User> user = userService.getUserById(account.getUser().getUserId());
//            if (user.isPresent()) {
//                return Optional.of(account);
//            }
            return Optional.of(account);
        }
        return Optional.empty();
    }


}
