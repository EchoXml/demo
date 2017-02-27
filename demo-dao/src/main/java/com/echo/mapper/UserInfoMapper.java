package com.echo.mapper;

import java.util.Set;

import com.echo.model.UserInfo;
import tk.mybatis.mapper.common.Mapper;

public interface UserInfoMapper extends Mapper<UserInfo> {

	Set<String> getPermissions(String username);

	Set<String> getRoles(String username);
}