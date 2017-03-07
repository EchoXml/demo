package com.echo.web.cxf.impl;

import com.echo.model.Book;
import com.echo.model.BookRec;
import com.echo.service.BookService;
import com.echo.web.cxf.BookWs;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.jws.WebService;

/**
 * Created by Echo on 2017-03-02.
 */
@Component("bookws")
@WebService
public class BookWsImpl implements BookWs {

    @Autowired
    private BookService bookService;

    @Override
    public BookRec GetBookRec() {
        return bookService.getBookRec();
    }

    @Override
    public Book GetBookNumByBookId(Long bookId) {
        return bookService.getBookById(bookId);
    }
}
