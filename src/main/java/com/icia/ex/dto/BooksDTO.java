package com.icia.ex.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Getter
@Setter
@ToString
public class BooksDTO {
    private Long id;
    private String bookName;
    private Long unitPrice; // 도서 가격
    private Long unitsInStock; // 재고수
    private String author; // 저자
    private String descript; // 설명
    private String publisher; // 출판사
    private String category;
    private String conditions; // 신규 or 중고 or E-Book
    private int fileAttached;
    private List<MultipartFile> bookFile;
    private String originalFileName;
    private String storedFileName;
    private Long bookId;
}
