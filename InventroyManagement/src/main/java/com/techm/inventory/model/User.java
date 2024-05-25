package com.techm.inventory.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer userId;
    private String firstName;
    private String lastName;
    private String email;
    private String password;
    private String phone;
    private String role;
    private LocalDateTime accountCreationDate;
    @Embedded
    private Address address;
    private Boolean isAccountActive=true;
    @OneToMany(mappedBy = "user")
    private List<PurchasedHistory> purchasedHistory;
}
