package com.icia.ex.controller;

import com.icia.ex.dto.BookDTO;
import com.icia.ex.dto.BookFileDTO;
import com.icia.ex.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/book")
public class BookController {

    @Autowired
    private BookService bookService;

    @GetMapping("/save")
    public String bookSave() {
        return "/customerPages/bookSave";
    }

    @PostMapping("/save")
    public String saveParam(@ModelAttribute BookDTO bookDTO) throws IOException {
        System.out.println(bookDTO);
        bookService.save(bookDTO);
        return "/customerPages/bookSave";
    }

    @GetMapping("/shop")
    public String shop(Model model) {
        List<BookFileDTO> bookFileDTOList = bookService.findAll();
        System.out.println(bookFileDTOList);
        model.addAttribute("bookFileList", bookFileDTOList);
        return "/customerPages/shop";
    }
}
