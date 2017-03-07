package com.echo.web.cxf;

import com.echo.model.Book;
import com.echo.model.BookRec;

import javax.jws.WebMethod;
import javax.jws.WebService;

/**
 * Created by Echo on 2017-03-02.
 */
@WebService
public interface BookWs {

    /**
     * 获取图书总记录
     * @return
     */
    public BookRec GetBookRec();

    /**
     * 根据图书编号获取图书信息
     * @param bookId
     * @return
     */
    public Book GetBookNumByBookId(Long bookId);
}
