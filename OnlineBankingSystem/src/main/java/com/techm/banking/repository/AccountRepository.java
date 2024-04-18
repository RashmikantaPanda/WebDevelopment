package com.techm.banking.repository;

import com.techm.banking.model.Account;
import com.techm.banking.model.TransactionHistory;
import com.techm.banking.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface AccountRepository extends JpaRepository<Account,Integer> {
    Account findByAccountNo(String accNo);
}
