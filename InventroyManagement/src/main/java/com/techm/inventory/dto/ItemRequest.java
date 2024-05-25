package com.techm.inventory.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ItemRequest {
    private String productName;
    private String productId;
    private String category;
    private String description;
    private Integer quantity;
    private MultipartFile file;
    private Double price;
}
