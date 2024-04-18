package com.techm.banking.utility;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Random;

public class AccountUtility {
    private static Random random = new Random();

    public static String generateAccountNumber() {
        long timestamp = System.currentTimeMillis();
        int no=random.nextInt(1000,9999);
        String accNo = "0737"+String.valueOf(timestamp).substring(8,13)+ no;

        return accNo;
    }

    public static String generateAtmCardNumber(){
        long timestamp = System.currentTimeMillis();
        int no=random.nextInt(10000,99999);
        String cardNo="6525"+String.valueOf(timestamp).substring(1,9)+no;

        return cardNo;
    }

    public static void todayDateInYYMM(){
        LocalDate today = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yy/MM");
        String formattedDate = today.format(formatter);

        System.out.println("Today's date: " + formattedDate);
    }
    public static String todayDateInYYMMDD(){
        LocalDate today = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");

        return today.format(formatter);
    }
    public static String addYearInTodayDate(int n){
        LocalDate today = LocalDate.now();
        LocalDate newDate=today.plusYears(n);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");

        return newDate.format(formatter);
    }


}
