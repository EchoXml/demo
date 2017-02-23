package com.echo.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.Session;
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

import com.echo.dto.Result;
import com.echo.model.UserInfo;
import com.echo.enums.DelStateEnum;
import com.echo.enums.RegisterStateEnum;
import com.echo.service.UserInfoService;
import com.echo.util.EncryptionUtil;
import com.echo.util.PropertiesUtil;


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
	@RequestMapping(value="/login.do",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView doLogin(UserInfo userInfo,HttpServletRequest request){
		Md5Pwd(userInfo);
		Subject subject=SecurityUtils.getSubject();
		UsernamePasswordToken token=new UsernamePasswordToken(userInfo.getUsername(), userInfo.getPassword());
		ModelAndView m=new ModelAndView();
		try{
			subject.login(token);
			Session session=subject.getSession();
			session.setAttribute("currUser", userInfoService.getUserInfoByUserName(userInfo.getUsername()));
			session.setTimeout(30*60*1000);
			m.setViewName("redirect:/page/index");
		}catch(Exception e){
			e.printStackTrace();
			request.setAttribute("msg", "用户名或者密码错误！");
			m.setViewName("forward:/page/login");
		}
		logger.info(userInfo.getUsername()+"\t"+userInfo.getPassword());
		return m;
	
		
	}


	private void Md5Pwd(UserInfo userInfo) {
		PropertiesUtil propertiesUtil;
		try {
			//密码加密验证
			propertiesUtil = new PropertiesUtil("project.properties");
			String salt=propertiesUtil.getValue("salt");
			userInfo.setPassword(EncryptionUtil.md5(userInfo.getPassword(), salt));
		} catch (IOException e) {
			logger.info("项目配置文件未找到！");
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 注销操作
	 */
	@RequestMapping(value="/logout.do")
	public String doLogout(){
		Subject subject=SecurityUtils.getSubject();
		subject.logout();
		return "login.jsp";
	}
	
	/**
	 * 注册
	 * @param response
	 * @param userInfo
	 * @return
	 */
	@RequestMapping(value="/register.do",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView doRegister(UserInfo userInfo) {
		if (userInfo.getStatus()==null) {
			userInfo.setStatus(1);
		}
		ModelAndView m=new ModelAndView();
		Md5Pwd(userInfo);
		Result<RegisterStateEnum> result=userInfoService.register(userInfo);
		if (result.isSuccess()) {
			m.addObject("msg", "<script>alert('注册成功！');</script>");
			m.setViewName("forward:/page/login");
		}else{
			m.addObject("msg", "注册失败！");
			m.setViewName("forward:/page/register");
		}
		return m;
	}
	
	/**
	 * 后台添加用户
	 * @param userInfo
	 * @return
	 */
	@RequestMapping(value="/addUser.do",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView addUser(UserInfo userInfo) {
		Md5Pwd(userInfo);
		ModelAndView m=new ModelAndView();
		Result<RegisterStateEnum> result=userInfoService.register(userInfo);
		if (result.isSuccess()) {
			m.addObject("msg", "添加成功！");
		}else {
			m.addObject("msg","添加失败！");
		}
		m.setViewName("forward:/page/userlist");
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
		m.setViewName("forward:/page/userlist");
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
