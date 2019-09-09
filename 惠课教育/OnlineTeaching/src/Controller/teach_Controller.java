package Controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import ServiceImpl.*;
import Utiles.TimeToString;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import Pojo.course;
import Pojo.teach;

@Controller
public class teach_Controller {

	@Resource
	private courseServiceImpl courseServiceImpl;

	@Resource
	private teachServiceImpl teachServiceImpl;

	@RequestMapping("teach_buy")
	public String course_buy(int course_id, HttpServletRequest request,int course_price) {
	    HttpSession session = request.getSession();
		String junior_id = (String) session.getAttribute("junior");
		course course = courseServiceImpl.course_find_by_id(course_id); //根据courseid获取course
		
		String college_id=course.getCollege_id();
		teach teach = new teach();
		
		teach.setCollege_id(course.getCollege_id());
		teach.setCourse_id(course_id);
		teach.setJunior_id(junior_id);
		
		String teach_id = TimeToString.CreateTimeString() + junior_id;
		
		teach.setTeach_id(teach_id);
		teach.setTeach_statue("未授课");
		
		
		session.setAttribute("teach", teach);
		
		session.setAttribute("WIDout_trade_no", teach_id);//订单号
		session.setAttribute("WIDtotal_amount", course_price);//付款金额
        session.setAttribute("WIDsubject", "惠课交易");
		//teachServiceImpl.teach_add_order(teach);
		//courseServiceImpl.course_buy(course_id);

		return "alipay.trade.page.pay.jsp";
	}
	
	@RequestMapping("teach_buy_success")
	public String course_buy_success(HttpServletRequest request) {
		  HttpSession session=request.getSession();
		  teach teach=(Pojo.teach) session.getAttribute("teach");
		
		  teachServiceImpl.teach_add_order(teach);
		 courseServiceImpl.course_buy(teach.getCourse_id());
		
		 session.removeAttribute("teach");
			session.removeAttribute("WIDout_trade_no");//订单号
			session.removeAttribute("WIDtotal_amount");//付款金额
			session.removeAttribute("WIDsubject");
     	  return "course_show_all";
	}
	

	//大学生授课
	@RequestMapping("teach_teach")
	public String teach_teach(String teach_id)
	{
		teachServiceImpl.teach_teach(teach_id);
		return "college_check_order";
	}
	
	
}
