package com.techm.inventory.utill;

import com.lowagie.text.*;
import com.lowagie.text.pdf.*;
import com.techm.inventory.model.PurchasedHistory;
import com.techm.inventory.model.UserCart;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class SellPdfGenerator {

    public void singleSellPdfGenerator(PurchasedHistory purchasedHistory, HttpServletResponse response) throws IOException {
        Document document = new Document(PageSize.A4);
        PdfWriter.getInstance(document, response.getOutputStream());

        document.open();
        Font fontTitle = FontFactory.getFont(FontFactory.TIMES_ROMAN);
        fontTitle.setSize(20);
        Paragraph para1 = new Paragraph("Product Bill", fontTitle);
        para1.setAlignment(Paragraph.ALIGN_CENTER);
        document.add(para1);

        Font fontBody=FontFactory.getFont(FontFactory.HELVETICA);
        String customerName="Customer Name : "+purchasedHistory.getUser().getFirstName()+" "+purchasedHistory.getUser().getLastName();
        String purchaseDate="Purchase Date : "+purchasedHistory.getPurchasedDateTime().toString().substring(0,10);
        String paymentMethod="Payment Method : "+purchasedHistory.getPaymentMethod();


        Paragraph userDetails=new Paragraph(customerName,fontBody);
        userDetails.setAlignment(Paragraph.ALIGN_LEFT);
        document.add(userDetails);

        Paragraph purchaseDetails = new Paragraph(purchaseDate, fontBody);
        purchaseDetails.setAlignment(Paragraph.ALIGN_LEFT);
        document.add(purchaseDetails);

        Paragraph paymentDetails = new Paragraph(paymentMethod, fontBody);
        paymentDetails.setAlignment(Paragraph.ALIGN_LEFT);
        document.add(paymentDetails);

        //Table
        PdfPTable table = new PdfPTable(5);
        table.setWidthPercentage(100f);
        table.setWidths(new int[]{3, 3, 3, 3, 3});
        table.setSpacingBefore(5);

        PdfPCell cell = new PdfPCell();
        cell.setBackgroundColor(CMYKColor.DARK_GRAY);
        cell.setPadding(5);

        Font font = FontFactory.getFont(FontFactory.TIMES_ROMAN);
        font.setColor(CMYKColor.WHITE);

        cell.setPhrase(new Phrase("Product Name", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("Product Code", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("Price", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("Quantity", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("Total Price", font));
        table.addCell(cell);
        Double totalPrice = 0.0;
        for (UserCart cart : purchasedHistory.getProductCart()) {
            table.addCell(String.valueOf(cart.getProductName()));
            table.addCell(String.valueOf(cart.getProductCode()));
            table.addCell(String.valueOf(cart.getPrice()));
            table.addCell(String.valueOf(cart.getQuantity()));
            table.addCell(String.valueOf(cart.getTotalPrice()));
            totalPrice += cart.getTotalPrice();
        }
        table.addCell("Total");
        table.addCell("");
        table.addCell("");
        table.addCell("");
        table.addCell(String.valueOf(totalPrice));
        document.add(table);
        document.close();
    }
    public void singleSellPdfGeneratorForCustomer(PurchasedHistory purchasedHistory, HttpServletResponse response) throws IOException {
        Document document = new Document(PageSize.A4);
        PdfWriter.getInstance(document, response.getOutputStream());

        document.open();
        Font fontTitle = FontFactory.getFont(FontFactory.TIMES_ROMAN);
        fontTitle.setSize(20);
        Paragraph para1 = new Paragraph("Product Bill", fontTitle);
        para1.setAlignment(Paragraph.ALIGN_CENTER);
        document.add(para1);


        Font fontBody=FontFactory.getFont(FontFactory.HELVETICA);
        String customerName="Customer Name : "+purchasedHistory.getUser().getFirstName()+" "+purchasedHistory.getUser().getLastName();
        String purchaseDate="Purchase Date : "+purchasedHistory.getPurchasedDateTime().toString().substring(0,10);
        String paymentMethod="Payment Method : "+purchasedHistory.getPaymentMethod();


        Paragraph userDetails=new Paragraph(customerName,fontBody);
        userDetails.setAlignment(Paragraph.ALIGN_LEFT);
        document.add(userDetails);

        Paragraph purchaseDetails = new Paragraph(purchaseDate, fontBody);
        purchaseDetails.setAlignment(Paragraph.ALIGN_LEFT);
        document.add(purchaseDetails);

        Paragraph paymentDetails = new Paragraph(paymentMethod, fontBody);
        paymentDetails.setAlignment(Paragraph.ALIGN_LEFT);
        document.add(paymentDetails);

        //Table
        PdfPTable table = new PdfPTable(5);
        table.setWidthPercentage(100f);
        table.setWidths(new int[]{3, 3, 3, 3, 3});
        table.setSpacingBefore(5);

        PdfPCell cell = new PdfPCell();
        cell.setBackgroundColor(CMYKColor.ORANGE);
        cell.setPadding(5);

        PdfPCell cell2 = new PdfPCell();
        cell2.setBackgroundColor(CMYKColor.WHITE);
        cell2.setPadding(5);

        Font font = FontFactory.getFont(FontFactory.TIMES_ROMAN);
        font.setColor(CMYKColor.WHITE);

        Font font2=FontFactory.getFont(FontFactory.COURIER_BOLD);
        font2.setColor(CMYKColor.BLACK);
        font2.setSize(15);


        cell.setPhrase(new Phrase("Product Name", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("Product Code", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("Price", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("Quantity", font));
        table.addCell(cell);
        cell.setPhrase(new Phrase("Total Price", font));
        table.addCell(cell);
        Double totalPrice = 0.0;
        for (UserCart cart : purchasedHistory.getProductCart()) {
            table.addCell(String.valueOf(cart.getProductName()));
            table.addCell(String.valueOf(cart.getProductCode()));
            table.addCell(String.valueOf(cart.getPrice()));
            table.addCell(String.valueOf(cart.getQuantity()));
            table.addCell(String.valueOf(cart.getTotalPrice()));
            totalPrice += cart.getTotalPrice();
        }
        table.addCell("Total");
        table.addCell("");
        table.addCell("");
        table.addCell("");
        cell2.setPhrase(new Phrase(String.valueOf(totalPrice),font2));
//        table.addCell(String.valueOf(totalPrice));
        table.addCell(cell2);
        document.add(table);
        document.close();
    }
}
