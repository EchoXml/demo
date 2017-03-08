package com.echo.model;

import java.util.Date;
import javax.persistence.*;

import com.echo.util.DateUtil;
import org.springframework.format.annotation.DateTimeFormat;

@Table(name = "user_info")
public class UserInfo {
    /**
     * 用户ID
     */
    @Id
    @Column(name = "user_id")
    private Long userId;

    /**
     * 用户名
     */
    private String username;

    /**
     * 密码
     */
    private String password;

    /**
     * 昵称
     */
    private String nickname;

    /**
     * 状态
     */
    private Integer status;

    /**
     * 创建时间
     */
    @Column(name = "create_date")
    private Date createDate;
    @Transient
	private String createDateStr;
	
	@Transient
	private String statusStr;

    /**
     * 所属角色
     */
    @Column(name = "role_id")
    private Integer roleId;

    public String getHeadPath() {
        return headPath;
    }

    public void setHeadPath(String headPath) {
        this.headPath = headPath;
    }

    /**
     * 头像路径
     */
    @Column(name = "head_path")
    private  String headPath;

    /**
     * 获取用户ID
     *
     * @return user_id - 用户ID
     */
    public Long getUserId() {
        return userId;
    }

    /**
     * 设置用户ID
     *
     * @param userId 用户ID
     */
    public void setUserId(Long userId) {
        this.userId = userId;
    }

    /**
     * 获取用户名
     *
     * @return username - 用户名
     */
    public String getUsername() {
        return username;
    }

    /**
     * 设置用户名
     *
     * @param username 用户名
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * 获取密码
     *
     * @return password - 密码
     */
    public String getPassword() {
        return password;
    }

    /**
     * 设置密码
     *
     * @param password 密码
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * 获取昵称
     *
     * @return nickname - 昵称
     */
    public String getNickname() {
        return nickname;
    }

    /**
     * 设置昵称
     *
     * @param nickname 昵称
     */
    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    /**
     * 获取状态
     *
     * @return status - 状态
     */
    public Integer getStatus() {
        return status;
    }

    /**
     * 设置状态
     *
     * @param status 状态
     */
    public void setStatus(Integer status) {
        this.status = status;
        setStatusStr();
    }

    /**
     * 获取创建时间
     *
     * @return create_date - 创建时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    public Date getCreateDate() {
        return createDate;
    }

    /**
     * 设置创建时间
     *
     * @param createDate 创建时间
     */
    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
        setCreateDateStr();
    }

    /**
     * 获取所属角色
     *
     * @return role_id - 所属角色
     */
    public Integer getRoleId() {
        return roleId;
    }

    /**
     * 设置所属角色
     *
     * @param roleId 所属角色
     */
    public void setRoleId(Integer roleId) {
        this.roleId = roleId;
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

    @Override
    public String toString() {
        return "UserInfo{" +
                "userId=" + userId +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", nickname='" + nickname + '\'' +
                ", status=" + status +
                ", createDate=" + createDate +
                ", createDateStr='" + createDateStr + '\'' +
                ", statusStr='" + statusStr + '\'' +
                ", roleId=" + roleId +
                ", headPath='" + headPath + '\'' +
                '}';
    }
}