package WebSocket;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;

import Pojo.chatPojo;
import ServiceImpl.chatServiceImpl;

@ServerEndpoint(value="/chat",configurator = GetHttpSessionConfigurator.class)
public class chat {

   private chatServiceImpl chatServiceImpl;
	public static Map<String, Session> sessionMap = new HashMap<String, Session>();
	// 键为id，值为session
	private Session session = null;
     private HttpSession httpSession;
	
	// 通道建立成功需要做的方法
	@OnOpen
	public void open(Session session,EndpointConfig config) {
		
		httpSession= (HttpSession) config.getUserProperties().get(HttpSession.class.getName());
		this.session = session;
		ClassPathXmlApplicationContext ac=new ClassPathXmlApplicationContext("applicationContext.xml");//相对于src
		chatServiceImpl=(ServiceImpl.chatServiceImpl) ac.getBean("chatServiceImpl");
	}

	// 接受的信息
	@OnMessage
	public void message(String message) throws IOException {

		
		String info[] = message.split("&");
		if(info[0].equals("junior")){
			
		if (info[1].equals("open")) {
			//junior & open & junior_id & college_id
			sessionMap.put(info[2], session);
			//此时button为灰色
				this.session.getBasicRemote().sendText("等待对方连接中");
				try{chatServiceImpl.chat_add_news(info[2], info[3]);}catch (Exception e) {
					System.out.println("exist!");
				}

			
		}
		else if (info[1].equals("content")) {
			//junior & content & junior_id & college_id & content
		      	
				sessionMap.get(info[3]).getBasicRemote().sendText(info[4]);

		}
		else if(info[1].equals("quit")) {
			// junior&quit&"+junior_id+"&"+college_id 退出聊天
			//1.发送下线消息
			sessionMap.get(info[3]).getBasicRemote().sendText("用户已退出聊天");
			//2.从数据库中删除聊天
			chatServiceImpl.deleteOne(info[2], info[3]);
		}
		
	}
		
//以上为junior
		
		
		if(info[0].equals("college"))
		{
			//college & open & 我的id & 对方id
			if(info[1].equals("open"))
			{
				sessionMap.put(info[2], session);
				sessionMap.get(info[3]).getBasicRemote().sendText("已上线");
				//给对方发送
			}
			else if(info[1].equals("content"))
			{
				//college & content & college_id & junior_id & content
				sessionMap.get(info[3]).getBasicRemote().sendText(info[4]);	
			}
			else if(info[1].equals("quit")) {
				//college&quit&college_id&junior_id
				
				sessionMap.get(info[3]).getBasicRemote().sendText("用户已退出聊天");
				//2.从数据库中删除聊天
				chatServiceImpl.deleteOne(info[3], info[2]);
				
			}
			
		}
		

	}

	// 连接关闭
	@OnClose
	public void close() throws IOException {
		
	}

	// 异常处理
	@OnError
	public void error(Session sesson, Throwable throwable) throws IOException {
		
	}

}
