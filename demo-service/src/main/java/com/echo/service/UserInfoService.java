package com.echo.service;
import java.util.List;

import com.echo.dto.Result;
import com.echo.model.UserInfo;
import com.echo.enums.RegisterStateEnum;

/**
 * 用户相关业务操作接口
 * @author Echo
 *
 */
public interface UserInfoService {

	/**
	 * 校验用户名能否被注册
	 * @param username
	 * @return
	 */
	String checkUserNameExsit(String username);
	
	/**
	 * 用户登录操作
	 * @param userInfo
	 * @return
	 */
	UserInfo login(UserInfo userInfo);
	
	/**
	 * 用户注册
	 * @param userInfo
	 * @return
	 */
	Result<RegisterStateEnum> register(UserInfo userInfo);
	
	/**
	 * 获取所有用户信息
	 * @return
	 */
	List<UserInfo> getAllUser();
	
	/**
	 * 更新用户
	 * @return
	 */
	int updateUser(UserInfo userInfo);
	
	/**
	 * 删除指定用户编号的用户信息
	 * @return
	 */
	int delUserById(Long userId);
	
	
}