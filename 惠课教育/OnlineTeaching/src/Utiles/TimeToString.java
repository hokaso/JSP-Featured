package Utiles;


import java.text.SimpleDateFormat;
import java.util.Date;



public class TimeToString {

	public static String CreateTimeString()
	{
		Date date=new java.util.Date();
		SimpleDateFormat sdf=new SimpleDateFormat("YYYYMMddHHmmss");
		return sdf.format(date);
		
	}
}
