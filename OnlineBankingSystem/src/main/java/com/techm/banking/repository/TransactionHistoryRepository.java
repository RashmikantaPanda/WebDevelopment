package com.techm.banking.repository;

import com.techm.banking.model.Account;
import com.techm.banking.model.TransactionHistory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TransactionHistoryRepository extends JpaRepository<TransactionHistory,Integer> {
    List<TransactionHistory> findTransactionHistoriesByAccount(Account account);

    @Query("SELECT th FROM TransactionHistory th JOIN th.account a WHERE a.accountNo = :accountNo")
    List<TransactionHistory> findAllByAccount_AccountNo(String accountNo);

}
