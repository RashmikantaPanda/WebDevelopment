package com.techm.banking.dto;

import com.techm.banking.model.Account;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class EmailDto {
    private String recipient;
    private String msgBody;
    private String subject;
    private String attachment;

    public EmailDto(Account account,String subject, String msgBody) {
        this.recipient = account.getUser().getEmail();
        this.msgBody = msgBody;
        this.subject = subject;
    }
}
