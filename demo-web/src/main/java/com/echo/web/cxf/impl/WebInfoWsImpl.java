package com.echo.web.cxf.impl;

import com.echo.service.WebInfoService;
import com.echo.util.DateUtil;
import com.echo.web.cxf.WebInfoWs;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.jws.WebService;

/**
 * Created by Echo on 2017-03-07.
 */
@Component("webinfows")
@WebService
public class WebInfoWsImpl implements WebInfoWs {
    @Autowired
    private WebInfoService webInfoService;



    @Override
    public String getWebInfoToday() {
        Gson gson=new Gson();
        return gson.toJson(webInfoService.getWebInfoByDate(DateUtil.getNowTime("yyyy-MM-dd")));
    }
}
