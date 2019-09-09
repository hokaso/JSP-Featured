package ExcelController;

import java.io.IOException;
import java.io.OutputStream;
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

import Pojo.teach;
import ServiceImpl.teachServiceImpl;

@Controller
public class junior_excel_controller {

	@Resource
	private teachServiceImpl teachServiceImpl;
	
	@RequestMapping("junior_excel_controller")
	public String  junior_excel_controller(HttpServletRequest request,HttpServletResponse response) throws IOException {
		    HttpSession session=request.getSession();
	        String junior_id=(String) session.getAttribute("junior");
		
		    List<teach> list=teachServiceImpl.teach_find_by_junior_id(junior_id);
		    
		    HSSFWorkbook workbook =new HSSFWorkbook();
			
			Sheet sheet=workbook.createSheet("1");
			
			Row row=sheet.createRow(0);
			
			row.createCell(0).setCellValue("课程号");
			row.createCell(1).setCellValue("课程名称");
			row.createCell(2).setCellValue("大学生ID");
			row.createCell(3).setCellValue("课程状态");
			row.createCell(4).setCellValue("评分状态");
			
			for(int i=0;i<list.size();i++)
			{	
				    row=sheet.createRow(i+1);
					row.createCell(0).setCellValue(list.get(i).getTeach_id());
					row.createCell(1).setCellValue(list.get(i).getCourse_id());
					row.createCell(2).setCellValue(list.get(i).getCollege_id());
					row.createCell(3).setCellValue(list.get(i).getScore_statue());
					row.createCell(4).setCellValue(list.get(i).getCollege_score());
				
			}
			
			 OutputStream os =response.getOutputStream();
			 response.reset();
			 response.setHeader("Content-Disposition", "inline; filename=" + junior_id+".xls");
	         response.setContentType("APPLICATION/OCTET-STREAM");  
	         workbook.write(os);
	         os.flush();   
	         os.close();  
			
		return null;
		
	}
	
}
