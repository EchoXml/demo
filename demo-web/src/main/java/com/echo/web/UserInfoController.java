package com.echo.web;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.echo.dto.Result;
import com.echo.model.UserInfo;
import com.echo.enums.DelStateEnum;
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
	public Result<RegisterStateEnum> doRegister(UserInfo userInfo) {
		if (userInfo.getStatus()==null) {
			userInfo.setStatus(1);
		}
		Result<RegisterStateEnum> result=userInfoService.register(userInfo);
		return result;
	}
	
	/**
	 * 后台添加用户
	 * @param userInfo
	 * @return
	 */
	@RequestMapping(value="/addUser.do",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView addUser(UserInfo userInfo) {
		ModelAndView m=new ModelAndView();
		Result<RegisterStateEnum> result=userInfoService.register(userInfo);
		if (result.isSuccess()) {
			m.addObject("addUserMsg", "添加成功！");
		}else {
			m.addObject("addUserMsg","添加失败！");
		}
		m.setViewName("forward:/page/userList");
		return m;
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
	
	@RequestMapping(value="/ajax/getUsers",method=RequestMethod.GET)
	@ResponseBody
	public List<UserInfo> getUsers(){
		List<UserInfo> userInfos=userInfoService.getAllUser();
		logger.info("用户列表："+userInfos);
		return userInfos;
	}
	
	@RequestMapping(value="/{userId}/updateUser.do",method=RequestMethod.POST)
	public ModelAndView update(@PathVariable("userId") Long userId,UserInfo userInfo){
		ModelAndView m=new ModelAndView();
		userInfo.setUserId(userId);
		userInfo.setUsername(null);
		Integer result=userInfoService.updateUser(userInfo);
		if (result==1) {
			m.addObject("msg", "更新成功！");
		}else {
			m.addObject("msg","更新失败！");
		}
		m.setViewName("forward:/page/userList");
		return m;
	}
	

	@RequestMapping(value="/ajax/delUser/{userId}",method={RequestMethod.POST,RequestMethod.GET})
	@ResponseBody
	public Result<DelStateEnum> delUser(@PathVariable("userId") Long userId){
		Integer result=userInfoService.delUserById(userId);
		if (result==1) {
			return new Result<DelStateEnum>(true, DelStateEnum.SUCCESS);
		}
		return new Result<DelStateEnum>(false,DelStateEnum.FIAID);
	}
	
}
