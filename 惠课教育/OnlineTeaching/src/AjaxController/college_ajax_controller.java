package AjaxController;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import Pojo.college;
import ServiceImpl.collegeServiceImpl;
import ServiceImpl.juniorServiceImpl;

@Controller
public class college_ajax_controller {
    @Resource
	private collegeServiceImpl collegeServiceImpl;
    
    @Resource
    private juniorServiceImpl juniorServiceImpl;
    
    @RequestMapping("college_update_password")
    public String college_update_password()
    {
    	return "college/college_update_password.jsp";
    }
   
    
    @RequestMapping("college_update_password2")
	public void college_update_password2(String before_password,String after_password,HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		String college_id=(String)request.getSession().getAttribute("college");
		String password=collegeServiceImpl.college_find_password(college_id);
		if(password.equals(before_password))
		{
			collegeServiceImpl.college_update_password(college_id, after_password);
		
			 response.getWriter().write("修改密码成功");
			//业务
			
		}else{
			 response.getWriter().write("修改密码失败");
	
		}
		
	}
    
    @RequestMapping("college_register_check")
    public void college_register_check(String college_id,HttpServletResponse response,HttpServletRequest request) throws IOException
    {
    	int count=collegeServiceImpl.college_register_check(college_id);
    	int count2=juniorServiceImpl.junior_register_check(college_id);
    	if(count>0||count2>0)
    	{
    		 response.getWriter().write("账号不可用");
    		 //检测到有一样的账号 
    	}
    	else{
    		
    		response.getWriter().write("账号可用");
    	}
    
    }
    
    
    
 
}
