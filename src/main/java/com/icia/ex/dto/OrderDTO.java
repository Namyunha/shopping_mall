package com.icia.ex.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Timestamp;
import java.util.List;

@Getter
@Setter
@ToString

public class OrderDTO {
    private Long id;
    private Long customerId;
    private Long sumCount;
    private Long sumPrice;
    private String customerName;
    private String payConditions;
    private String shipmentConditions;
    private String address;
    private String email;
    private Timestamp createdDate;
    private List<BooksDTO> books;
}
