package com.echo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.echo.dao.AppointmentDao;
import com.echo.enums.DelStateEnum;
import com.echo.model.Appointment;
import com.echo.service.AppointmentService;

@Service
public class AppointmentServiceImpl implements AppointmentService {

	@Autowired
	private AppointmentDao appointmentDao;
	
	@Override
	public List<Appointment> queryAppointmentsByBookId(Long bookId) {
		return appointmentDao.queryAppointmentsByBookId(bookId);
	}

	@Override
	public List<Appointment> queryAppointmentsByUserId(Long userId) {
		return appointmentDao.queryAppointmentsByUserId(userId);
	}

	@Override
	public DelStateEnum delAppointById(Long bookId, Long userId) {
		int delete=appointmentDao.delAppointById(bookId, userId);
		if (delete==1) {
			return DelStateEnum.SUCCESS;
		}else{
			return DelStateEnum.FIAID;
		}
	}

}
