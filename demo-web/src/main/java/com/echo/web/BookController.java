package com.echo.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.echo.dto.AppointExcuetion;
import com.echo.dto.Result;
import com.echo.enums.DelStateEnum;
import com.echo.model.Appointment;
import com.echo.model.Book;
import com.echo.model.UserInfo;
import com.echo.service.AppointmentService;
import com.echo.service.BookService;
import com.google.gson.Gson;

@Controller
@RequestMapping("/book") // url:/模块/资源/{id}/细分 /seckill/list
public class BookController {
	
	private Logger logger=LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private BookService bookService;
	@Autowired
	private AppointmentService appointmentService;
	

	
	//获取获取图书信息
	@RequestMapping("/ajax/getBooks")
	@ResponseBody
	public List<Book> getBooks(){
		List<Book> books=bookService.getAllBooks();
		logger.info("获取到的图书信息："+new Gson().toJson(books));
		return books;
	}
	
	//获取图书预约信息
	@RequestMapping("/ajax/getAppointments")
	@ResponseBody
	public List<Appointment> getAppointments(){
		Subject currUser=SecurityUtils.getSubject();
		
		//Integer userId=currUser.isPermitted("book:apoint")?currUser.getPrincipal()
		
		List<Appointment> appointments=appointmentService.queryAppointmentsByUserId(null);
		logger.info("获取到的预约信息："+new Gson().toJson(appointments));
		return appointments;
	}
	
	//添加图书
	@RequestMapping(value="/addBook.do",method = {RequestMethod.POST,RequestMethod.GET})
	private ModelAndView addBook(String name,int number){
		Integer insert=bookService.addBook(name, number);
		ModelAndView m=new ModelAndView();
		if (insert==1) {
			m.addObject("addBookMsg", "添加成功！");
		}else{
			m.addObject("addBookMsg", "服务器异常！");
		}
		 m.setViewName("forward:/page/booklist");
		return m;
		
	}

    @RequestMapping(value = "/ajax/{bookId}/appoint.do", method = {RequestMethod.POST,RequestMethod.GET})
    @ResponseBody
    private Result<AppointExcuetion> appoint(@PathVariable("bookId") Long bookId) {
    	//获取登录用户Id(未完成)
    	long userId=0;
        AppointExcuetion execution = bookService.appoint(bookId, userId);
        return new Result<AppointExcuetion>(true, execution);
    }
    
    //删除图书
    @RequestMapping(value = "/ajax/delBook/{bookId}", method = {RequestMethod.POST,RequestMethod.GET})
    @ResponseBody
    private Result<DelStateEnum> del(@PathVariable("bookId") Long bookId) {
        DelStateEnum del = bookService.delBook(bookId);
        if (del==DelStateEnum.SUCCESS) {
        	return new Result<DelStateEnum>(true, del);
		}else{
			return new Result<DelStateEnum>(false, del);
		}
       
    }
    
    
    @RequestMapping(value = "/{bookId}/updateBook.do", method = {RequestMethod.POST,RequestMethod.GET})
    private ModelAndView updateBook(@PathVariable("bookId") Long bookId,String name,int number) {
        int update = bookService.updateBook(bookId, name, number);
        ModelAndView m=new ModelAndView();
        if (update==1) {
        	m.addObject("updateMsg","修改成功！");
		}else{
			m.addObject("updateMsg", "修改失败！");
		}
        m.setViewName("forward:/page/booklist");
        return m;
       
    }
}