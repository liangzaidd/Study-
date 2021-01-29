package com.controller;

import com.pojo.Books;
import com.service.BookService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/book")
public class MyController {
    private BookService bookService;
    @Autowired
    public void setBookService(BookService bookService) {
        this.bookService = bookService;
    }
    //查询书籍
    @RequestMapping("/welcome")
    public String welcome(Model model){
        List<Books> allBooks = bookService.getAllBooks();
        model.addAttribute("list",allBooks);
        return "welcome";
    }
    //增加书籍页
    @RequestMapping("/add")
    public String addPage( ){
        return "addBook";
    }

    //增加书籍
    @RequestMapping("/addBook")
    public String addBook(Books books){
        bookService.addBook(books);
        return "redirect:/book/welcome";
    }

    //修改书籍页
    @RequestMapping("/update/{bookID}")
    public String updateBookPage(@PathVariable int bookID,Model model){
        Books book = bookService.getBookById(bookID);
        model.addAttribute("msg",book);
        return "updateBook";
    }

    //修改书籍
    @RequestMapping("/update")
    public String updateBook(Books books){
        bookService.updateBook(books);
        return "redirect:/book/welcome";
    }

    //删除书籍
    @RequestMapping("/delete/{bookID}")
    public String deleteBook(@PathVariable int bookID){
        bookService.deleteBook(bookID);
        return "redirect:/book/welcome";
    }

    //查询书籍
    @RequestMapping("/searchBook")
    @ResponseBody
    public List<Books> searchBook(@RequestParam String bookName,Model model){
        if (bookName==null||bookName.length()==0){
            model.addAttribute("error","请输入您要查找的书名");
            return null;
        }else {
            List<Books> books = bookService.getLikeBook(bookName);
            return books;
        }
    }










}
