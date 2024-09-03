package com.example.library.rzd.srevices;

import com.example.library.rzd.models.Author;
import com.example.library.rzd.models.Book;

import java.util.List;

public interface BookService {
    List<Book> findAll();
    Book findById(Long id);
    List<Book> searchByTitle(String title);
    void save(Book book);
    List<Book> findLatestBooks(int limit);
    List<Book> getAuthorBooks(Author author);
}
