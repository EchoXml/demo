package com.echo.model;

import java.io.Serializable;
import java.util.Date;


public class Appointment implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Long bookId;
	
	private Long userId;
	
	private Date appointTime;
	
	//归还日期
	private Date returnTime;
	//状态
	private int state;
	
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
	}


	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}


	public Date getReturnTime() {
		return returnTime;
	}

	public void setReturnTime(Date returnTime) {
		this.returnTime = returnTime;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	@Override
	public String toString() {
		return "Appointment [bookId=" + bookId + ", userId=" + userId + ", appointTime=" + appointTime + ", returnTime="
				+ returnTime + ", state=" + state + ", book=" + book + ", userInfo=" + userInfo + "]";
	}
    
    


}
