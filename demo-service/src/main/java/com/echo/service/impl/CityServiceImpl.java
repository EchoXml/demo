package com.echo.service.impl;

import com.echo.mapper.CityMapper;
import com.echo.model.City;
import com.echo.service.CityService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.orderbyhelper.OrderByHelper;

import java.util.List;

/**
 * Created by Echo on 2017-02-28.
 */
@Service
public class CityServiceImpl implements CityService {

    @Autowired
    private CityMapper cityMapper;

    @Override
    public List<City> getCitiesByPage(int startRows,int pageSize) {
        PageHelper.startPage(startRows,pageSize);
        OrderByHelper.orderBy("city_id");
        List<City> cities=cityMapper.selectAll();
        return cities;
    }
}
