package Controller;

import java.util.List;

import javax.annotation.Resource;
import javax.print.DocFlavor.STRING;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestScope;

import Pojo.junior;
import Pojo.teach;
import ServiceImpl.juniorServiceImpl;
import ServiceImpl.teachServiceImpl;

@Controller
public class junior_Controller {
   
	@Resource
	private juniorServiceImpl juniorServiceImpl;
	
	@Resource
	private teachServiceImpl teachServiceImpl;

	//中小学生注册
    @RequestMapping("junior_register")
    public String register(junior junior)
    {
    	juniorServiceImpl.junior_register(junior);
    	return "login";
    }
    
    //中小学生详细信息
    @RequestMapping("junior_details")
    public String junior_details(HttpServletRequest request)
    {
    	String junior_id=(String) request.getSession().getAttribute("junior");
    	junior junior=juniorServiceImpl.junior_find_by_id(junior_id);
    	
    	request.setAttribute("junior", junior);
    	return "junior/junior_details.jsp";
    }
    
    //中小学生订单信息
    @RequestMapping("junior_check_order")
    public String junior_check_order(HttpServletRequest request)
    {
    	String junior_id=(String) request.getSession().getAttribute("junior");
    	List<teach> list=teachServiceImpl.teach_find_by_junior_id(junior_id);
    	request.setAttribute("list", list);
    	return "junior_all_order";
    }
    
    @RequestMapping("junior_all_order")
    public String junior_all_order()
    {
    	return "junior/junior_all_order.jsp";
    }
    
    //获取该订单，把订单信息给junior_score.jsp
    @RequestMapping("junior_score")
    public String junior_score(String teach_id,HttpServletRequest request)
    {
    	teach teach=teachServiceImpl.teach_find_by_id(teach_id);
    	request.setAttribute("teach", teach);
        
    	return "junior/junior_score.jsp";
    }
    
    
    @RequestMapping("junior_update_score")
    public String junior_update_score(String teach_id,int college_score)
    {
    	juniorServiceImpl.junior_update_score(teach_id, college_score);
    	
    	return "junior_check_order";
    }
    
    
    
    @RequestMapping("junior_update_information1")
    public String junior_update_information1(HttpServletRequest request)
    {
    	HttpSession session=request.getSession();
    	String junior_id=(String) session.getAttribute("junior");
    	
    	junior junior=juniorServiceImpl.junior_find_by_id(junior_id);
    	request.setAttribute("junior", junior);
    	return "junior_update_information";
    }
    
    @RequestMapping("junior_update_information")
    public String junior_update_information()
    {
    	return "junior/junior_update_information.jsp";
    }
    
    @RequestMapping("junior_update_information2")
    public String junior_update_information2(HttpServletRequest request,junior junior)
    {
//    	不更新id和密码
    	juniorServiceImpl.junior_update_information(junior);
    	return "course_show_all";
    }
	
}
