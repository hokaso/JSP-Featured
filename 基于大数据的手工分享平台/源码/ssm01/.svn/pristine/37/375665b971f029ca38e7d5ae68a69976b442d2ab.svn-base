package ssm.utils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class ProjectPropertiesUtil {

	private static Properties props;
	static InputStream in;
	public static String getNetworkPath() {
		props = new Properties();
		in = ProjectPropertiesUtil.class.getClassLoader().getResourceAsStream("networkPath.properties");
		try {
			props.load(in);
			return props.getProperty("projectNetworkPath");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if(in != null)
					in.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}
}
