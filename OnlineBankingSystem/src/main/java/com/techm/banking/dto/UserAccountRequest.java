package com.techm.banking.dto;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.techm.banking.model.Account;
import com.techm.banking.model.User;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserAccountRequest {
    private User user;
    private Account account;
}
