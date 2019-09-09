package work;

import java.sql.Timestamp;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.junit.Test;

import DbUtils.HibernateUtil;
import bean.Course;
import bean.Fileone;
import bean.Teacher;
import bean.Comment;
public class GetPlayWork {
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
	
	public Course getPlay(String cno) {
		
		this.init();
		String sql = "from bean.Course c where c.cno="+cno;
		List<Course> course= session.createQuery(sql).list();
		Course c=course.get(0);
		this.destroy();
//		System.out.println(course.get(0).getCname());
		return c;
	}
	
	public List<Fileone> getPlayList(String cno) {
		this.init();
		String sql = "from bean.Fileone f where f.cno="+cno;
		List<Fileone> fileone = session.createQuery(sql).list();
		this.destroy();
//		System.out.println(fileone.get(0).getCno());
		return fileone;
	}
	@Test
	public String getTeacherName(String tno) {
		this.init();
		String sql = "select tname from bean.Teacher t where t.tno="+tno;
		List<String> teacher=session.createQuery(sql).list();
		this.destroy();
		return teacher.get(0);
	}
	public List<Comment> Comment(String cno) {
		this.init();
		String sql = "from bean.Comment co where co.cno="+cno;
		List<Comment> comments=session.createQuery(sql).list();
		this.destroy();
		return comments;
	}
	public boolean PlayComment(String sno, String cno, String commentTxt, Timestamp d) {
		this.init();
		Comment comment = new Comment();
		comment.setCno(cno);
		comment.setSno(sno);
		comment.setTime(d);
		comment.setCom(commentTxt);
		session.save(comment);
		try{
			this.destroy();
			return true;
		}catch(Exception e){
			return false;
		}
		
		
	}
	
}
