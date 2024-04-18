package com.techm.banking.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@ToString(exclude = "user")
public class Account {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Integer accountId;
    String accountNo;
    Double balance;
    String password;
    @Column(columnDefinition = "VARCHAR(255) DEFAULT 'savings'")
    String accountType;
    //    @ManyToOne
    //    @JoinColumn(name = "userId")
    //    @JsonManagedReference
    //    User user;
    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "user_id")
    @JsonIgnoreProperties("accounts")
    User user;


    @OneToOne(mappedBy = "account", cascade = CascadeType.ALL)
    @JsonManagedReference
    private Card card;

    @OneToMany(mappedBy = "account", cascade = CascadeType.ALL)
    @JsonManagedReference
    @JsonIgnore
    List<TransactionHistory> transactionHistories;

}
