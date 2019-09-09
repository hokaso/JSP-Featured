package work;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import DbUtils.HibernateUtil;
import bean.Manager;
import bean.Student;
import bean.Teacher;

public class LoginWork {
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
	//检查登录
	public Student ExaLogin(String phoneNum, String pwd) {
		this.init();
		String hql = " from bean.Student a where a.sno=:phoneNum and a.spassword=:pwd";
		Query query = session.createQuery(hql);
		query.setString("phoneNum", phoneNum);
		query.setString("pwd", pwd);
		List<Student> list = query.list();
		try{
			this.destroy();
			Student ano = null;
			ano=list.get(0);
			return ano;
		}catch(Exception e){
			return null;
		}
	}
	public Student ExaLogin1(String sno) {
		this.init();
		Student student = session.get(Student.class, sno);
		this.destroy();
		return student;
	}
	public int ExaTeacher(String account, String password) {
		this.init();
		String hql = " from bean.Teacher t where t.tno=:phoneNum and t.tpassword=:pwd";
		Query query = session.createQuery(hql);
		query.setString("phoneNum", account);
		query.setString("pwd", password);
		List<Teacher> list = query.list();
		System.out.println(list.size());
		try{
			this.destroy();

			return list.size();
		}catch(Exception e){
			return -1;
		}
		
	}
	public int ExaTeacherSuccess(String account, String password) {
		this.init();
		String hql = " from bean.Teacher t where t.tno=:phoneNum and t.tpassword=:pwd";
		Query query = session.createQuery(hql);
		query.setString("phoneNum", account);
		query.setString("pwd", password);
		List<Teacher> list = query.list();

		try{
			this.destroy();
			if(list.size()>0){
				return list.get(0).getFlag();
			}else{
				return -1;
			}
		}catch(Exception e){
			return -2;
		}
	}
	public Manager ExaAdmin(String account, String password) {
		this.init();
		String hql = " from bean.Manager m where m.maccount=:phoneNum and m.mpassword=:pwd";
		Query query = session.createQuery(hql);
		query.setString("phoneNum", account);
		query.setString("pwd", password);
		List<Manager> list = query.list();
		try{
			this.destroy();
			Manager m =list.get(0);
			return m;
		}catch(Exception e){
			return null;
		}
	}
}
