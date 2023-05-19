package com.icia.ex.dto;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AddressDTO {
    private Long id;
    private Long userId;
    private String addressName;
    private String receiver;
    private String phone_number;
    private String address;
    private boolean isDefault;
}
