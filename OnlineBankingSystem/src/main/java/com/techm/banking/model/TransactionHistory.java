package com.techm.banking.model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class TransactionHistory {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Integer transactionId;
    @ManyToOne
    @JoinColumn(name = "account_id")
    @JsonBackReference
    Account account;

    Timestamp transactionDateTime;
    String transactionType;
    Double amount;
    Double availableBalance;

}
