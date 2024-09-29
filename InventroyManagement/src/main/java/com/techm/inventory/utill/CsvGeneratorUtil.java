package com.techm.inventory.utill;

import com.opencsv.CSVWriter;
import com.techm.inventory.model.Product;

import java.io.IOException;
import java.io.StringWriter;
import java.io.Writer;
import java.util.List;

public class CsvGeneratorUtil {
    private static final String CSV_HEADER = "ID,ProductName,Price,Description,Category\n";

    public String generateCsv(List<Product> products) {
        StringWriter csvContent = new StringWriter();
        csvContent.append(CSV_HEADER);

        for (Product product : products) {
            csvContent.append(product.getId().toString())
                    .append(",")
                    .append(product.getProductName())
                    .append(",")
                    .append(product.getPrice().toString())
                    .append(",")
                    .append(product.getDescription())
                    .append(",")
                    .append(product.getCategory())
                    .append("\n");
        }

        return csvContent.toString();
    }
    public void generateCsvUsingCsvWriter(Writer writer, List<Product> products) throws IOException {
        try (CSVWriter csvWriter = new CSVWriter(writer)) {
            String[] header = { "ID", "Name", "Description", "Price" };
            csvWriter.writeNext(header);

            for (Product product : products) {
                String[] data = {
                        product.getId().toString(),
                        product.getProductName(),
                        product.getDescription(),
                        product.getPrice().toString()
                };
                csvWriter.writeNext(data);
            }
        }
    }
}