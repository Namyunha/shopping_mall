package com.icia.ex.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.Timestamp;

@Getter
@Setter
@ToString

public class OrderDTO {
    private Long id;
    private Long bookId;
    private Long customerId;
    private Long quantity;
    private Timestamp createdDate;
    private Timestamp updatedDate;
    private String memo;
}
