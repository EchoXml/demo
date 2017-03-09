package com.echo.web;


import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.echo.model.UserInfo;
import com.echo.util.CommonUtil;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.sun.deploy.net.HttpResponse;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/appointment")
public class AppointmentController {
	
	@Autowired
	private AppointmentService appointmentService;

    private  Gson gson=new Gson();

    private Logger logger= LoggerFactory.getLogger(this.getClass());
	
	/**
	 * 根据预约编号删除记录
	 * @param appointmentId
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
	 * 根据预约编号和预约时间归还图书
	 * @param appointmentId
	 * @param appointTime
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

    /**
     * 导出成Excel文件
     * @param data
     * @param response
     * @throws UnsupportedEncodingException
     */
    @RequestMapping(value = "/export", method = {RequestMethod.POST,RequestMethod.GET})
    public void export(HttpServletResponse response, HttpSession session) throws UnsupportedEncodingException {
        // 只是让浏览器知道要保存为什么文件而已，真正的文件还是在流里面的数据，你设定一个下载类型并不会去改变流里的内容。
        //而实际上只要你的内容正确，文件后缀名之类可以随便改，就算你指定是下载excel文件，下载时我也可以把他改成pdf等。
        response.setContentType("application/vnd.ms-excel;charset=utf-8");
        response.setHeader("content-disposition", "attachment;filename=" + URLEncoder.encode("图书预约记录"+DateUtil.getNowTime("yyyy-MM-dd")+".xls", "UTF-8"));
        UserInfo currUser=(UserInfo) session.getAttribute("currUser");

        logger.debug("当前登录的用户："+currUser);
        Subject subject= SecurityUtils.getSubject();
        logger.info("shiro中的用户信息："+subject.getPrincipal());
        //问题记录：服务重启后Shiro中的认证不清空
        Long userId=null;
        if (subject!=null) {
            userId=subject.isPermitted("book:appoint")?currUser.getUserId():null;
        }
        List<Appointment> appointments=appointmentService.queryAppointmentsByUserId(userId);
       // TypeToken<List<Appointment>> listType = new TypeToken<List<Appointment>>() {};
        // TypeToken<>(){} --> (protected)抽象类 --> 记住泛型的类型 --> new了TypeToken的匿名内部类
      //  List<Appointment> appointments= CommonUtil.jsonToList(data,Appointment.class);
        //定义一个工作簿
        Workbook wb=new HSSFWorkbook();
        //创建一个sheet页
        Sheet sheet=wb.createSheet("图书预约信息");
        //创建标题行
        Row row=sheet.createRow(0);
        row.createCell(0).setCellValue("预约编号");
        row.createCell(1).setCellValue("书号");
        row.createCell(2).setCellValue("书名");
        row.createCell(3).setCellValue("预约用户");
        row.createCell(4).setCellValue("用户昵称");
        row.createCell(5).setCellValue("预约时间");
        row.createCell(6).setCellValue("状态");
        row.createCell(7).setCellValue("归还时间");
        // 定义样式
        CellStyle cellStyle = wb.createCellStyle();
        // 格式化日期
        //cellStyle.setDataFormat(HSSFDataFormat.getBuiltinFormat("m/d/yy"));
        // 遍历输出
//        for (Appointment appoint: appointments) {
//
//        }
        for (int i = 1; i <=appointments.size(); i++) {
            Appointment appoint = appointments.get(i - 1);
            row = sheet.createRow(i);
            row.createCell(0).setCellValue(appoint.getAppointmentId());
            row.createCell(1).setCellValue(appoint.getBookId());
            row.createCell(2).setCellValue(appoint.getBook().getName());
            row.createCell(3).setCellValue(appoint.getUserInfo().getUsername());
            row.createCell(4).setCellValue(appoint.getUserInfo().getNickname());
            row.createCell(5).setCellValue(DateUtil.dateToStr(appoint.getAppointTime()));
            row.createCell(6).setCellValue(appoint.getState()==1?"未归还":"已归还");
            row.createCell(7).setCellValue(DateUtil.dateToStr(appoint.getReturnTime()));
        }
        try {
            OutputStream ost=response.getOutputStream();
            wb.write(ost);
            ost.flush();
            ost.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    

	
}
