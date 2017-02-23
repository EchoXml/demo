package com.echo.web.job;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.echo.service.BookService;

/**
 * 图书相关定时器
 * @author Echo
 *
 */

public class BookJob {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private BookService bookService;
	
	/**
	 * 每十分钟打印图书相关记录
	 */
	@Scheduled(cron = "0 */10 * * * ?")
	public void printInfo(){
		logger.info("定时任务开启");
		logger.info("图书总信息如下："+bookService.getBookRec());
	}

}
