package com.example.library.rzd.srevices;

import com.example.library.rzd.models.Author;
import com.example.library.rzd.repositories.AuthorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AuthorServiceImpl implements AuthorService {
    @Autowired
    private AuthorRepository authorRepository;

    //Возвращает список авторов, отсортированных по возрастанию
    @Override
    public List<Author> findAll() {
        return authorRepository.findAll(Sort.by(Sort.Direction.ASC, "name"));
    }
    //Взвращает автора по его id
    @Override
    public Author findById(Long id) {
        return authorRepository.findById(id).orElse(null);
    }
    //Взвращает автора по его имени
    @Override
    public Author findByName(String name) {
        return authorRepository.findByName(name);
    }
    //Метод для поиска автора по части имени без учета регистра
    @Override
    public List<Author> searchByName(String name) {
        return authorRepository.findByNameContainingIgnoreCase(name);
    }
    //Сохранение автора
    @Override
    public void save(Author author) {
        authorRepository.save(author);
    }
}
