package com.techm.banking.service;

import com.techm.banking.model.Account;
import com.techm.banking.model.Card;

import java.util.Optional;

public interface CardService {
    Optional<Card> createCard(Card card);
    Optional<Card> getCardFromAccountNo(String accountNo);
}
