package com.echo.model;

import java.io.Serializable;
import java.util.Date;

public class UserInfo implements Serializable {
	private static final long serialVersionUID = 1L;

	private Integer userId;

	private String username;

	private String password;

	private String nickname;

	private Integer status;
	
	private Date createDate;

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	public UserInfo() {
	}

	public UserInfo(Integer userId, String username, String password, String nickname, Integer status,
			Date createDate) {
		super();
		this.userId = userId;
		this.username = username;
		this.password = password;
		this.nickname = nickname;
		this.status = status;
		this.createDate = createDate;
	}

	@Override
	public String toString() {
		return "UserInfo [userId=" + userId + ", username=" + username + ", password=" + password + ", nickname="
				+ nickname + ", status=" + status + ", createDate=" + createDate + "]";
	}
	
	
	

}
