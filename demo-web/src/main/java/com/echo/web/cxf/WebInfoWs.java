package com.echo.web.cxf;

import javax.jws.WebService;

/**
 * Created by Echo on 2017-03-07.
 */
@WebService
public interface WebInfoWs {

    /**
     * 获取当前日期对应的网站信息
     * @return
     */
    public  String getWebInfoToday();
}
