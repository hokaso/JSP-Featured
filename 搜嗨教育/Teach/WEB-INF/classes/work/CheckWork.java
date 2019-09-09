package work;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.junit.Test;

import DbUtils.HibernateUtil;
import bean.Look;
import bean.Student;

public class CheckWork {
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

	public boolean Checklook(String fno,String sno) {
		this.init();
		String sql = "from bean.Look f where f.fno="+fno+" and f.sno="+sno;
		List<Look> looks=session.createQuery(sql).list();
		this.destroy();
		if(looks.size()>0){
			return true;
		}
		else{
			return false;
		}
//		System.out.println(looks.size());
	}
	@Test
	public boolean Checkcoin(Look look) {
		this.init();
//		Look look=new Look();
//		look.setFno("102");
//		look.setLno("001");
//		look.setSno("13078390270");
		session.save(look);
		try{
			this.destroy();
		}catch(Exception e){
			return false;
		}
		
		return true;
	}
	
	public void SubtractCoin(String sno,int scoin) {
		this.init();
		Student student = session.get(Student.class, sno);
		student.setScoin(scoin);
		session.update(student);
		this.destroy();
		
	}
	
}
