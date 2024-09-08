package com.example.library.rzd.repositories;


import com.example.library.rzd.models.Book;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BookRepository extends JpaRepository<Book, Long> {
    List<Book> findByTitleContainingIgnoreCase(String title);
    List<Book> findByAuthorsNameContainingIgnoreCase(String authorName);
}
