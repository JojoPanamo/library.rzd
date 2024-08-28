package com.example.library.rzd.controllers;

import com.example.library.rzd.models.Book;
import com.example.library.rzd.srevices.AuthorService;
import com.example.library.rzd.srevices.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@Controller
@RequestMapping("/books")
public class BookController {
    @Autowired
    private BookService bookService;
    @Autowired
    private AuthorService authorService;

    @GetMapping
    public String listBooks(Model model) {
        List<Book> books = bookService.findAll();
        model.addAttribute("books", books);
        return "book";
    }

    @GetMapping("/{id}")
    public String getBookDetails(@PathVariable Long id, Model model) {
        Book book = bookService.findById(id);
        model.addAttribute("book", book);
        return "book-details";
    }

    @GetMapping("/search")
    public String searchBooks(@RequestParam String title, Model model) {
        List<Book> books = bookService.searchByTitle(title);
        model.addAttribute("books", books);
        return "book";
    }

    @GetMapping("/add")
    public String showAddBookForm(Model model) {
        model.addAttribute("book", new Book());
        model.addAttribute("authors", authorService.findAll());
        return "add-book";
    }

    @PostMapping("/add")
    public String addBook(@ModelAttribute Book book) {
        bookService.save(book);
        return "redirect:/";
    }
}

