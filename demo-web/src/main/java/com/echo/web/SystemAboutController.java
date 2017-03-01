package com.echo.web;


import java.util.List;

import com.echo.model.VisitorRec;
import com.echo.service.VisitoRecService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.druid.stat.JdbcSqlStatValue;
import com.echo.util.FileUtil;
import com.echo.web.druid.StatLogger;
import com.google.gson.Gson;

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

	@RequestMapping(value="/ajax/getVisits",method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public  List<VisitorRec> getVisits(){
		return  visitoRecService.getAllVisitor();
	}


	public void setSqList(List<JdbcSqlStatValue> sqList) {
		this.sqList = sqList;
	}
	
	
}
