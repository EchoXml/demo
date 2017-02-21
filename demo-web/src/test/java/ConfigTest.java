import java.io.IOException;

import org.junit.Test;

import com.echo.util.PropertiesUtil;

// 告诉junit spring配置文件
public class ConfigTest {
	
	public static void main(String[] args) {
		 try {
				PropertiesUtil propertiesUtil=new PropertiesUtil("project.properties");
				System.out.println(propertiesUtil.getValue("salt"));
			} catch (IOException e) {
				e.printStackTrace();
			}
	}
	
	@Test
	public void TestConfig(){
		 try {
			PropertiesUtil propertiesUtil=new PropertiesUtil("classpath:project.properties");
			System.out.println(propertiesUtil.getValue("salt"));
		} catch (IOException e) {
			e.printStackTrace();
		}
		 
	      
	}

}
