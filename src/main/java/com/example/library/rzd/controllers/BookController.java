package com.example.library.rzd.controllers;

import com.example.library.rzd.models.Author;
import com.example.library.rzd.models.Book;
import com.example.library.rzd.srevices.AuthorService;
import com.example.library.rzd.srevices.BookService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequiredArgsConstructor
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
        return "all_books";
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
        return "all_books";
    }

    @GetMapping("/add")
    public String showAddBookForm(Model model) {
        List<Author> existingAuthors = authorService.findAll();
        model.addAttribute("existingAuthors", existingAuthors);
        model.addAttribute("book", new Book());
        return "add-book";
    }


    @PostMapping("/add")
    public String addBook(@ModelAttribute Book book, @RequestParam(required = false) List<String> existingAuthors, @RequestParam(required = false) String authorNames, Model model) {
        String trimmedTitle = book.getTitle().trim();
        List<String> trimmedAuthorsNames = List.of(authorNames.split(",")).stream().map(String::trim).toList();

        if (trimmedTitle.isEmpty() && (trimmedAuthorsNames.isEmpty() || existingAuthors.isEmpty())) {
            model.addAttribute("error", "Название книги и имена авторов не могут содержать только пробелы.");
            model.addAttribute("book", book);
            model.addAttribute("existingAuthors", authorService.findAll());
            return "add-book";
        }

        List<Author> authors = new ArrayList<>();

        for (String authorId : existingAuthors) {
            if (!authorId.isEmpty()) {
                Author author = authorService.findById(Long.parseLong(authorId));
                if (author != null) {
                    authors.add(author);
                }
            }
        }
        for (String authorName : trimmedAuthorsNames) {
            if (!authorName.isEmpty()) {
                Author author = authorService.findByName(authorName);
                if (author == null) {
                    author = new Author();
                    author.setName(authorName);
                    authorService.save(author);
                }
                authors.add(author);
            }
        }

        book.setAuthors(authors);
        bookService.save(book);
        return "redirect:/";
    }
}

