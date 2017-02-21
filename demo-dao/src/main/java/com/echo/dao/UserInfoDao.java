package com.echo.dao;

import java.util.List;
import java.util.Set;

import com.echo.model.UserInfo;

public interface UserInfoDao {
	
	/**
	 * 根据用户名查询是否存在该用户
	 * @param username 要查询的用户名
	 * @return 
	 */
	UserInfo queryByUserName(String username);
	
	/**
	 * 根据传入对象中的用户名密码匹配是否存在对应的用户信息
	 * @param userInfo
	 * @return
	 */
	UserInfo queryByNameAndPwd(UserInfo userInfo);
	
	/**
	 * 往数据库中添加一条用户记录
	 * @param userInfo
	 * @return
	 */
	Integer addUserInfo(UserInfo userInfo);
	
	/**
	 * 获取所有用户信息
	 * @return
	 */
	List<UserInfo> getAllUser();
	
	/**
	 * 更新用户信息
	 * @return
	 */
	int updateUser(UserInfo userInfo);
	
	/**
	 * 删除指定用户编号的用户信息
	 * @return
	 */
	int delUserById(Long userId);
	
	/**
	 * 获取用户权限列表
	 * @param username 用户名
	 * @return
	 */
	Set<String> getPermissions(String username);
	
	/**
	 * 获取用户角色列表
	 * @param username 用户名
	 * @return
	 */
	Set<String> getRoles(String username);

}
