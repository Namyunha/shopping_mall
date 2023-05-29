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


    @PostMapping("delete")
    public ResponseEntity deleteParam(@RequestParam("id") Long id) {
        bookService.delete(id);
        return new ResponseEntity<>(HttpStatus.OK);
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


    @PostMapping("/detail")
    public ResponseEntity cartParam(@ModelAttribute CartDTO cartDTO) {
        System.out.println("cartDTO = " + cartDTO);
        Long customerId = cartDTO.getCustomerId();
        System.out.println("customerId = " + customerId);
        Long bookId = cartDTO.getBookId();
        System.out.println("bookId = " + bookId);
        bookService.cartSave(cartDTO);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @GetMapping("/cart")
    public String bookCart(Model model, HttpSession session) {
        String loginId = (String) session.getAttribute("loginDTO");
        model.addAttribute("loginId", loginId);
        Long loginNum = bookService.findNum(loginId);
//        CartDTO cartDTO = bookService.findCart(loginNum);
//        System.out.println("cartDTO = " + cartDTO);
        CustomerDTO customerDTO = customerService.findByUser(loginId);
        List<CbookDTO> cbookDTOList = customerService.cbookList(loginNum);
        model.addAttribute("customer", customerDTO);
        System.out.println("cbookDTOList = " + cbookDTOList);
        model.addAttribute("bookList", cbookDTOList);
//        model.addAttribute("cartDTO", cartDTO);
        return "/bookPages/bookCart";
    }

//    @PostMapping("cart")
//    {
    //        Map<String, Long> updateInfo = new HashMap<>();
    //        updateInfo.put("customerId", customerId);
    //        updateInfo.put("bookId", bookId);
    //        bookService.update(updateInfo);
//    }

    @GetMapping("/info")
    public String bookInfo() {
        return "/bookPages/bookInfo";
    }


    @GetMapping("/payment")
    public String payment(@ModelAttribute OrderDTO orderDTO, HttpSession session, Model model) {
        String loginId = (String) session.getAttribute("loginDTO");
        model.addAttribute("loginId", loginId);
        CustomerDTO customerDTO = customerService.findByUser(loginId);
        model.addAttribute("customerDTO", customerDTO);
        Long loginNum = bookService.findNum(loginId);
        List<CbookDTO> cbookDTOList = bookService.findBooksList(loginNum);
        System.out.println("booksDTOList = " + cbookDTOList);
        model.addAttribute("bookList", cbookDTOList);
        ResultDTO sumDTO = bookService.findSum(loginNum);
        System.out.println("sumDTO = " + sumDTO);
        model.addAttribute("sumDTO", sumDTO);
        return "/bookPages/bookPayment";
    }


    @PostMapping("/payment")
    public ResponseEntity paymentParam(@RequestBody List<ChangebookDTO> books) {


        System.out.println("changebookDTOList = " + books);
        bookService.changeSave(books);
        return new ResponseEntity(HttpStatus.OK);
    }


//    @PostMapping("/payment")
//    public ResponseEntity paymentParam(@ModelAttribute CbookDTO cBookDTO) {
//        Long bookId = cBookDTO.getBookId();
//        Long bookCount = cBookDTO.getBookCount();
//        Long unitsInStocks = cBookDTO.getUnitsInStock();
//        Map<String, Long> updateInfo = new HashMap<>();
//        System.out.println("cBookDTO: " + cBookDTO);
//        updateInfo.put("bookId", bookId);
//        updateInfo.put("bookCount", bookCount);
//        updateInfo.put("unitsInStocks", unitsInStocks);
//        System.out.println("updateInfo: "+updateInfo);
//        bookService.updateCart(updateInfo);
//        bookService.updateBook(updateInfo);
//        return new ResponseEntity<>(HttpStatus.OK);
//    }
}















