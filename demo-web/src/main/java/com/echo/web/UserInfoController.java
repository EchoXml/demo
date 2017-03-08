package com.echo.web;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.echo.util.DateUtil;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
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
	 * @param request
	 */
	@RequestMapping(value="/login.do",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView doLogin(UserInfo userInfo,HttpServletRequest request,boolean rememberMe){
		userInfo.setPassword(EncryptionUtil.Md5Str(userInfo.getPassword()));
		Subject subject=SecurityUtils.getSubject();
		logger.info("是否选中记住我："+rememberMe);
		//subject
		UsernamePasswordToken token=new UsernamePasswordToken(userInfo.getUsername(), userInfo.getPassword());
		//设置rememeber是否开启
		token.setRememberMe(rememberMe);
		ModelAndView m=new ModelAndView();
		try{
			subject.login(token);
			HttpSession session=request.getSession();
			logger.info("用户对象："+userInfoService.getUserInfoByUserName(userInfo.getUsername(),null));
			session.setAttribute("currUser", userInfoService.getUserInfoByUserName(userInfo.getUsername(),null));
			session.setMaxInactiveInterval(30*60*1000);
			m.setViewName("redirect:/page/index");
		}catch(Exception e){
			e.printStackTrace();
			request.setAttribute("msg", "用户名或者密码错误或者账户异常！");
			m.setViewName("forward:/page/login");
		}

		return m;

	}



	
	
	/**
	 * 注销操作
	 */
	@RequestMapping(value="/logout.do")
	public String doLogout(SessionStatus session){
		session.setComplete();
		Subject subject=SecurityUtils.getSubject();
		subject.logout();
		
		return "login.jsp";
	}
	
	/**
	 * 注册
	 * @param userInfo
	 * @return
	 */
	@RequestMapping(value="/register.do",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView doRegister(UserInfo userInfo) {
		if (userInfo.getStatus()==null) {
			userInfo.setStatus(1);
		}
		ModelAndView m=new ModelAndView();
        userInfo.setPassword(EncryptionUtil.Md5Str(userInfo.getPassword()));
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
        userInfo.setPassword(EncryptionUtil.Md5Str(userInfo.getPassword()));
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
		if (userInfo.getPassword().equals("******")) {
			userInfo.setPassword(null);
		}else{
            userInfo.setPassword(EncryptionUtil.Md5Str(userInfo.getPassword()));
		}
		Integer result=userInfoService.updateUser(userInfo);
		if (result==1) {
			m.addObject("msg", "更新成功！");
		}else {
			m.addObject("msg","更新失败！");
		}
		m.setViewName("forward:/page/userlist");
		return m;
	}

	@RequestMapping(value="/selfUpdate.do",method=RequestMethod.POST)
	public ModelAndView selfUpdate(UserInfo userInfo,MultipartFile headFile,HttpServletRequest request) {
		ModelAndView m=new ModelAndView();
		int update=0;	//保存修改结果
		//判断是否有文件上传
		//有的话进行类型判断，无则不修改头像信息
		if(headFile.isEmpty()){
			logger.info("未有修改图片信息！");
			//更新用户信息
			update=userInfoService.updateUser(userInfo);
		}else {
			//得到上传的文件名
			String fileName = headFile.getOriginalFilename();
			//获取文件后缀名
			String suffix=fileName.substring(fileName.lastIndexOf("."));
			//判断文件类型是否正确
			boolean fileTypeTrue=Arrays.asList(".jpg",".png",".gif",".jpeg").contains(suffix);
			//是正确的图片格式进行保存操作，否则返回错误信息
			if (fileTypeTrue){	//保存头像图片
				//得到服务器项目发布运行所在地址
				String address= request.getSession().getServletContext().getRealPath("resources/upload/head");
				File pathFile=new File(address);
				//如果路径不存在，则创建所有对应目录
				if (!pathFile.exists()){
					pathFile.mkdirs();
				}
				// 此处未使用UUID来生成唯一标识,用日期做为标识
				String path = address+File.separator+DateUtil.getNowTime("yyyyMMddHHmmss")+ fileName;
				logger.info("头像位置："+path);
				//把文件上传至path的路径
				File localFile = new File(path);
				try {
					headFile.transferTo(localFile);
					//保存头像路径
					userInfo.setHeadPath("upload/head/"+DateUtil.getNowTime("yyyyMMddHHmmss")+ fileName);
					//更新用户信息
					update=userInfoService.updateUser(userInfo);
					//刷新session中的user对象
					request.getSession().setAttribute("currUser",userInfoService.getUserInfoByUserName(userInfo.getUsername(),null));
				} catch (IOException e) {
					e.printStackTrace();
					m.addObject("msg","文件读写异常！修改未进行！");
				}
			}else{
				m.addObject("msg","头像类型格式不被支持，请上传jpg,png,jpeg,gif类型的图片！");
			}

		}
		m.setViewName("forward:/page/index");
		return  m;
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
