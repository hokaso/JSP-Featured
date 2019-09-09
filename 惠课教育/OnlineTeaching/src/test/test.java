package test;

import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.scheduling.quartz.AdaptableJobFactory;

import ServiceImpl.chatServiceImpl;

public class test {

	public static void main(String[] args) {
		ClassPathXmlApplicationContext ac=new ClassPathXmlApplicationContext("applicationContext.xml");//相对于src
	chatServiceImpl cc=(chatServiceImpl) ac.getBean("chatServiceImpl");
	cc.chat_add_news("12", "44");
	}
	
}
