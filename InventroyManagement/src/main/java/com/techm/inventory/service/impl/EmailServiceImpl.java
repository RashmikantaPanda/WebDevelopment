package com.techm.inventory.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.techm.inventory.dto.EmailDto;
import com.techm.inventory.service.EmailService;

import jakarta.mail.internet.MimeMessage;

@Service
public class EmailServiceImpl implements EmailService {

	@Autowired
	private JavaMailSender javaMailSender;

	@Value("${spring.mail.username}")
	private String sender;

	@Override
	public String sendSimpleMail(EmailDto emailDto) {
		try {
			SimpleMailMessage mailMessage = new SimpleMailMessage();
			mailMessage.setFrom(sender);
			mailMessage.setTo(emailDto.getReceiver());
			mailMessage.setSubject(emailDto.getSubject());
			mailMessage.setText(emailDto.getBody());
			javaMailSender.send(mailMessage);
			return "Mail Send Successfully";
		} catch (Exception e) {
			System.out.println("Mail Sending Failed");
		}
		return "Mail Send Failed";
	}

	@Override
	public String sendMailWithHtmlBody(EmailDto emailDto) {

		MimeMessage mimeMessage = javaMailSender.createMimeMessage();

		try {
			MimeMessageHelper mailMessage = new MimeMessageHelper(mimeMessage, true);
			mailMessage.setFrom(sender);
			mailMessage.setTo(emailDto.getReceiver());
			mailMessage.setSubject(emailDto.getSubject());
			mailMessage.setText(emailDto.getBody(), true);
			javaMailSender.send(mimeMessage);
			return "Mail Send Successfully";
		} catch (Exception e) {
			System.out.println("Mail Sending Failed");
		}
		return "Mail Send Failed";
	}

	@Override
	public String sendMailWithAttachment(EmailDto emailDto) {
		MimeMessage mimeMessage = javaMailSender.createMimeMessage();

		try {
			MimeMessageHelper mailMessage = new MimeMessageHelper(mimeMessage, true);
			mailMessage.setFrom(sender);
			mailMessage.setTo(emailDto.getReceiver());
			mailMessage.setSubject(emailDto.getSubject());
			mailMessage.setText(emailDto.getBody(), true);
			
//			FileSystemResource file=new FileSystemResource(new File());
//			mailMessage.addAttachment(file.getFilename(), file);
			
			javaMailSender.send(mimeMessage);
			
			return "Mail Send Successfully";
		} catch (Exception e) {
			System.out.println("Mail Sending Failed");
		}
		return "Mail Send Failed";
	}
}
