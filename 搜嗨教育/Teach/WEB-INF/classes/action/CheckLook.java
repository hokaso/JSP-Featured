package action;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import bean.Fileone;
import bean.Look;
import work.CheckWork;

public class CheckLook extends ActionSupport{
	private String fno;
	private String sno;
	private String scoin;
	
	public String getScoin() {
		return scoin;
	}
	public void setScoin(String scoin) {
		this.scoin = scoin;
	}
	public String getFno() {
		return fno;
	}
	public void setFno(String fno) {
		this.fno = fno;
	}
	public String getSno() {
		return sno;
	}
	public void setSno(String sno) {
		this.sno = sno;
	}
	//检查是否看过这一节
	public void CheckLook() throws IOException{
		CheckWork cw = new CheckWork();
		boolean result = cw.Checklook(fno,sno);
		HttpServletResponse response=ServletActionContext.getResponse();
		HttpServletRequest request=ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		response.getWriter().write(""+result);
	}
	//获取sno的v币数
	public void CheckCoin() throws IOException{
		CheckWork cw = new CheckWork();
		Look look=new Look();
		look.setFno(fno);
		look.setSno(sno);
		//获取当前时间
		Timestamp d = new Timestamp(System.currentTimeMillis());
		look.setLtime(d);
		look.setLno(d.getSeconds()+""+d.getMinutes()+""+d.getHours());
		System.out.println(look.getFno()+""+look.getLno()+""+look.getSno());
		boolean result = cw.Checkcoin(look);
		//减v币
		if(result){
			cw.SubtractCoin(sno,Integer.parseInt(scoin));
		}
		HttpServletResponse response=ServletActionContext.getResponse();
		response.getWriter().write(""+result);
	}
}
