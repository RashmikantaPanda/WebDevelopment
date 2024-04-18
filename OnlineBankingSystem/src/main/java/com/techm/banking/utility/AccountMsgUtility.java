package com.techm.banking.utility;

import com.techm.banking.model.Account;
import com.techm.banking.model.User;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class AccountMsgUtility {
    public static String accountCreateWithoutCardMsg(Account account, User user) {
        String emailBodyMsg = """
                <p>Hello %s %s</p>
                <p>Your account is created successfully</p>
                <br>
                <p><b>Account No: %s</b></p>
                <br>
                <p>Account Type: %s</p>
                <br>
                <p>Note: Your transaction password will be same as your user password. You can modify that later.</p>
                """;

        String emailBody = String.format(emailBodyMsg, user.getFirstName(), user.getLastName(), account.getAccountNo(), account.getAccountType());

        return emailBody;
    }

    public static String accountCreatedMsg(Account account, User user) {
        String emailBodyMsg = """
                <p>Hello %s %s</p>
                <p>Your account is created successfully</p>
                <br>
                <p><b>Account No: %s</b></p>
                <p>Account Type: %s</p>
                <p>Your ATM card is generated successfully.Having card no %s , pin %s, expiry date %s.
                <br>
                <p>Note: Your transaction password will be same as your user password. You can modify that later.</p>
                """;

        String accountCreateMsg = String.format(emailBodyMsg, user.getFirstName(), user.getLastName(), account.getAccountNo(), account.getAccountType(),
                account.getCard().getCardNo(), account.getCard().getCardPin(), account.getCard().getExpiryDate());

        return accountCreateMsg;
    }

    public static String depositBalanceMsg(Account account, Double depositAmount) {
        String emailBodyMsg = """
                <p>Dear %s </p>
                <p>Your account XXXX%s is credited with %.2f INR. Available Balance %s </p>
                <p>On %s</p>
                """;

        LocalDateTime currentDateTime = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

        String formattedDateTime = currentDateTime.format(formatter);

        String depositBalanceMsg = String.format(emailBodyMsg,
                account.getUser().getFirstName(),
                account.getAccountNo().substring(9),
                depositAmount, account.getBalance(),
                formattedDateTime);

        return depositBalanceMsg;
    }

    public static String withdrawBalanceMsg(Account account, Double withdrawAmount) {
        String emailBodyMsg = """
                <p>Dear %s </p>
                <p>Your account XXXX%s is debited with %.2f INR. Available Balance %s </p>
                <p>On %s</p>
                """;

        LocalDateTime currentDateTime = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

        String formattedDateTime = currentDateTime.format(formatter);

        String withdrawBalanceMsg = String.format(emailBodyMsg,
                account.getUser().getFirstName(),
                account.getAccountNo().substring(9),
                withdrawAmount,
                account.getBalance(),
                formattedDateTime);

        return withdrawBalanceMsg;
    }

    public static String transferMoneyMsgForFromAccount(Account fromAccount, Account toAccount, Double amount) {
        String emailBodyMsgForFromEmail = """
                   <p>Dear %s </p>
                   <p>Your account XXXX%s is %s with %.2f INR and Credited to XXXX%s on %s</p>
                   <p>Available Balance %s</p>
                """;
        LocalDateTime currentDateTime = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String formattedDateTime = currentDateTime.format(formatter);

        //From Account (Debited)
        String fromAccEmailBody = String.format(emailBodyMsgForFromEmail,
                fromAccount.getUser().getFirstName(),
                fromAccount.getAccountNo().substring(9),
                "Debited",
                amount,
                toAccount.getAccountNo().substring(9),
                formattedDateTime,
                fromAccount.getBalance());

        return fromAccEmailBody;
    }

    public static String transferMoneyMsgForToAccount(Account fromAccount, Account toAccount, Double amount) {
        String emailBodyMsgForToEmail = """
                   <p>Dear %s </p>
                   <p>Your account XXXX%s is %s with %.2f INR send by %s Acc No: XXXX%s on %s</p>
                   <p>Available Balance %s</p>
                """;
        LocalDateTime currentDateTime = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String formattedDateTime = currentDateTime.format(formatter);

        String toAccEmailBody = String.format(emailBodyMsgForToEmail,
                toAccount.getUser().getFirstName(),
                toAccount.getAccountNo().substring(9),
                "Credited",
                amount,
                fromAccount.getUser().getFirstName() + " " + fromAccount.getUser().getLastName(),
                fromAccount.getAccountNo().substring(9),
                formattedDateTime,
                toAccount.getBalance());

        return toAccEmailBody;

    }
}
