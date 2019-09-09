package Controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.print.DocFlavor.STRING;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import Mapper.collegeMapper;
import Pojo.college;
import Pojo.course;
import Pojo.teach;
import Utiles.TimeToString;
import ServiceImpl.collegeServiceImpl;
import ServiceImpl.teachServiceImpl;
import ServiceImpl.courseServiceImpl;

@Controller
public class college_Controller {
	@Resource
	private collegeServiceImpl collegeServiceImpl;
	
	@Resource
	private teachServiceImpl teachServiceImpl;
	
	@Resource
	private courseServiceImpl courseServiceImpl;
	
	@RequestMapping("college_register")
	public String register(MultipartFile file,college college) throws IOException
	{  
		String filen = file.getOriginalFilename();
		String suffix=filen.substring(filen.lastIndexOf("."));//文件后缀
		
        String fakepath="/photo/"+TimeToString.CreateTimeString()+college.getCollege_id()+suffix;
        String path="F:"+fakepath;
        college.setCollege_photo(fakepath);
        college.setCollege_statue(0);
       
        collegeServiceImpl.college_register(college);
		FileUtils.copyInputStreamToFile(file.getInputStream(), new File(path));
		return "login";
	}
	
	//显示该大学生的所有订单
	@RequestMapping("college_check_order")
	public String college_check_order(HttpServletRequest request)
	{
		HttpSession session=request.getSession();
		String college_id=(String) session.getAttribute("college");
		List<course> list=collegeServiceImpl.college_find_course(college_id);
		request.setAttribute("list", list);
		return "college_all_course";
	}
	
	@RequestMapping("college_all_course")
	public String college_all_course()
	{
		return "college/college_all_course.jsp";
	}
	
	//显示某订单的详情
	@RequestMapping("college_order_details")
	public String college_order_details(int course_id,HttpServletRequest request)
	{
		teach teach=teachServiceImpl.teach_find_by_course_id(course_id);
		request.setAttribute("teach", teach);
		return "college/college_order_details.jsp";
	}
	
	//某课程的信息（未被购买前）
	@RequestMapping("college_course_details")
	public String college_course_details(int course_id,HttpServletRequest request)
	{
		course course=courseServiceImpl.course_find_by_id(course_id);
		
		request.setAttribute("course", course);
		
		return "college/college_course_details.jsp";
	}
	
	//大学生详细信息
	@RequestMapping("college_details")
	public String college_details(String college_id,HttpServletRequest request)
	{
		college college=collegeServiceImpl.college_find_by_id(college_id);
		int score=teachServiceImpl.teach_average_score(college_id);
		
		request.setAttribute("college", college);
		request.setAttribute("score",score);
		
		return "college/college_details.jsp";//显示大学生详细信息
	}
	
	//更新信息前
	@RequestMapping("college_update_information1")
	public String college_update_information1(HttpServletRequest request)
	{
		String college_id=(String)request.getSession().getAttribute("college");
		
		college college=collegeServiceImpl.college_find_by_id(college_id);
		request.setAttribute("college", college);
		return "college_update_information";
	}
	
	//更新信息后
	@RequestMapping("college_update_information")
	public String college_update_information()
	{
		return "college/college_update_information.jsp";
	}
	
	@RequestMapping("college_update_information2")
	public String college_update_information2(college college)
	{
		collegeServiceImpl.college_update_information(college);
		
		return "college_check_order";
		
	}
	
	@RequestMapping("college_course_upload")
	public String college_course_upload()
	{
		return "college/college_course_upload.jsp";
	}
	
	@RequestMapping("college_photo_upload1")
	public String college_photo_upload1(String college_id,HttpServletRequest request)
	{
		//跳转至该页面
		college college=collegeServiceImpl.college_find_by_id(college_id);
        request.setAttribute("college", college);
		return "college/college_photo_upload.jsp";
	}
	
	@RequestMapping("college_photo_upload2")
	public String college_photo_upload2(MultipartFile file,String college_id,HttpServletRequest request) throws IOException
	{

		String filen = file.getOriginalFilename();
		String suffix=filen.substring(filen.lastIndexOf("."));//文件后缀
		
        String fakepath="/photo/"+TimeToString.CreateTimeString()+college_id+suffix;
        String path="F:"+fakepath;
        
		FileUtils.copyInputStreamToFile(file.getInputStream(), new File(path));
		collegeServiceImpl.college_photo_update(college_id, fakepath);
		
		return "login";
	}
	
	
	@RequestMapping("chat_online_college_list")
	public String chat_online_college_list(HttpServletRequest request) {
		
		return "chat/chat_online_college_list.jsp";
	}
	
	
	
	
}
