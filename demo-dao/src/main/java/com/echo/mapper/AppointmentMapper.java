package com.echo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.echo.model.Appointment;
import tk.mybatis.mapper.common.Mapper;

public interface AppointmentMapper extends Mapper<Appointment> {
	
	  /**
     * 获取对应用户编号的借阅记录
     * @param userId
     * @return
     */
    List<Appointment> queryAppointmentsByUserId(@Param("userId") Long userId);
}