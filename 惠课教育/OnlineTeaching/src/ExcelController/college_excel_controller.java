package ExcelController;

import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import Pojo.course;
import Pojo.teach;
import ServiceImpl.collegeServiceImpl;
import ServiceImpl.courseServiceImpl;
import ServiceImpl.teachServiceImpl;

@Controller
public class college_excel_controller {

	@Resource
	private teachServiceImpl teachServiceImpl;
	
	@Resource
	private courseServiceImpl courseServiceImpl;
	
	@Resource
	private collegeServiceImpl collegeServiceImpl;
	
	
	@RequestMapping("college_excel_controller")
	public String  college_excel_controller(HttpServletRequest request,HttpServletResponse response) throws IOException {
	
		   String college_id=(String) request.getSession().getAttribute("college");
		   List<course> course_list=collegeServiceImpl.college_find_course(college_id);
		   SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		   HSSFWorkbook workbook =new HSSFWorkbook();
			
			Sheet sheet=workbook.createSheet("1");
			
			Row row=sheet.createRow(0);
			
			row.createCell(0).setCellValue("课程号");
			row.createCell(1).setCellValue("课程类别");
			row.createCell(2).setCellValue("课程名称");
			row.createCell(3).setCellValue("课程时间");
			row.createCell(4).setCellValue("课程状态");
		   
		   
		   for(int z=0;z<course_list.size();z++)
		   {
			   course course=course_list.get(z);
			   
			   teach teach=teachServiceImpl.teach_find_by_course_id(course.getCourse_id());
			  
			 row=sheet.createRow(z+1);
			 
			 row.createCell(0).setCellValue(course.getCourse_id());
			 row.createCell(1).setCellValue(course.getCourse_type());
			 row.createCell(2).setCellValue(course.getCourse_name());
			 row.createCell(3).setCellValue(sdf.format(course.getCourse_time()));
			 row.createCell(4).setCellValue(course.getCourse_statue());

		   }
		   
		   OutputStream os =response.getOutputStream();
			 response.reset();
			 response.setHeader("Content-Disposition", "inline; filename=" + college_id+".xls");
	         response.setContentType("APPLICATION/OCTET-STREAM");  
	         workbook.write(os);
	         os.flush();   
	         os.close();  
		   return null;
	}
}
