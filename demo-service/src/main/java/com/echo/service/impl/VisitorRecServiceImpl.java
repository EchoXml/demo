package com.echo.service.impl;

import com.echo.mapper.VisitorRecMapper;
import com.echo.model.VisitorRec;
import com.echo.service.VisitoRecService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Echo on 2017-02-28.
 */
@Service
public class VisitorRecServiceImpl implements VisitoRecService {
    @Autowired
    private VisitorRecMapper visitorRecMapper;

    private Logger logger= LoggerFactory.getLogger(this.getClass());

    @Override
    public int addVisitor(VisitorRec visitorRec) {
        return visitorRecMapper.insertSelective(visitorRec);
    }

    @Override
    public List<VisitorRec> getAllVisitor() {
        return visitorRecMapper.selectAll();
    }
}
