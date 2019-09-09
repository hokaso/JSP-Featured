package Controller;

import java.lang.ProcessBuilder.Redirect;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import Mapper.otherMapper;

@Controller
public class other_Controller {
//该类为做杂七杂八的功能
	
	@Resource
	private otherMapper otherMapper;
	
	
	
	
	@RequestMapping("exit")
	public String exit(HttpServletRequest request)
	{
		HttpSession session=request.getSession();
		session.removeAttribute("junior");
		session.removeAttribute("college");
		session.removeAttribute("staff");
		return "course_show_all";
	}
	
	@RequestMapping("login")
	public String login(HttpServletRequest request)
	{
		HttpSession session=request.getSession();
		session.removeAttribute("junior");
		session.removeAttribute("college");
		session.removeAttribute("staff");
		return "other/login.jsp";
	}
	
	@RequestMapping("login_fail")
	public String login_fail()
	{
		return "other/login_fail.jsp";
	}
	
	@RequestMapping("register")
	public String register()
	{
		return "other/register.jsp";
	}
	
	//给客服用
	@RequestMapping("staff_register_list")
	public String staff_register_list()
	{
	return "staff/staff_register_list.jsp";	
	}
	
}
