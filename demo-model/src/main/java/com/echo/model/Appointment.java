package com.echo.model;

import java.io.Serializable;
import java.util.Date;

import com.echo.util.DateUtil;

public class Appointment implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Long bookId;
	
	private Long userId;
	
	private Date appointTime;
	
	private String appointTimeStr;
	
	 // 多对一的复合属性
    private Book book;// 图书实体
    
    private UserInfo userInfo; //预约人实体

	public Long getBookId() {
		return bookId;
	}

	public void setBookId(Long bookId) {
		this.bookId = bookId;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}


	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}


	public Appointment() {
		super();
	}

	public Date getAppointTime() {
		return appointTime;
	}

	public void setAppointtTime(Date appointTime) {
		this.appointTime = appointTime;
		setAppointTimeStr();
	}


	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}


	public String getAppointTimeStr() {
		return appointTimeStr;
	}

	public void setAppointTimeStr() {
		this.appointTimeStr=DateUtil.unixTimestampToDate(appointTime.getTime());
	}

	@Override
	public String toString() {
		return "Appointment [bookId=" + bookId + ", userId=" + userId + ", appointTime=" + appointTime
				+ ", appointTimeStr=" + appointTimeStr + ", book=" + book + ", userInfo=" + userInfo + "]";
	}
    
    


}
