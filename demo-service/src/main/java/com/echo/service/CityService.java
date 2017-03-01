package com.echo.service;

import com.echo.model.City;

import java.util.List;

/**
 * Created by Echo on 2017-02-28.
 */
public interface CityService {

    /**
     * 分页查询城市信息
     * @return
     */
    public List<City> getCitiesByPage(int startRows,int pageSize);
}
