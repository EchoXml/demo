package com.echo.web;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.echo.model.Book;

/**
 * 页面跳转控制
 * @author Echo
 *
 */
@RequestMapping("page")
@Controller
public class PageController {
	
	/**
	 * 跳转登录界面
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(){
        return "login.jsp";
	}
	
	/**
	 * 跳转注册界面
	 * @return
	 */
	@RequestMapping(value="/register",method=RequestMethod.GET)
	public String toRegister(){
		return "register.jsp";
	}
	
	/**
	 * 跳转后台首页
	 * @return
	 */
	@RequestMapping("/index")
	public String toIndex() {
		return "index.jsp";
	}
	
	/**
	 * 信息中心V2
	 * @return
	 */
	@RequestMapping("/index2")
	public String toIndex2() {
		return "index2.jsp";
	}

	/**
	 * 跳转图书列表界面
	 * @param model
	 * @return
	 */
    @RequestMapping(value = "/bookList", method = {RequestMethod.POST,RequestMethod.GET})
	public String bookList(Model model){
        return "bookList.jsp";
	}
    
    /**
	 * 跳转用户列表界面
	 * @param model
	 * @return
	 */
    @RequestMapping(value = "/userList", method = {RequestMethod.POST,RequestMethod.GET})
	public String userList(Model model){
        return "userList.jsp";
	}
    
	@RequestMapping(value="/test",method = {RequestMethod.POST,RequestMethod.GET})
	public String test(){
		return "test.jsp";
	}
	
}
