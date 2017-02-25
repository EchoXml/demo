package com.echo.web.druid;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.alibaba.druid.pool.DruidDataSourceStatLogger;
import com.alibaba.druid.pool.DruidDataSourceStatLoggerAdapter;
import com.alibaba.druid.pool.DruidDataSourceStatValue;
import com.alibaba.druid.stat.JdbcSqlStatValue;

/**
 * 自定义Logger实现监控数据的采集
 * @author Echo
 *
 */
public class StatLogger extends DruidDataSourceStatLoggerAdapter   implements DruidDataSourceStatLogger{
	
	private Logger logger=LoggerFactory.getLogger(this.getClass());
	
	//保存SQL状态
	public static List<JdbcSqlStatValue> sqlList=null;
	
	public void log(DruidDataSourceStatValue statValue) {
		
		sqlList=statValue.getSqlList();
		
	}


}
