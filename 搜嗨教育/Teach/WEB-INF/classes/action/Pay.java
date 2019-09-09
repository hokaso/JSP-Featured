package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import bean.Course;
import bean.Student;
import work.LoginWork;
import work.PayWork;

public class Pay extends ActionSupport{
	private String WIDtotal_amount;
	private String WIDout_trade_no;
	private String WIDsubject;
	private String flag;
	
	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String getWIDout_trade_no() {
		return WIDout_trade_no;
	}

	public void setWIDout_trade_no(String wIDout_trade_no) {
		WIDout_trade_no = wIDout_trade_no;
	}

	public String getWIDsubject() {
		return WIDsubject;
	}

	public void setWIDsubject(String wIDsubject) {
		WIDsubject = wIDsubject;
	}

	public String getWIDtotal_amount() {
		return WIDtotal_amount;
	}

	public void setWIDtotal_amount(String wIDtotal_amount) {
		WIDtotal_amount = wIDtotal_amount;
	}

	public String PPay(){
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session=request.getSession();
//		Student student = (Student)session.getAttribute("student");
		session.setAttribute("WIDtotal_amount", WIDtotal_amount);
		session.setAttribute("WIDout_trade_no", WIDout_trade_no);
		session.setAttribute("WIDsubject", WIDsubject);
		session.setAttribute("flag", flag.trim());
		System.out.println(WIDtotal_amount+" "+WIDout_trade_no+" "+WIDsubject);
		return SUCCESS;
	}
	//充值v币
	public String PayCoin(){
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		String WIDtotal_amount = (String)session.getAttribute("WIDtotal_amount");
		String WIDout_trade_no = (String)session.getAttribute("WIDout_trade_no");
		String WIDsubject = (String)session.getAttribute("WIDsubject");
		String flags=(String)session.getAttribute("flag");
		Course course = (Course)session.getAttribute("course");
		Student student = (Student)session.getAttribute("student");
		PayWork pw =new PayWork();
		System.out.println(flags);
		if(flags.equals("kobe")){
			boolean result = pw.PayCoin(student.getSno(),WIDtotal_amount);
			//重新获取student
			 LoginWork lw = new LoginWork();
				Student sd = lw.ExaLogin1(student.getSno());
				session.setAttribute("student", sd);
			
			if(result){
				return SUCCESS;
			}else{
				return "error";
			}
		}
		else {
			System.out.println(WIDout_trade_no+" "+student.getSno()+" "+course.getCno());
			boolean result = pw.PayCourse(WIDout_trade_no,student.getSno(),course.getCno());
		
			if(result){
				return SUCCESS;
			}else{
				return "error";
			}
		}
		
	}
}
