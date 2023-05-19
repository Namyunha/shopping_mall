package com.icia.ex.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;

@Controller
public class HomeController {
    @GetMapping("/")
    public String index(HttpSession session, Model model) {
        String id = (String)session.getAttribute("loginDTO");
        model.addAttribute("id", id);
        return "index";
    }

}
