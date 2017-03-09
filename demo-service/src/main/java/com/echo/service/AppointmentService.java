package com.echo.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.echo.dto.AppointExcuetion;
import com.echo.dto.Result;
import com.echo.enums.DelStateEnum;
import com.echo.model.Appointment;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;


public interface AppointmentService {
	
	/**
     * 获取对应图书编号的借阅记录
     */
    List<Appointment> queryAppointmentsByBookId(@Param("bookId") Long bookId);
    
    /**
     * 获取对应用户编号的借阅记录
     * @param userId
     * @return
     */
    @Cacheable(value="appointmentCache")
    List<Appointment> queryAppointmentsByUserId(@Param("userId") Long userId);

    /**
     * 移除对应的缓存记录
     * @param isDo
     */
    @CacheEvict(value="appointmentCache",condition = "#isDo==true")
    public void evict(boolean isDo);
    
    
    /**
     * 删除对应预约记录
     * @param appointmentId
     * @return
     */
    DelStateEnum delAppointById(Long appointmentId);
    
    /**
     * 更新对应的预约记录
     * @param appointment
     * @return
     */
	Result<String>  updateAppoint(Appointment appointment);

    
}
