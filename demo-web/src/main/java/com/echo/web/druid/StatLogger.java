package com.echo.web.druid;

import java.util.List;

import com.alibaba.druid.pool.DruidDataSourceStatLogger;
import com.alibaba.druid.pool.DruidDataSourceStatLoggerAdapter;
import com.alibaba.druid.pool.DruidDataSourceStatValue;
import com.alibaba.druid.stat.JdbcSqlStat;
import com.alibaba.druid.stat.JdbcSqlStatValue;
import com.google.gson.Gson;

/**
 * 自定义Logger实现监控数据的采集
 * @author Echo
 *
 */
public class StatLogger extends DruidDataSourceStatLoggerAdapter   implements DruidDataSourceStatLogger{
	
	public static List<JdbcSqlStatValue> sqlList;
	
	public  void log(DruidDataSourceStatValue statValue) {
		sqlList=statValue.getSqlList();
	}

}
