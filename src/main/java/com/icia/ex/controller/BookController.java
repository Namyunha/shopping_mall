package com.icia.ex.controller;

import com.icia.ex.dto.*;
import com.icia.ex.service.BookService;
import com.icia.ex.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/book")
public class BookController {

    @Autowired
    private BookService bookService;
    @Autowired
    CustomerService customerService;

    @GetMapping("/save")
    public String bookSave(HttpSession session, Model model) {
        String id = (String) session.getAttribute("loginDTO");
        Long sellerId = customerService.findBySeller(id);
        System.out.println(sellerId);
        model.addAttribute("selId", sellerId);
        model.addAttribute("loginId", id);
        return "/bookPages/bookSave";
    }

    @PostMapping("/save")
    public String saveParam(@ModelAttribute BookDTO bookDTO, Model model) throws IOException {
        System.out.println(bookDTO);
        bookService.save(bookDTO);
        List<BooksDTO> bookFileDTOList = bookService.findAll();
        System.out.println(bookFileDTOList);
        model.addAttribute("bookFileList", bookFileDTOList);
        return "/bookPages/bookShop";
    }

    @GetMapping("/shop")
    public String shop(Model model, HttpSession session) {
        List<BooksDTO> bookFileDTOList = bookService.findAll();
        String id = (String) session.getAttribute("loginDTO");
        model.addAttribute("loginId", id);
        model.addAttribute("bookFileList", bookFileDTOList);
        return "/bookPages/bookShop";
    }

    @GetMapping("/detail")
    public String bookDetail(@RequestParam("bookId") Long bookId, Model model, HttpSession session) {
        BooksDTO booksDTO = bookService.findById(bookId);
        model.addAttribute("booksDTO", booksDTO);
        String id = (String) session.getAttribute("loginDTO");
        model.addAttribute("loginId", id);
        Long visitorId = customerService.findBySeller(id);
        model.addAttribute("sellerId", visitorId);
        return "/bookPages/bookDetail";
    }


    @GetMapping("/cart")
    public String bookCart(Model model, HttpSession session) {
        String loginId = (String) session.getAttribute("loginDTO");
        model.addAttribute("loginId", loginId);
        Long loginNum = bookService.findNum(loginId);
        List<BooksDTO> booksDTOList = bookService.findBooksList(loginNum);
        System.out.println("booksDTOList = " + booksDTOList);
        ResultDTO sumDTO = bookService.findSum(loginNum);
        System.out.println("sumDTO = " + sumDTO);
        model.addAttribute("bookList", booksDTOList);
        model.addAttribute("sumDTO", sumDTO);
        return "/bookPages/bookCart";
    }


    @PostMapping("/cart")
    public ResponseEntity cartParam(@ModelAttribute CartDTO cartDTO) {
        System.out.println("cartDTO = " + cartDTO);
        bookService.cartSave(cartDTO);
        return new ResponseEntity<>(HttpStatus.OK);
    }


    @GetMapping("/payment")
    public String payment(HttpSession session, Model model) {
        String loginId = (String) session.getAttribute("loginDTO");
        model.addAttribute("loginId", loginId);
        CustomerDTO customerDTO = customerService.findByUser(loginId);
        model.addAttribute("customerDTO", customerDTO);
        Long loginNum = bookService.findNum(loginId);
        List<BooksDTO> booksDTOList = bookService.findBooksList(loginNum);
        ResultDTO sumDTO = bookService.findSum(loginNum);
        System.out.println("booksDTOList = " + booksDTOList);
        System.out.println("sumDTO = " + sumDTO);
        model.addAttribute("bookList", booksDTOList);
        model.addAttribute("sumDTO", sumDTO);
        return "/bookPages/bookPayment";
    }

    @PostMapping("/payment")
    public ResponseEntity paymentParam(@ModelAttribute OrderDTO orderDTO) {
        bookService.saveOrder(orderDTO);
        return new ResponseEntity<>(HttpStatus.OK);
    }

}
