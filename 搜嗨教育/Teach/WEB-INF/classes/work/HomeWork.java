package work;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import DbUtils.HibernateUtil;

public class HomeWork {
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
	public List<Object[]> ComputerOffice(){
		this.init();
		String sql = "select c.cno,c.cname from bean.Course c where ctype='电脑办公'";
		List<Object[]> result=session.createQuery(sql).list();
		this.destroy();
		return result;
	}
	public List<Object[]> Design(){
		this.init();
		String sql = "select c.cno,c.cname from bean.Course c where ctype='平面设计'";
		List<Object[]> result=session.createQuery(sql).list();
		this.destroy();
		return result;
	}
	public List<Object[]> Programa(){
		this.init();
		String sql = "select c.cno,c.cname from bean.Course c where ctype='程序开发'";
		List<Object[]> result=session.createQuery(sql).list();
		this.destroy();
		return result;
	}
	public List<Object[]> WebDesign(){
		this.init();
		String sql = "select c.cno,c.cname from bean.Course c where ctype='网页设计'";
		List<Object[]> result=session.createQuery(sql).list();
		this.destroy();
		return result;
	}
	public List<Object[]> Video(){
		this.init();
		String sql = "select c.cno,c.cname from bean.Course c where ctype='影视动画'";
		List<Object[]> result=session.createQuery(sql).list();
		this.destroy();
		return result;
	}
	public List<Object[]> InnerDesign(){
		this.init();
		String sql = "select c.cno,c.cname from bean.Course c where ctype='室内设计'";
		List<Object[]> result=session.createQuery(sql).list();
		this.destroy();
		return result;
	}
	public List<Object[]> OutDesign(){
		this.init();
		String sql = "select c.cno,c.cname from bean.Course c where ctype='室外设计'";
		List<Object[]> result=session.createQuery(sql).list();
		this.destroy();
		return result;
	}
	@org.junit.Test
	public List<List<Object[]>> DoHomeWork() {
		List<Object[]> result=ComputerOffice();
		List<Object[]> result2=Design();
		List<Object[]> result3=Programa();
		List<Object[]> result4=WebDesign();
		List<Object[]> result5=Video();
		List<Object[]> result6=InnerDesign();
		List<Object[]> result7=OutDesign();
		List<List<Object[]>> all=new ArrayList<List<Object[]>>();
		all.add(result);
		all.add(result2);
		all.add(result3);
		all.add(result4);
		all.add(result5);
		all.add(result6);
		all.add(result7);
		
//			for(int j=0;j<all.get(0).size();j++){
//				System.out.println(all.get(0).get(j)[1]);
//			}
			
		

		return all;
	}
	
}
