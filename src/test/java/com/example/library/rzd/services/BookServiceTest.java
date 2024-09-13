package com.example.library.rzd.services;

import com.example.library.rzd.models.Author;
import com.example.library.rzd.models.Book;
import com.example.library.rzd.repositories.BookRepository;
import com.example.library.rzd.srevices.BookService;
import com.example.library.rzd.srevices.BookServiceImpl;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
public class BookServiceTest {

    @Autowired
    private BookServiceImpl bookService;

    @Autowired
    private BookRepository bookRepository;

    @Test
    public void testSaveBook() {

        Author author = new Author();
        author.setName("Test Author");

        Book book = new Book();
        book.setTitle("Test Book");
        book.getAuthors().add(author);

        bookService.save(book);

        List<Book> books = bookService.findAll();
        assertFalse(books.isEmpty());

        Book savedBook = books.stream()
                .filter(b -> "Test Book".equals(b.getTitle()))
                .findFirst()
                .orElse(null);

        assertNotNull(savedBook);

        assertEquals("Test Book", savedBook.getTitle());

        assertFalse(savedBook.getAuthors().isEmpty());
        assertEquals("Test Author", savedBook.getAuthors().iterator().next().getName());

        assertNotNull(savedBook.getId());
    }
}
