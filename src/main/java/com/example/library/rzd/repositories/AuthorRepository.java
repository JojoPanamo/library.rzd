package com.example.library.rzd.repositories;

import com.example.library.rzd.models.Author;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface AuthorRepository extends JpaRepository<Author, Long> {
    //Логика поиска по имени автора без учета регистра
    List<Author> findByNameContainingIgnoreCase(String name);
    Author findByName(String name);
}
