package com.echo.model;

import java.io.Serializable;
import java.util.Date;

import com.echo.util.DateUtil;

public class UserInfo implements Serializable {
	private static final long serialVersionUID = 1L;

	private Long userId;

	private String username;

	private String password;

	private String nickname;

	private Integer status;
	
	private Date createDate;
	
	private String createDateStr;
	
	private String statusStr;

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
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
		setStatusStr();
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
		setCreateDateStr();
	}
	
	public UserInfo() {
	}

	public UserInfo(Long userId, String username, String password, String nickname, Integer status,
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

	public String getCreateDateStr() {
		return this.createDateStr;
	}

	private void setCreateDateStr() {
		this.createDateStr=DateUtil.unixTimestampToDate(getCreateDate().getTime());
	}

	public String getStatusStr() {
		return statusStr;
	}

	private void setStatusStr() {
		switch (this.status) {
		case 1:
			this.statusStr="正常";
			break;
		case -1:
			this.statusStr="禁用";
			break;
		case -2:
			this.statusStr="异常";
			break;
		default:
			this.statusStr="未知";
			break;
		}
		
	}
	
	
	

}
