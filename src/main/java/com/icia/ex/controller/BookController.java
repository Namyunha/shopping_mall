package com.icia.ex.controller;

import com.icia.ex.dto.BookDTO;
import com.icia.ex.dto.BookFileDTO;
import com.icia.ex.dto.BooksDTO;
import com.icia.ex.dto.CartDTO;
import com.icia.ex.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/book")
public class BookController {

    @Autowired
    private BookService bookService;

    @GetMapping("/save")
    public String bookSave() {
        return "/bookPages/bookSave";
    }
    @PostMapping("/save")
    public String saveParam(@ModelAttribute BookDTO bookDTO) throws IOException {
        System.out.println(bookDTO);
        bookService.save(bookDTO);
        return "/bookPages/bookshop";
    }

    @GetMapping("/shop")
    public String shop(Model model) {
        List<BooksDTO> bookFileDTOList = bookService.findAll();
        System.out.println(bookFileDTOList);
        model.addAttribute("bookFileList", bookFileDTOList);
        return "/bookPages/bookShop";
    }



    @GetMapping("/detail")
    public String bookDetail(@RequestParam("bookId") Long bookId, Model model) {
        BooksDTO booksDTO = bookService.findById(bookId);

        model.addAttribute("booksDTO", booksDTO);

        return "/bookPages/bookDetail";
    }

    @GetMapping("/cart")
    public String bookCart(Model model){
        List<BooksDTO> booksDTOList = bookService.findBooksList();
        System.out.println(booksDTOList);
        model.addAttribute("bookList", booksDTOList);
        return "/bookPages/bookCart";
    }

    @PostMapping("/cart")
    public ResponseEntity cartParam(@ModelAttribute CartDTO cartDTO) {
        System.out.println(cartDTO);
        bookService.cartSave(cartDTO);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
