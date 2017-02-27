package com.echo.web;


import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.echo.dto.Result;
import com.echo.enums.DelStateEnum;
import com.echo.model.Appointment;
import com.echo.service.AppointmentService;
import com.echo.util.DateUtil;

@Controller
@RequestMapping("/appointment")
public class AppointmentController {
	
	@Autowired
	private AppointmentService appointmentService;
	
	/**
	 * 根据图书编号和用户编号删除记录
	 * @param bookId
	 * @param userId
	 * @return
	 */
    @RequestMapping(value = "/ajax/del", method = {RequestMethod.POST,RequestMethod.GET})
    @ResponseBody
    private Result<DelStateEnum> del(Long appointmentId) {
        DelStateEnum del = appointmentService.delAppointById(appointmentId);
        if (del==DelStateEnum.SUCCESS) {
        	return new Result<DelStateEnum>(true, del);
		}else{
			return new Result<DelStateEnum>(false, del);
		}
       
    }
    
    /**
	 * 根据图书编号和用户编号归还图书
	 * @param bookId
	 * @param userId
	 * @return
	 */
    @RequestMapping(value = "/ajax/returnBook", method = {RequestMethod.POST,RequestMethod.GET})
    @ResponseBody
    private Result<String> returnBook(Long appointmentId,Long appointTime) {
    	Appointment appointment=new Appointment();
    	appointment.setAppointTime(DateUtil.parse(DateUtil.unixTimestampToDate(appointTime)));
    	appointment.setReturnTime(new Date());
    	appointment.setState(2);
    	appointment.setAppointmentId(appointmentId);
    	return appointmentService.updateAppoint(appointment);
       
    }
    
    
    
    

	
	

	
}
