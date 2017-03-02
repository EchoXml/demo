import java.util.Date;
import java.util.List;
import java.util.Set;

import com.alibaba.druid.filter.config.ConfigTools;
import com.echo.model.WebInfo;
import com.echo.service.CityService;
import com.echo.service.WebInfoService;
import com.echo.util.DateUtil;
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

/**
 * 配置spring和junit整合，junit启动时加载springIOC容器 spring-test,junit
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "classpath:spring/spring-dao.xml","classpath:spring/spring-service.xml"})
public class BaseTest {

	@Autowired
	private WebInfoService webInfoService;

    @Autowired
    private CityService cityService;

	@Autowired
	private UserInfoService userInfoService;
	
	private Logger logger=LoggerFactory.getLogger(this.getClass());

	@Test
	public void testGetAllCity(){
		List<City> cities=cityService.getCitiesByPage(0,5);

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

	@Test
	public  void  testPassword() throws Exception {
		logger.info("密码是："+ConfigTools.encrypt("123456"));
	}


	@Test
	public  void testGetWebInfoByDate(){
		WebInfo webInfo=webInfoService.getWebInfoByDate("2016-11-11");

		logger.info("获取到的信息："+webInfo);

	}

	@Test
	public  void testAddWebInfoByDate(){
		//DateUtil.getNowTime("yyyy-MM-dd")
		Date date=DateUtil.parse("2012-12-12","yyyy-MM-dd");
		WebInfo webInfo=webInfoService.getWebInfoByDate("2012-12-12");
		if (webInfo==null){
			int insert=webInfoService.addWebInfo(date);
			logger.info(insert==1?"新增成功！":"新增失败!");
		}else{
			logger.info("无需新增！");
		}


	}
	
	
}