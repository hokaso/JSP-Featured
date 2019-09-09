package action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;


import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import work.HomeWork;

public class Homepage extends ActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public String AllMessage(){
		HttpServletRequest request = ServletActionContext.getRequest();
//		HttpSession session = request.getSession();
		HomeWork hw = new HomeWork();
		List<List<Object[]>> all=hw.DoHomeWork();
		request.setAttribute("all", all);
		return SUCCESS;
	}
}
