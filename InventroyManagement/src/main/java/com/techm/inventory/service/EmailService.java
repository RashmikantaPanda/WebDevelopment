package com.techm.inventory.service;

import com.techm.inventory.dto.EmailDto;

public interface EmailService {
	String sendSimpleMail(EmailDto EmailDto);

	String sendMailWithAttachment(EmailDto emailDto);

	String sendMailWithHtmlBody(EmailDto emailDto);
}
