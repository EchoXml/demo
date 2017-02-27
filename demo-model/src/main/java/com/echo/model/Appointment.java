package com.echo.model;

import java.util.Date;
import javax.persistence.*;

public class Appointment {
	
	@Transient
	private UserInfo userInfo;
	@Transient
	private Book book;
	
    public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	@Id
    @Column(name = "appointment_id")
    private Long appointmentId;

    /**
     * 图书ID
     */
    @Column(name = "book_id")
    private Long bookId;

    /**
     * 学号
     */
    @Column(name = "user_id")
    private Long userId;

    /**
     * 预约时间
     */
    @Column(name = "appoint_time")
    private Date appointTime;

    /**
     * 1-未归还，2-已归还
     */
    private Integer state;

    /**
     * 归还日期
     */
    @Column(name = "return_time")
    private Date returnTime;

    /**
     * @return appointment_id
     */
    public Long getAppointmentId() {
        return appointmentId;
    }

    /**
     * @param appointmentId
     */
    public void setAppointmentId(Long appointmentId) {
        this.appointmentId = appointmentId;
    }

    /**
     * 获取图书ID
     *
     * @return book_id - 图书ID
     */
    public Long getBookId() {
        return bookId;
    }

    /**
     * 设置图书ID
     *
     * @param bookId 图书ID
     */
    public void setBookId(Long bookId) {
        this.bookId = bookId;
    }

    /**
     * 获取学号
     *
     * @return user_id - 学号
     */
    public Long getUserId() {
        return userId;
    }

    /**
     * 设置学号
     *
     * @param userId 学号
     */
    public void setUserId(Long userId) {
        this.userId = userId;
    }

    /**
     * 获取预约时间
     *
     * @return appoint_time - 预约时间
     */
    public Date getAppointTime() {
        return appointTime;
    }

    /**
     * 设置预约时间
     *
     * @param appointTime 预约时间
     */
    public void setAppointTime(Date appointTime) {
        this.appointTime = appointTime;
    }

    /**
     * 获取1-未归还，2-已归还
     *
     * @return state - 1-未归还，2-已归还
     */
    public Integer getState() {
        return state;
    }

    /**
     * 设置1-未归还，2-已归还
     *
     * @param state 1-未归还，2-已归还
     */
    public void setState(Integer state) {
        this.state = state;
    }

    /**
     * 获取归还日期
     *
     * @return return_time - 归还日期
     */
    public Date getReturnTime() {
        return returnTime;
    }

    /**
     * 设置归还日期
     *
     * @param returnTime 归还日期
     */
    public void setReturnTime(Date returnTime) {
        this.returnTime = returnTime;
    }
}