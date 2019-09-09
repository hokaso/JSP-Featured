package work;

import org.hibernate.Session;
import org.hibernate.Transaction;

import DbUtils.HibernateUtil;
import bean.Student;
import bean.Teacher;

public class RegisterWork {
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
	public boolean Register(Student student) {
		this.init();
		session.save(student);
		try{
			this.destroy();
		}
		catch(Exception e){
			return false;
		}
		return true;

	}
	public boolean TeacherRegister(Teacher teacher) {
		this.init();
		Teacher t = new Teacher();
		t.setTno(teacher.getTno());
		t.setTname(teacher.getTname());
		t.setTsex(teacher.getTsex());
		t.setTpassword(teacher.getTpassword());
		
		t.setTphone(teacher.getTphone());
		t.setTregisterTime(teacher.getTregisterTime());
		t.setTemail(teacher.getTno());
		session.save(t);
		try{
			this.destroy();
		}catch(Exception e){
			return false;
		}
		return true;
	}
}
