package com.echo.web.shiro;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import com.echo.model.UserInfo;
import com.echo.service.UserInfoService;

public class MyRealm extends AuthorizingRealm {
	
	@Autowired
	private UserInfoService userInfoService;
	
	private Logger logger=LoggerFactory.getLogger(this.getClass());

	/**
	 * 为当前登录的用户授权
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		String username=(String)principals.getPrimaryPrincipal();
		SimpleAuthorizationInfo authorizationInfo=new SimpleAuthorizationInfo();
		authorizationInfo.setRoles(userInfoService.getRoles(username));
		authorizationInfo.setStringPermissions(userInfoService.getPermissions(username));
		return authorizationInfo;
	}

	/**
	 * 验证当前登录的用户
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		String username=(String)token.getPrincipal();
		UserInfo userInfo=userInfoService.getUserInfoByUserName(username,1);
		if (userInfo!=null) {
			AuthenticationInfo authcInfo=new SimpleAuthenticationInfo(userInfo.getUsername(),userInfo.getPassword(),userInfo.getUsername());
			return authcInfo;
		}
		logger.info("用户验证未通过！");
		return null;
	}
	

}
