package com.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.pojo.Books;
import com.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/book")
public class MyController {
    private BookService bookService;
    @Autowired
    public void setBookService(BookService bookService) {
        this.bookService = bookService;
    }
    //查询书籍
    @RequestMapping("/welcome/{offset}")
    public String welcome(@PathVariable int offset, Model model){
        PageHelper.offsetPage((offset-1)*5,5); // 分页
        List<Books> allBooks = bookService.getAllBooks(); //获取书籍
        /*int pages=bookService.getAllBooks().size(); // 获取书籍数量*/

        PageInfo<Books> pageInfo=new PageInfo<Books>(allBooks);
        Map<String, Object> map = new HashMap<>();
        map.put("list",allBooks);  // 存入属性
        map.put("pages",pageInfo.getPages());  // 存入页面数量
        /*map.put("pages",(int)Math.ceil((double)pages/5)); */ // 存入页面数量
        map.put("page",pageInfo.getPageNum());  // 当前页面
        model.addAllAttributes(map);
        return "welcome";
    }
    //查询书籍
    @RequestMapping("/welcome")
    public String welcome(){
        return "redirect:/book/welcome/1";
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
    public String searchBook(@RequestParam String bookName,Model model){
            List<Books> books = bookService.getLikeBook(bookName);
            if (books.isEmpty()){
                model.addAttribute("error","未找到结果请重新输入");
            }
            model.addAttribute("list",books);
            return "SearchBook";
    }










}
