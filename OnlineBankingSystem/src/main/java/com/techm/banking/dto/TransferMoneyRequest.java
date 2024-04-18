package com.techm.banking.dto;

import com.techm.banking.model.Account;
import com.techm.banking.model.User;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
public class TransferMoneyRequest {
    private String fromAccountNo;
    private String toAccountNo;
    private Double amount;
    private String password;
}