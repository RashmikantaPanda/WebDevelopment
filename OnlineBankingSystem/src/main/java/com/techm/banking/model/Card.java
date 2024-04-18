package com.techm.banking.model;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
public class Card {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String cardNo;
    private String cardHolderName;
    private String cardPin;
    private String issueDate;
    private String expiryDate;
    @OneToOne
    @JoinColumn(name = "account_id")
    @JsonBackReference
    private Account account;
}
