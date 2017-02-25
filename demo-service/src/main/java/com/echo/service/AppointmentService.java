package com.echo.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.echo.dto.AppointExcuetion;
import com.echo.dto.Result;
import com.echo.enums.DelStateEnum;
import com.echo.model.Appointment;


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
    List<Appointment> queryAppointmentsByUserId(@Param("userId") Long userId);
    
    
    /**
     * 删除对应预约记录
     * @param appointId
     * @return
     */
    DelStateEnum delAppointById(@Param("bookId") Long bookId, @Param("userId") Long userId);
    
    /**
     * 更新对应的预约记录
     * @param bookId
     * @param appointment
     * @param userId 
     * @return
     */
	Result<String>  updateAppoint(Appointment appointment);

    
}
