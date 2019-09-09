package Controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.print.DocFlavor.STRING;
import javax.print.attribute.standard.RequestingUserName;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import Mapper.courseMapper;
import Pojo.course;
import Pojo.teach;
import Service.courseService;
import ServiceImpl.courseServiceImpl;
import Utiles.TimeToString;

@Controller
public class course_Controller {

	@Resource
	private courseServiceImpl courseServiceImpl;
	
	@RequestMapping("course_add")
	public String course_add(course course,HttpServletRequest request,MultipartFile file) throws IOException
	{
		
		HttpSession session=request.getSession();
		String college_id=(String) session.getAttribute("college");
		course.setCollege_id(college_id);
		course.setCourse_statue("未被购买");
		
		String filen = file.getOriginalFilename();
		String suffix=filen.substring(filen.lastIndexOf("."));//文件后缀
		String fakepath="/photo/"+new TimeToString().CreateTimeString()+course.getCollege_id()+suffix;
	    String path="F:"+fakepath;
	    course.setCourse_photo(fakepath);
	    
		courseServiceImpl.course_add(course);
		
		FileUtils.copyInputStreamToFile(file.getInputStream(), new File(path));
		
		return "college_check_order"; 
	}
	
	@RequestMapping("course_show_details")
	public String course_show_details(HttpServletRequest request,int course_id)
	{
		course course=courseServiceImpl.course_find_by_id(course_id);
	    request.setAttribute("course", course);
		return "course/course_show_details.jsp";
	}
	
	
	
	
	@RequestMapping("course_find_by_name")
	public String course_find_by_name(String course_name,HttpServletRequest request)
	{
		List<course> list=courseServiceImpl.course_find_by_name(course_name);
		request.setAttribute("list", list);	
		return "course_show_all";
	}
	
	@RequestMapping("course_find_by_type")
	public String course_find_by_type(String course_type,HttpServletRequest request)
	{
		System.out.println("type:"+course_type);
		List<course> list=courseServiceImpl.course_find_by_type(course_type);
		System.out.println(list);
		request.setAttribute("list", list);
		return "course_show_all";
		
	}
	
	@RequestMapping("course_show_all")
	public String college_all_course()
	{
		return "course/course_show_all.jsp";
	}
	
	@RequestMapping("course_update_information1")
	public String course_update_information1(HttpServletRequest req,int course_id)
	{
		
		course course=courseServiceImpl.course_find_by_id(course_id);
		
		req.setAttribute("course", course);
		return "course/course_update_information.jsp";
		//该页面显示详细信息
	}
	
	
	@RequestMapping("course_update_information2")
	public String course_update_information2(course course,HttpServletRequest request,MultipartFile file) throws IOException
	{   SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		if(file.isEmpty())
		{
			//原路径
			String path=courseServiceImpl.course_find_by_id(course.getCourse_id()).getCourse_photo();
		
			course.setCourse_photo(path);//把原来的照片路径放回来
			courseServiceImpl.course_update_information(course);
		}else {
			//更新照片
			String filen = file.getOriginalFilename();
			String suffix=filen.substring(filen.lastIndexOf("."));//文件后缀
			String fakepath="/photo/"+new TimeToString().CreateTimeString()+course.getCollege_id()+suffix;
		    String path="F:"+fakepath;
		    course.setCourse_photo(fakepath);
			courseServiceImpl.course_update_information(course);;
			FileUtils.copyInputStreamToFile(file.getInputStream(), new File(path));
		}
		 return "college_check_order";
		//该页面显示详细信息
	}

}
