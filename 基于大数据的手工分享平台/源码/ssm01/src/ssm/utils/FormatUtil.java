package ssm.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

/**
 * 自定义工具类
 * 
 * @author JiMI
 *
 */
public class FormatUtil {
	
	/**
	 * 生成uuid
	 * 
	 * @return
	 */
	public static String createUUID() {
		String uuid = UUID.randomUUID().toString();
		String s = uuid.replaceAll("-", "");
		return s.toUpperCase();
	}
	
	/**
	 * 获取当前时间，将该时间转化为字符串
	 * 
	 * @return 
	 */
	public static String getNowTime() {
		Date newTime = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String timeString = sdf.format(newTime);
		return timeString;
	}
}
