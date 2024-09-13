package com.example.library.rzd.srevices;

import com.example.library.rzd.models.Author;
import com.example.library.rzd.models.Book;
import com.example.library.rzd.repositories.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookServiceImpl implements BookService {
    @Autowired
    private BookRepository bookRepository;
    //Возвращает список книг, отсортированных по названию
    @Override
    public List<Book> findAll() {
        return bookRepository.findAll(Sort.by(Sort.Direction.ASC, "title"));
    }
    //Возвращает книгу по id
    @Override
    public Book findById(Long id) {
        return bookRepository.findById(id).orElse(null);
    }
    //Поиск книги по названию
    @Override
    public List<Book> searchByTitle(String title) {
        return bookRepository.findByTitleContainingIgnoreCase(title.trim());
    }
    //Сохранение книги
    @Override
    public void save(Book book) {
        bookRepository.save(book);
    }
    //Отображение последних 10 книг на главной странице
    @Override
    public List<Book> findLatestBooks(int limit) {
        Pageable pageable = PageRequest.of(0, limit, Sort.by(Sort.Direction.DESC, "id"));
        return bookRepository.findAll(pageable).getContent();
    }
    //Возвращает список книг автора
    @Override
    public List<Book> getAuthorBooks(Author author) {
        return bookRepository.findByAuthorsNameContainingIgnoreCase(author.getName());
    }
}
