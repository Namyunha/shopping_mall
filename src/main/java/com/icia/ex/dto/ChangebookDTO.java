package com.icia.ex.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

public class ChangebookDTO {
    private Long id;
    private Long customerId;
    private Long bookId;
    private Long cartId;
    private Long bookCount;
}


