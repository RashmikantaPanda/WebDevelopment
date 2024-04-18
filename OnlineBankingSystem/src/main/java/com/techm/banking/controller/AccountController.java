package com.techm.banking.controller;

import com.techm.banking.dto.DepositOrWithdrawRequest;
import com.techm.banking.dto.TransferMoneyRequest;
import com.techm.banking.dto.UserAccountRequest;
import com.techm.banking.model.Account;
import com.techm.banking.model.Card;
import com.techm.banking.model.TransactionHistory;
import com.techm.banking.model.User;
import com.techm.banking.service.AccountService;
import com.techm.banking.service.TransactionHistoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.Optional;

@RestController
@RequestMapping("/account")
public class AccountController {

    @Autowired
    AccountService accountService;
    @Autowired
    TransactionHistoryService transactionHistoryService;

    @PostMapping("/createWithoutCard")
    public ResponseEntity<Optional<Account>> createAccountWithoutCard(@RequestBody UserAccountRequest userAccountRequest) {
        System.out.println("Account Creation WITHOUT Card");
        User user = userAccountRequest.getUser();
        Account account = userAccountRequest.getAccount();

        Optional<Account> account1 = accountService.createAccountWithoutCard(user, account);

        return new ResponseEntity<>(account1, HttpStatus.CREATED);
    }
    @PostMapping("/create")
    public ResponseEntity<Optional<Account>> createAccount(@RequestBody UserAccountRequest userAccountRequest) {
        System.out.println("Account Creation With Card");
        User user = userAccountRequest.getUser();
        Account account = userAccountRequest.getAccount();
        Card card=new Card();

        Optional<Account> account1 = accountService.createAccountWithCard(user, account,card);

        return new ResponseEntity<>(account1, HttpStatus.CREATED);
    }

    @PostMapping("/deposit")
    public ResponseEntity<Optional<Double>> depositMoney(@RequestBody DepositOrWithdrawRequest depositRequest) {
        Optional<Double> updatedBalance = accountService.depositBalance(
                depositRequest.getAccountNo(),
                depositRequest.getAmount());

        return new ResponseEntity<>(updatedBalance, HttpStatus.OK);
    }


    @PostMapping("/withdraw")
    public ResponseEntity<Optional<Double>> withdrawMoney(@RequestBody DepositOrWithdrawRequest withdrawRequest) {
        Optional<Double> updatedBalance = accountService.withdrawBalance(
                withdrawRequest.getAccountNo(),
                withdrawRequest.getAmount(),
                withdrawRequest.getPassword());

        return new ResponseEntity<>(updatedBalance, HttpStatus.OK);
    }

    @PostMapping("/transfer")
    public ResponseEntity<Optional<Double>> transferMoney(@RequestBody TransferMoneyRequest tmr) {
        Optional<Double> updatedBalance = accountService.transferMoney(
                tmr.getFromAccountNo(),
                tmr.getToAccountNo(),
                tmr.getAmount(),
                tmr.getPassword());

        return new ResponseEntity<>(updatedBalance, HttpStatus.OK);
    }

    @GetMapping("/checkBalance")
    public ResponseEntity<Optional<Double>> checkAccountBalance(@RequestParam("accountNo") String accountNo, @RequestParam("password") String password) {
        return new ResponseEntity<>(accountService.checkBalance(accountNo, password), HttpStatus.OK);
    }

    @PostMapping("/transactions")
    public ResponseEntity<List<TransactionHistory>> viewTransactionHistory(@RequestBody Map<String, String> requestBody) {
        String accNo = requestBody.get("accountNo");

        if (accNo != null && !accNo.isEmpty()) {
            List<TransactionHistory> tranHistory = accountService.viewTransactions(accNo);
            return new ResponseEntity<>(tranHistory, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
    }

    @GetMapping("/details")
    public ResponseEntity<Optional<Account>> accountDetails(@RequestParam("accountNo") String accountNo, @RequestParam("password") String password) {
        if (!accountNo.isEmpty() && !password.isEmpty()) {

            return new ResponseEntity<>(accountService.accountDetails(accountNo,password),HttpStatus.OK);
        }
        else {
            return new ResponseEntity<>(Optional.empty(),HttpStatus.BAD_REQUEST);
        }
    }


}
