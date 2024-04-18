package com.techm.banking.repository;

import com.techm.banking.model.Card;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CardRepository extends JpaRepository<Card,Integer> {
    Card getCardByAccount_AccountNo(String accountNo);
    Card getCardById(Integer id);
}
