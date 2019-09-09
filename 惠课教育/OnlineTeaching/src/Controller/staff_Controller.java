package Controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import Pojo.college;
import ServiceImpl.collegeServiceImpl;
import ServiceImpl.staffServiceImpl;

@Controller
public class staff_Controller {

	@Resource
	private staffServiceImpl staffServiceImpl;
	
	@Resource
	private collegeServiceImpl collegeServiceImpl;
	
	@RequestMapping("check_all_college")
	public String check_all_college(HttpServletRequest request)
	{
		
		List<college> list=staffServiceImpl.check_college_statue();
		
		
		request.setAttribute("list", list);
		
		return "staff_register_list";
	}//检查所有状态为0的用户
	
	
	
	//修改大学生的状态
	@RequestMapping("update_college_statue")
	public String update_college_statue(String college_id,int college_statue)
	{
		staffServiceImpl.update_college_statue(college_id, college_statue);
		
		return "check_all_college";
	}


	@RequestMapping("staff_register_introduction")
	public String staff_register_introduction()
	{
		return "staff/staff_register_introduction.jsp";
	}

	
	
}
