package AjaxController;

import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import ServiceImpl.collegeServiceImpl;
import ServiceImpl.juniorServiceImpl;

@Controller
public class junior_ajax_controller {
    
	@Resource
	private juniorServiceImpl juniorServiceImpl;
	
	@Resource
	private collegeServiceImpl collegeServiceImpl;
	
	
	@RequestMapping("junior_update_password")
	public String junior_update_password()
	{
		return "junior/junior_update_password.jsp";
	}
	
	    @RequestMapping("junior_update_password2")
		public void junior_update_password2(String before_password,String after_password,HttpServletRequest request,HttpServletResponse response) throws IOException
		{
			String junior_id=(String)request.getSession().getAttribute("junior");
			String password=juniorServiceImpl.junior_find_password(junior_id);
			if(password.equals(before_password))
			{
				juniorServiceImpl.junior_update_password(junior_id, after_password);
			
				 response.getWriter().write("修改密码成功");
				//业务
				
			}else{
				 response.getWriter().write("修改密码失败");
		
			}
			
		}
	    
	    
	    
	    @RequestMapping("junior_register_check")
	    public void junior_register_check(String junior_id,HttpServletResponse response,HttpServletRequest request) throws IOException
	    {
	    	int count=juniorServiceImpl.junior_register_check(junior_id);
	    	int count2=collegeServiceImpl.college_register_check(junior_id);
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
