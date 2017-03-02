package com.echo.web;


import java.io.File;
import java.io.IOException;
import java.util.List;

import com.echo.model.VisitorRec;
import com.echo.service.VisitoRecService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.druid.stat.JdbcSqlStatValue;
import com.echo.util.FileUtil;
import com.echo.web.druid.StatLogger;
import com.google.gson.Gson;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

@RequestMapping("system")
@Controller
public class SystemAboutController {
	

	private Logger logger=LoggerFactory.getLogger(this.getClass());
	
	private List<JdbcSqlStatValue> sqList;

	@Autowired
	private VisitoRecService visitoRecService;
	
	@RequestMapping(value="/ajax/getSqls",method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public  List<JdbcSqlStatValue> getSqls(){
		List<JdbcSqlStatValue> sqList=StatLogger.sqlList;
		logger.debug("sqllist.size:"+sqList.size());
		logger.debug(new Gson().toJson(sqList));
		return  sqList;
	}

	/*//将用户选择头像上传至系统存放头像路径
	@RequestMapping(value="/ajax/uploadHead",method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public  boolean uploadHead(@RequestParam MultipartFile[] myfiles, HttpServletRequest request) throws IOException {
        for (MultipartFile myfile:myfiles) {
            String originalFilename = myfile.getOriginalFilename();
            System.out.println(originalFilename);
            //得到tmp的绝对路径
            String tmpPath = request.getServletContext().getRealPath("views") + "\\";
            //System.out.println("根路径" + request.getServletContext().getRealPath("tmp") );
            String resetName = Long.toString(System.currentTimeMillis());
            *//*String testPath = tmpPath + resetName +".jpg";
            myfile.transferTo(new File(testPath));*//*
            System.out.println("文件原名: " + originalFilename);
            System.out.println("文件名称: " + myfile.getName());
            System.out.println("文件长度: " + myfile.getSize());
            System.out.println("文件类型: " + myfile.getContentType());
            System.out.println("========================================");
        }
		return  false;
	}*/

	@RequestMapping(value="/ajax/getVisits",method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public  List<VisitorRec> getVisits(){
		return  visitoRecService.getAllVisitor();
	}


	public void setSqList(List<JdbcSqlStatValue> sqList) {
		this.sqList = sqList;
	}
	
	
}
