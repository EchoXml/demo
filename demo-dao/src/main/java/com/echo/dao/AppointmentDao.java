package com.echo.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.echo.model.Appointment;

public interface AppointmentDao {

    /**
     * 插入预约图书记录
     * 
     * @param bookId
     * @param studentId
     * @return 插入的行数
     */
    int insertAppointment(@Param("bookId") Long bookId, @Param("studentId") Long studentId);

    /**
     * 通过主键查询预约图书记录，并且携带图书实体
     * 
     * @param bookId
     * @param studentId
     * @return
     */
    Appointment queryByKeyWithBook(@Param("bookId") Long bookId, @Param("userId") Long userId);
    
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
    int delAppointById(@Param("bookId") Long bookId, @Param("userId") Long userId);

}