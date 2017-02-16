package com.echo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.echo.model.Book;
import com.echo.model.BookRec;

public interface BookDao {

	/**
     * 通过ID查询单本图书
     * 
     * @param id
     * @return
     */
    Book queryById(Long id);

    /**
     * 查询所有图书
     * 
     * @param offset 查询起始位置
     * @param limit 查询条数
     * @return
     */
    List<Book> queryAll(@Param("offset") int offset, @Param("limit") int limit);

    /**
     * 减少馆藏数量
     * 
     * @param bookId
     * @return 如果影响行数等于>1，表示更新的记录行数
     */
    int reduceNumber(long bookId);
    
    /**
     * 增加馆藏数量
     * @return
     */
    int addNumber();
    
    /**
     * 新增图书信息
     * @return
     */
    int addBook(@Param("name") String name,@Param("number") int number);
    
    /**
     * 删除图书信息
     * @param bookId 图书ID
     * @return
     */
    int delBook(@Param("bookId") Long bookId);
    
    /**
     * 获取库存图书信息
     * @return
     */
    BookRec getBookRec();
    
    /**
     * 更新图书信息
     */
    int updateBook(@Param("bookId") Long bookId,@Param("name") String name,@Param("number") int number);
}
