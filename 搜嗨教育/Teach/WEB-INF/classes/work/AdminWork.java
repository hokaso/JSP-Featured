package work;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.junit.Test;

import DbUtils.HibernateUtil;
import bean.Course;
import bean.Teacher;

public class AdminWork {
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
	@Test
	public List<Teacher> AdminTeacher() {
		this.init();
		String sql = "from bean.Teacher t where t.flag=0";
		List<Teacher> teacher= session.createQuery(sql).list();
		this.destroy();
		return teacher;
	}
	public boolean UpdateFlag(String tno) {
		this.init();
		Teacher t= session.get(Teacher.class, tno);
		t.setFlag(1);
		session.update(t);
		try{
			this.destroy();
			return true;
		}catch(Exception e){
			return false;
		}
		
	}
}
