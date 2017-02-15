package com.echo.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/adminlte")
public class AdminLteController {
	
	private Logger logger=LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping("/index")
	public String toIndex() {
		return "adminlte/index.jsp";
	}
	
	@RequestMapping("/index2")
	public String toIndex2() {
		return "adminlte/index2.jsp";
	}
	
	/**
	 * 跳转登录界面
	 * @return
	 */
	@RequestMapping("/login")
	public ModelAndView toLogin(){
		logger.info("接收到跳转登录界面请求");
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("adminlte/login.jsp");
		return modelAndView;
	}
	
	@RequestMapping("/register")
	public ModelAndView toRegister(){
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("adminlte/register.jsp");
		return modelAndView;
	}
	
	@RequestMapping("/bookList")
	public ModelAndView toBookList(){
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.setViewName("adminlte/bookList.jsp");
		return modelAndView;
	}
}
