package com.example.library.rzd.controllers;

import com.example.library.rzd.models.Author;
import com.example.library.rzd.models.Book;
import com.example.library.rzd.srevices.AuthorService;
import com.example.library.rzd.srevices.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import java.util.List;

@Controller
@RequestMapping("/authors")
public class AuthorController {

    @Autowired
    private BookService bookService;

    @Autowired
    private AuthorService authorService;

    @GetMapping
    public String listAuthors(Model model) {
        List<Author> authors = authorService.findAll();
        model.addAttribute("authors", authors);
        return "authors";
    }

    @GetMapping("/{id}")
    public String getAuthorBooks(@PathVariable Long id, Model model) {
        Author author = authorService.findById(id);
        List<Book> books = bookService.getAuthorBooks(author);
        model.addAttribute("author", author);
        model.addAttribute("books", books);
        return "author-books";
    }

    @GetMapping("/search")
    public String searchAuthors(@RequestParam String name, Model model) {
        List<Author> authors = authorService.searchByName(name);
        model.addAttribute("authors", authors);
        return "authors";
    }
}
