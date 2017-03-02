package com.echo.web.interceptor;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.echo.model.VisitorRec;
import com.echo.model.WebInfo;
import com.echo.service.VisitoRecService;
import com.echo.service.WebInfoService;
import com.echo.util.DateUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.echo.model.UserInfo;

public class IpCountInterceptor implements HandlerInterceptor {
	@Autowired
	private VisitoRecService visitorRecService;

	@Autowired
	private WebInfoService webInfoService;

	private Logger logger=LoggerFactory.getLogger(this.getClass());

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object object, Exception ex)
			throws Exception {
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object object, ModelAndView modelAndView)
			throws Exception {
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object object) throws Exception {
		logger.info("用户请求的url为："+request.getRemoteAddr()+":"+request.getRemotePort()+"-----"+request.getServletPath());
		logger.info("客户端浏览器的版本号、类型 :"+request.getHeader("User-agent"));
		logger.info("客户端的IP:"+request.getRemoteAddr());
		//定义时间格式
		String pattern="yyyy-MM-dd";
		Date date=DateUtil.parse(DateUtil.getNowTime(pattern),pattern);
		WebInfo webInfo=webInfoService.getWebInfoByDate(DateUtil.getNowTime(pattern));
		if (webInfo==null){
			int insert=webInfoService.addWebInfo(date);
			logger.info(insert==1?"新增成功！":"新增失败!");
		}else{
			logger.info("无需新增！");
		}
		VisitorRec visitorRec=new VisitorRec(new Date(),request.getRemoteAddr(),request.getRemoteAddr()+request.getRemotePort()+request.getServletPath(),request.getHeader("User-agent"));
		visitorRecService.addVisitor(visitorRec);
		return true;
	}

}
