package com.example.library.rzd.srevices;

import com.example.library.rzd.models.Author;

import java.util.List;

public interface AuthorService {
    List<Author> findAll();
    Author findById(Long id);
    Author findByName(String name);
    List<Author> searchByName(String name);
    void save(Author author);
}
