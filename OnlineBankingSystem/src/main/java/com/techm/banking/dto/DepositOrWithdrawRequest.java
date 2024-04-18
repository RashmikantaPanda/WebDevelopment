package com.techm.banking.dto;

import lombok.Data;

@Data
public class DepositOrWithdrawRequest {
    String accountNo;
    Double amount;
    String password;
}
