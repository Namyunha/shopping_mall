package com.icia.ex.controller;


import com.icia.ex.dto.BooksDTO;
import com.icia.ex.dto.CustomerDTO;
import com.icia.ex.dto.OrderDTO;
import com.icia.ex.service.BookService;
import com.icia.ex.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/customer")
public class CustomerController {

    @Autowired
    private CustomerService customerService;
    @Autowired
    private BookService bookService;
    @GetMapping("/login")
    public String login(HttpSession session) {
        return "/customerPages/customerLogin";
    }

    @PostMapping("/login")
    public String loginParam(@ModelAttribute CustomerDTO customerDTO, HttpSession session, Model model) {
        boolean dto = customerService.login(customerDTO);
        System.out.println(dto);
        if (dto) {
            session.setAttribute("loginDTO", customerDTO.getEmail());
            System.out.println(customerDTO);
            return "redirect: /";
        } else {
            model.addAttribute("booleanDTO", dto);
            return "redirect: /login";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect: /";
    }


    @GetMapping("/save")
    public String save() {
        return "/customerPages/customerSave";
    }


    @GetMapping("/mypage")
    public String mypage(HttpSession session, Model model) {
        String id = (String) session.getAttribute("loginDTO");
        model.addAttribute("loginId", id);

        Long loginNum = bookService.findNum(id);
        List<BooksDTO> booksDTOList = bookService.findBooksList(loginNum);
        System.out.println("booksDTOList = " + booksDTOList);
        List<OrderDTO> orderDTOList = customerService.orderList(id);
        System.out.println("orderDTOList = " + orderDTOList);
        Long number = customerService.countNum(loginNum);
        model.addAttribute("countNum", number);
        model.addAttribute("orderList", orderDTOList);
        model.addAttribute("bookList", booksDTOList);
        return "/customerPages/myPage";
    }


    @PostMapping("/save")
    public String saveParam(@ModelAttribute CustomerDTO customerDTO) {
        System.out.println(customerDTO);
        customerService.save(customerDTO);
        return "/customerPages/customerLogin";
    }


    @PostMapping("/emailCheck")
    public ResponseEntity emailCheck(@RequestParam("email") String email) {
        String duEmail = customerService.findByEmail(email);
        if (duEmail == null) {
            return new ResponseEntity<>(duEmail, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.CONFLICT);
        }
    }
}








