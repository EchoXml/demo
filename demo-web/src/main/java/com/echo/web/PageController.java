package com.echo.web;

import java.util.List;

import com.echo.service.WebInfoService;
import com.echo.util.DateUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.echo.model.Book;
import org.springframework.web.servlet.ModelAndView;

/**
 * 页面跳转控制
 * @author Echo
 *
 */
@RequestMapping("page")
@Controller
public class PageController {

	@Autowired
	private WebInfoService webInfoService;

	private Logger logger= LoggerFactory.getLogger(this.getClass());
	
	/**
	 * 跳转登录界面
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/login", method={RequestMethod.GET,RequestMethod.POST})
	public String login(){
        return "login.jsp";
	}
	
	/**
	 * 跳转注册界面
	 * @return
	 */
	@RequestMapping(value="/register",method={RequestMethod.GET,RequestMethod.POST})
	public String toRegister(){
		return "register.jsp";
	}
	
	/**
	 * 跳转后台首页
	 * @return
	 */
	@RequestMapping(value="/index",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView toIndex() {
		ModelAndView m=new ModelAndView();
		m.setViewName("index.jsp");
		String date=DateUtil.getNowTime("yyyy-MM-dd");
		logger.debug("当前日期："+date);
		m.addObject("webInfo",webInfoService.getWebInfoByDate(date));
		return m;
	}
	
	/**
	 * 信息中心V2
	 * @return
	 */
	@RequestMapping(value="/index2",method={RequestMethod.GET,RequestMethod.POST})
	public String toIndex2() {
		return "index2.jsp";
	}

	/**
	 * 跳转图书列表界面
	 * @param model
	 * @return
	 */
    @RequestMapping(value = "/booklist", method = {RequestMethod.POST,RequestMethod.GET})
	public String booklist(Model model){
        return "bookList.jsp";
	}
    
    /**
	 * 跳转用户列表界面
	 * @param model
	 * @return
	 */
    @RequestMapping(value = "/userlist", method = {RequestMethod.POST,RequestMethod.GET})
	public String userlist(Model model){
        return "userList.jsp";
	}
    
    /**
	 * 跳转预约列表界面
	 * @return
	 */
    @RequestMapping(value = "/appointmentlist", method = {RequestMethod.POST,RequestMethod.GET})
	public String appointList(){
        return "appointList.jsp";
	}
    
    /**
	 * 跳转访客记录列表界面
	 * @return
	 */
    @RequestMapping(value = "/visitlist", method = {RequestMethod.POST,RequestMethod.GET})
	public String visitList(){
        return "visitList.jsp";
	}

	/**
	 * 跳转SQL语句监控列表界面
	 * @return
	 */
	@RequestMapping(value = "/sqllist", method = {RequestMethod.POST,RequestMethod.GET})
	public String sqlList(){
		return "sqlList.jsp";
	}
    
	@RequestMapping(value="/test",method = {RequestMethod.POST,RequestMethod.GET})
	public String test(){
		return "test.jsp";
	}
	
}
