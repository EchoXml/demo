package com.echo.web;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.echo.dto.Result;
import com.echo.model.UserInfo;
import com.echo.enums.RegisterStateEnum;
import com.echo.service.UserInfoService;


@Controller
@RequestMapping("/user")
public class UserInfoController {
	private Logger logger=LoggerFactory.getLogger(this.getClass());
	@Autowired
	private UserInfoService userInfoService;

	
	/**
	 * 执行登录操作
	 * @param userInfo
	 * @param model
	 * @param response
	 */
	@RequestMapping(value="/ajax/login.do",method=RequestMethod.POST)
	@ResponseBody
	public boolean doLogin(UserInfo userInfo,Model model,HttpServletResponse response,HttpSession session){
		logger.info(userInfo.getUsername()+"\t"+userInfo.getPassword());
		UserInfo loginUser=userInfoService.login(userInfo);
		if (loginUser!=null) {
			model.addAttribute("loginUser",loginUser);
			session.setAttribute("loginUser", loginUser);
			return true; 
		}else{
			return false;
		}
	
		
	}
	
	
	/**
	 * 注销操作
	 */
	@RequestMapping(value="/logout.do")
	public String doLogout(HttpSession session){
//		session.setComplete();
		session.invalidate();
		return "login.jsp";
	}
	
	/**
	 * 注册
	 * @param response
	 * @param userInfo
	 * @return
	 */
	@RequestMapping(value="/ajax/register.do",method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public Result<RegisterStateEnum> doRegister(HttpServletResponse response,UserInfo userInfo) {
		Result<RegisterStateEnum> result=userInfoService.register(userInfo);
		return result;
	}
	
	/**
	 * 校验用户名是否存在
	 * @param response
	 * @param username
	 */
	@RequestMapping(value="/ajax/checkUsername",method=RequestMethod.GET)
	@ResponseBody
	public String checkUsername(HttpServletResponse response,String username){
		String result=userInfoService.checkUserNameExsit(username);
		return result;
	}
	

	
}
