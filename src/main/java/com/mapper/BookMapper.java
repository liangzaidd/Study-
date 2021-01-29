package com.mapper;

import com.pojo.Books;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;


public interface BookMapper {
    //获取所有书籍
    List<Books> getAllBooks();
    //单本书籍
    Books getBookById(@Param("bookID")int id);
    //增加书籍
    int addBook(Books books);
    //删除书籍
    int deleteBook(@Param("bookID")int id);
    //修改书籍
    int updateBook(Books books);
    //模糊查询书籍
    List<Books> getLikeBook(@Param("bookName")String name);
}
