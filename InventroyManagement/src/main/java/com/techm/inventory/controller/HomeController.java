package com.techm.inventory.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping()
    public String home() {
        return "home_page";
    }

    @GetMapping("/home")
    public String home2() {
        return "home_page";
    }

    @GetMapping("/login")
    public String userLogin(HttpSession session) {
        return "redirect:/user/login";
    }

}
