/*import java.util.List;
import java.util.Set;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.echo.mapper.CityMapper;
import com.echo.mapper.UserInfoMapper;
import com.echo.model.City;
import com.echo.service.UserInfoService;

*//**
 * 配置spring和junit整合，junit启动时加载springIOC容器 spring-test,junit
 *//*
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "classpath:spring/spring-dao.xml","classpath:spring/spring-service.xml"})
public class BaseTest {
	
	@Autowired
	private CityMapper cityMapper;
	
	@Autowired
	private UserInfoService userInfoService;
	
	private Logger logger=LoggerFactory.getLogger(this.getClass());
	
	@Test
	public void testGetAllCity(){
		List<City> cities=cityMapper.selectAll();
		for (City city : cities) {
			System.out.println(city);
		}
	}
	
	@Test
	public void testUser(){
		Set<String> permission=userInfoService.getPermissions("EchoXml");
		logger.debug("Set大小:"+permission.size());;
		for (String string : permission) {
			logger.debug(string);
		}
	}
	
	

}*/