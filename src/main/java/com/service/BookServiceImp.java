package com.service;

import com.mapper.BookMapper;
import com.pojo.Books;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookServiceImp implements BookService {
    private BookMapper bookMapper;
    @Autowired
    public void setBookMapper(BookMapper bookMapper) {
        this.bookMapper = bookMapper;
    }

    @Override
    public List<Books> getAllBooks() {
        return bookMapper.getAllBooks();
    }

    @Override
    public Books getBookById(int id) {
        return bookMapper.getBookById(id);
    }

    @Override
    public int addBook(Books books) {
        return bookMapper.addBook(books);
    }

    @Override
    public int deleteBook(int id) {
        return bookMapper.deleteBook(id);
    }

    @Override
    public int updateBook(Books books) {
        return bookMapper.updateBook(books);
    }

    @Override
    public List<Books> getLikeBook(String name) {
        return bookMapper.getLikeBook(name);
    }
}
