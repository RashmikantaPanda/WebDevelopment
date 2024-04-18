package com.techm.banking.service;

import com.techm.banking.dto.EmailDto;

public interface EmailService {

    String sendSimpleMail(EmailDto details);

    String sendMailWithAttachment(EmailDto details);

    String sendMailWithHtmlBody(EmailDto details);
}