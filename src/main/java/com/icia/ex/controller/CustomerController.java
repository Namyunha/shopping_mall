package com.icia.ex.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/customer")
public class CustomerController {

    @GetMapping("/login")
    public String login() {
        return "/customerPages/customerLogin";
    }

    @GetMapping("/save")
    public String save() {
        return "/customerPages/customerSave";
    }


}

