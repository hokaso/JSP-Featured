package Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import Pojo.chatPojo;
import ServiceImpl.chatServiceImpl;

@Controller
public class chat_Controller {

	@Autowired
	private chatServiceImpl chatServiceImpl;
	//判断中小学生登录没
	@RequestMapping("chat_check_login")
	public String chat_check_login(HttpServletRequest request,String college_id) {
		HttpSession session=request.getSession();
		if(session.getAttribute("junior")==null)
		{
			return "login";
			//没登录则跳转登录页面
		}else {
			request.setAttribute("college_id", college_id);
			//把要联系的大学生放进request中
			return "chat_online";
		}

	}
	
	@RequestMapping("chat_online")
	public String chat_online(HttpServletRequest request,String college_id) {
		
		HttpSession session=request.getSession();
		if(session.getAttribute("junior")==null)
		{
			return "login";
			//没登录则跳转登录页面
		}else {
			//这是学生的聊天页面
			request.setAttribute("college_id", college_id);
            
			return "chat/chat_online_junior.jsp";
		}

	}
	
	
	@RequestMapping("chat_online_college1")
	public String chat_online_college1(HttpServletRequest request) {
		String college_id=(String) request.getSession().getAttribute("college");
		List<chatPojo> list=chatServiceImpl.chat_find_news(college_id);
		request.setAttribute("list", list);
		return "chat/chat_online_college_list.jsp";
	}
	
	
	@RequestMapping("chat_online_college2")
	public String chat_online_college2(HttpServletRequest request,String junior_id) {
	
		
		request.setAttribute("junior_id", junior_id);
		return "chat/chat_online_college.jsp";
	}
	
	
}
