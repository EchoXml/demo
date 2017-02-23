package com.echo.web;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.druid.stat.JdbcSqlStatValue;
import com.echo.web.druid.StatLogger;

@RequestMapping("system")
@Controller
public class SystemAboutController {
	
	@RequestMapping(value="/ajax/getSqls",method={RequestMethod.GET,RequestMethod.POST})
	@ResponseBody
	public  List<JdbcSqlStatValue> getSqls(){
		return StatLogger.sqlList;
	}
	
	
}
