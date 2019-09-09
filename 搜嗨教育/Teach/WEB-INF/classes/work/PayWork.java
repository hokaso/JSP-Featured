package work;

import java.sql.Timestamp;

import org.hibernate.Session;
import org.hibernate.Transaction;

import DbUtils.HibernateUtil;
import bean.Buy;
import bean.Course;
import bean.Student;

public class PayWork {
	Session session;
	Transaction tx;
	
	//初始化上面两个参数
	public void init(){
		session=HibernateUtil.getSessionObject();
		tx=session.beginTransaction();
	}
	//提交查询
	public void destroy(){
		tx.commit();
		session.close();
	}
	
	public boolean PayCoin(String sno, String wIDtotal_amount) {
		this.init();
		String sql="from bean.Student b where b.sno="+sno;
		Student student = session.get(Student.class, sno);
		student.setScoin(student.getScoin()+Integer.parseInt(wIDtotal_amount));
		session.update(student);
		try{
			this.destroy();
		}catch(Exception e){
			return false;
		}
		
		return true;
	}
	public boolean PayCourse(String wIDout_trade_no, String sno, String cno) {
		this.init();
		Buy buy = new Buy();
		buy.setBno(wIDout_trade_no);
		buy.setCno(cno);
		buy.setSno(sno);
		Timestamp d = new Timestamp(System.currentTimeMillis());
		buy.setBtime(d);
		session.save(buy);
		try{
			this.destroy();
			return true;
		}catch(Exception e){
			return false;
		}
		
		
	}
	
	
}
