package com.icia.ex.controller;


import com.icia.ex.dto.CustomerDTO;
import com.icia.ex.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/customer")
public class CustomerController {

@Autowired
    private CustomerService customerService;

    @GetMapping("/login")
    public String login() {
        return "/customerPages/customerLogin";
    }

    @PostMapping("/login")
    public String loginParam(){
        return "/";
    }

    @GetMapping("/save")
    public String save() {
        return "/customerPages/customerSave";
    }

    @PostMapping("/save")
    public String saveParam(@ModelAttribute CustomerDTO customerDTO) {
        System.out.println(customerDTO);
        customerService.save(customerDTO);
        return "/customerPages/customerLogin";
    }

}

