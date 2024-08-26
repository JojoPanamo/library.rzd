package com.example.library.rzd.controllers;

import com.example.library.rzd.models.HomePage;
import com.example.library.rzd.srevices.HomePageService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequiredArgsConstructor
public class HomePageController {
    private final HomePageService homePageService;

    @GetMapping("/")
    public String homeController(Model model) {
        model.addAttribute("home", homePageService.homePageList());
        return "home";
    }
    @PostMapping("/home/create")
    public String createBook(HomePage homePage) {
        homePageService.saveHomePage(homePage);
        return "redirect:/";
    }
    @PostMapping("/bookInfo/{id}")
    public String deleteBook(@PathVariable Long id) {
        homePageService.deleteHomePage(id);
        return "redirect:/";
    }
    @GetMapping("/bookInfo/{id}")
    public String bookInfo(@PathVariable Long id, Model model) {
        model.addAttribute("bookInfo", homePageService.getBookById(id));
        return "bookInfo";
    }
}
