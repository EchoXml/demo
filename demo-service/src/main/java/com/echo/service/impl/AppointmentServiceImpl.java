package com.echo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.echo.mapper.AppointmentMapper;
import com.echo.dto.Result;
import com.echo.enums.DelStateEnum;
import com.echo.model.Appointment;
import com.echo.service.AppointmentService;

import tk.mybatis.mapper.entity.Example;
import tk.mybatis.mapper.entity.Example.Criteria;

@Service
public class AppointmentServiceImpl implements AppointmentService {

	@Autowired
	private AppointmentMapper appointmentMapper;
	
	@Override
	public List<Appointment> queryAppointmentsByBookId(Long bookId) {
		Appointment example=new Appointment();
		example.setBookId(bookId);
		return appointmentMapper.selectByExample(example);
	}

	@Override
	public List<Appointment> queryAppointmentsByUserId(Long userId) {
		return appointmentMapper.queryAppointmentsByUserId(userId);
	}

	@Override
	public DelStateEnum delAppointById(Long appointmentId) {
		int delete=appointmentMapper.deleteByPrimaryKey(appointmentId);
		if (delete==1) {
			return DelStateEnum.SUCCESS;
		}else{
			return DelStateEnum.FIAID;
		}
	}
	
	
	@Override
	public Result<String> updateAppoint(Appointment appointment) {
		int update=appointmentMapper.updateByPrimaryKeySelective(appointment);
		Result<String> result=new Result<>();
		if (update==1) {
			result=new Result<>(true);
			result.setData("更新成功！");
		}else {
			result=new Result<>(false);
			result.setData("更新失败！");
		}
		return result;
	}



}
