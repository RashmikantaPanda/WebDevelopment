package com.techm.inventory.service.impl;

import com.techm.inventory.service.SmsService;
import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
public class SmsServiceImpl implements SmsService {
    @Value("${twilio.accountSid}")
    public String ACCOUNT_SID;

    @Value("${twilio.authToken}")
    public String AUTH_TOKEN;

    @Value("${twilio.phoneNumber}")
    public String PHONE_NO;

    @Override
    public String sendSimpleSmg(String toPhoneNo, String smsBody) {

        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
        Message message = Message.creator(
                        new com.twilio.type.PhoneNumber("+91"+toPhoneNo),
                        new com.twilio.type.PhoneNumber(PHONE_NO),
                        smsBody)
                .create();

        System.out.println(message.getSid());
        return message.getBody();
    }
}
