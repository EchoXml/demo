package com.echo.service.impl;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.echo.mapper.UserInfoMapper;
import com.echo.dto.Result;
import com.echo.enums.RegisterStateEnum;
import com.echo.model.UserInfo;
import com.echo.service.UserInfoService;

@Service
public class UserInfoServiceImpl  implements UserInfoService{

	
	@Autowired
	private UserInfoMapper userInfoMapper;
	
	@Override
	public String checkUserNameExsit(String username) {
		UserInfo userInfo=new UserInfo();
		userInfo.setUsername(username);
		UserInfo check=userInfoMapper.selectOne(userInfo);
		if (check!=null) {//数据库已存在该用户名
			return "{\"isExsit\":true,\"msg\":\"该用户名已存在\"}";
		}
		return "{\"isExsit\":false,\"msg\":\"该用户名可以被使用\"}";
	}


    @Override
	public UserInfo login(UserInfo userInfo) {
		return userInfoMapper.selectOne(userInfo);
	}

	@Override
	public Result<RegisterStateEnum> register(UserInfo userInfo) {
		Integer insert=userInfoMapper.insertSelective(userInfo);
		Result<RegisterStateEnum> result=null;
		if (insert==1) {
			result=new Result<RegisterStateEnum>(true);
			result.setData(RegisterStateEnum.SUCCESS);
		}else{
			result=new Result<RegisterStateEnum>(false);
			result.setData(RegisterStateEnum.ERROR);
		}
		return result;
	}

	@Override
	public List<UserInfo> getAllUser() {
		return userInfoMapper.selectAll();
	}

	@Override
	public int updateUser(UserInfo userInfo) {
		return userInfoMapper.updateByPrimaryKeySelective(userInfo);
	}

	@Override
	public int delUserById(Long userId) {
		return userInfoMapper.deleteByPrimaryKey(userId);
	}

	@Override
	public UserInfo getUserInfoByUserName(String username,Integer state) {
		UserInfo userInfo=new UserInfo();
		if (state!=null)
			userInfo.setStatus(state);
		userInfo.setUsername(username);
		return userInfoMapper.selectOne(userInfo);
	}

	@Override
	public UserInfo getUserInfo(String username) {
		UserInfo userInfo=new UserInfo();
		userInfo.setUsername(username);
		return userInfoMapper.selectOne(userInfo);
	}

	@Override
    public boolean removeCache(String username) {
        return true;
    }

    @Override
	public Set<String> getPermissions(String username) {
		return userInfoMapper.getPermissions(username);
	}

	@Override
	public Set<String> getRoles(String username) {
		return userInfoMapper.getRoles(username);
	}


}
