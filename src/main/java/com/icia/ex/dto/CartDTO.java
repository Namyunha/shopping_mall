package com.icia.ex.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CartDTO {
    private Long id;
    private Long bookId;
    private Long bookCount;
}
