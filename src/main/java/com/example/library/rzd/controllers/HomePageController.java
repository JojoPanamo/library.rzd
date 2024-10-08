package com.example.library.rzd.controllers;

import com.example.library.rzd.models.Book;
import com.example.library.rzd.srevices.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class HomePageController {
    @Autowired
    private BookService bookService;

    //Отображение начальной страницы
    @GetMapping("/")
    public String homePage(Model model) {
        //на главной странице отображаются последние 10 книг
        List<Book> latestBooks = bookService.findLatestBooks(10);
        model.addAttribute("books", latestBooks);
        return "home";
    }
}
