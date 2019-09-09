package Listener;

import javax.annotation.Resource;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;

import ServiceImpl.chatServiceImpl;
import WebSocket.chat;


@WebListener
public class Listener implements HttpSessionListener{

	 private chatServiceImpl chatServiceImpl;

	public Listener() {
		ApplicationContext ac=new ClassPathXmlApplicationContext("applicationContext.xml");
		chatServiceImpl=(ServiceImpl.chatServiceImpl) ac.getBean("chatServiceImpl");
	}
	
   
 
    public void sessionCreated(HttpSessionEvent se)  { 
    	
    }

    public void sessionDestroyed(HttpSessionEvent se)  { 
    	
    	HttpSession session=se.getSession();
    	
    	if(session.getAttribute("junior")!=null)
    	{
    		chatServiceImpl.deleteAll((String)session.getAttribute("junior"));
    		chat.sessionMap.remove((String)session.getAttribute("junior"));
    		
    	}else if(session.getAttribute("college")!=null){
    		chatServiceImpl.deleteAll((String)session.getAttribute("college"));
    		chat.sessionMap.remove((String)session.getAttribute("college"));
		}
    	
    }
	
}
