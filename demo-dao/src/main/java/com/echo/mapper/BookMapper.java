package com.echo.mapper;

import com.echo.model.Book;
import tk.mybatis.mapper.common.Mapper;

public interface BookMapper extends Mapper<Book> {

	int addNumber();

	int reduceNumber(Long bookId);
}