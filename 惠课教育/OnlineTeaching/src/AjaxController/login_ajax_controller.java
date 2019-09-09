package AjaxController;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import Mapper.otherMapper;
import Pojo.college;


@Controller
public class login_ajax_controller {

	@Resource
	private otherMapper otherMapper;
	
	@RequestMapping("user_login")
	public void  login(String user_id,String user_password,String user_type,HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		//这里获取到账号密码和类型

		HttpSession session=request.getSession();
		
		if(user_type.equals("junior"))
		{
		int i=check_junior(user_id,user_password);
		if(i==0)
		{
			 response.getWriter().write("账号或密码错误");
		
		}
		else if(i==1)
		{
			response.getWriter().write("学生登录成功");
			session.setAttribute("junior", user_id);	
		}
		
		}
		else if(user_type.equals("college")){
			int i=check_college(user_id,user_password);
			if(i==0) {response.getWriter().write("账号待审核中");}
			else if(i==1) {
				response.getWriter().write("大学生登录成功");
			session.setAttribute("college", user_id);	
			}
			else if(i==2) {response.getWriter().write("资料审核不通过,请重新上传(3秒后自动跳转)");}
			else if(i==3) {response.getWriter().write("账号或密码错误");}
		}
		else if(user_type.equals("staff")) {
			if(user_id.equals("admin")&&user_password.equals("admin"))
			{response.getWriter().write("客服登录成功");
			session.setAttribute("staff", user_id);	
			}
			else {
				{response.getWriter().write("账号或密码错误 ");}
			}
		}
		
		
	}

	private int check_college(String user_id, String user_password) {
		college college=otherMapper.college_login(user_id, user_password);
		
		if(college==null)
		{
			return 3;
		}else {
			return college.getCollege_statue();
		}
		
	}

	private int check_junior(String user_id, String user_password) {
		int i=otherMapper.junior_login(user_id, user_password);
		return i;
	}
	
}
