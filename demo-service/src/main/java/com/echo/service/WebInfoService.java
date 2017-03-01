package com.echo.service;

import com.echo.model.WebInfo;

import java.util.Date;

/**
 * Created by Echo on 2017-02-28.
 */
public interface WebInfoService {

    /**
     * 更新webinfo信息
     * @param webInfo 要更新的对象
     * @return
     */
    public int updateWebInfo(WebInfo webInfo);

    /**
     * 根据日期获取对应的网站信息对象
     * @param date yyyy-MM-dd
     * @return
     */
    public WebInfo getWebInfoByDate(String date);


}
