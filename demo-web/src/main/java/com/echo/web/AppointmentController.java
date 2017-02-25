package com.echo.web;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.echo.dto.Result;
import com.echo.enums.DelStateEnum;
import com.echo.service.AppointmentService;

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
    private Result<DelStateEnum> del(Long bookId,Long userId) {
        DelStateEnum del = appointmentService.delAppointById(bookId, userId);
        if (del==DelStateEnum.SUCCESS) {
        	return new Result<DelStateEnum>(true, del);
		}else{
			return new Result<DelStateEnum>(false, del);
		}
       
    }
    

	
	

	
}
