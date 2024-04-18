package com.techm.banking.service.impl;

import com.techm.banking.model.Account;
import com.techm.banking.model.Card;
import com.techm.banking.repository.CardRepository;
import com.techm.banking.service.CardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class CardServiceImpl implements CardService {
    @Autowired
    CardRepository cardRepository;

    @Override
    public Optional<Card> createCard(Card card) {
        Card newCard=cardRepository.save(card);

        return Optional.of(newCard);
    }

    @Override
    public Optional<Card> getCardFromAccountNo(String accountNo) {
        Card card=cardRepository.getCardByAccount_AccountNo(accountNo);
        return Optional.of(card);
    }
}
