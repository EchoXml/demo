package com.echo.service.impl;

import com.echo.mapper.WebInfoMapper;
import com.echo.model.WebInfo;
import com.echo.service.WebInfoService;
import com.echo.util.DateUtil;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * Created by Echo on 2017-02-28.
 */
@Service
public class WebInfoServiceImpl implements WebInfoService {

    @Autowired
    private WebInfoMapper webInfoMapper;

    @Override
    public int updateWebInfo(WebInfo webInfo) {
        return webInfoMapper.updateByPrimaryKeySelective(webInfo);
    }

    @Override
    public WebInfo getWebInfoByDate(String date) {
        return webInfoMapper.selectByPrimaryKey(DateUtil.parse(date,"yyyy-MM-dd"));
    }

    @Override
    public int addWebInfo(Date date) {
        WebInfo webInfo=new WebInfo();

        webInfo.setRecDate(date);
        return webInfoMapper.insertSelective(webInfo);
    }
}
