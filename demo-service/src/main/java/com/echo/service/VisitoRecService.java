package com.echo.service;

import com.echo.model.VisitorRec;

import java.util.List;

/**
 * Created by Echo on 2017-02-28.
 */
public interface VisitoRecService {

    /**
     * 添加访客记录
     * @param visitorRec
     * @return
     */
    public int addVisitor(VisitorRec visitorRec);

    /**
     * 获取所有访客信息
     * @return
     */
    public List<VisitorRec> getAllVisitor();
}
