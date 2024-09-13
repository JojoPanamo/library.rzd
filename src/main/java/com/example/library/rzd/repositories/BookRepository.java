package com.example.library.rzd.repositories;


import com.example.library.rzd.models.Book;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BookRepository extends JpaRepository<Book, Long> {
    //Логика поиска по названию книги без учета регистра
    List<Book> findByTitleContainingIgnoreCase(String title);
    //Логика поиска по имени автора без учета регистра
    List<Book> findByAuthorsNameContainingIgnoreCase(String authorName);
}
