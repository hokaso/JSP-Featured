package DbUtils;
import java.sql.Timestamp;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.junit.Test;

import bean.Course;
import bean.Fileone;

public class Uploadcourse {
	Session session;
	Transaction tx;
	
	public void init(){
		session = HibernateUtil.getSessionObject();
		tx = session.beginTransaction();
	}
	public void destroy(){
		tx.commit();
		session.close();
	}
	public boolean addcourse(String cno,String cname,String tno,String ctype,String cdescribe,String cphoto,Timestamp ctime) {
		this.init();
		Course co=new Course();
		co.setCno(cno);
		co.setCname(cname);
		co.setTno(tno);
		co.setCtype(ctype);
		co.setCdescribe(cdescribe);
		co.setCphoto(cphoto);
		co.setCtime(ctime);
		session.save(co);
		this.destroy();
		if(cno.equals(co.getCno())) {
			return true;
		}
		else {
			return false;
		}
		
	}
	
	public boolean addchapter(String fno,String fname,String cno,Timestamp ftime,String fupload,int fprice) {
		this.init();
		Fileone fl=new Fileone();
		fl.setFno(fno);
		fl.setFname(fname);
		fl.setCno(cno);
		fl.setFtime(ftime);
		fl.setFupload(fupload);
		fl.setFprice(fprice);
		session.save(fl);
		this.destroy();
		if(cno.equals(fl.getCno())) {
			return true;
		}
		else {
			return false;
		}
	}
	
	public List<Course> search(String teacherno) {
		this.init();
		String sql="from bean.Course c where c.tno ="+ teacherno;
		Query query=session.createQuery(sql);
		List<Course> list=query.list();
		this.destroy();
		
		return list;
	}
	@Test
	public String Price(String teacherno) {
		this.init();
		String sql = "select t.tno ,sum(f.fprice) from bean.Course c,bean.Fileone f,"
				+ "bean.Look l,bean.Teacher t where l.fno=f.fno and f.cno=c.cno "
				+ "and c.tno=t.tno and t.tno='"+teacherno+"'";
		List<Object[]> list = session.createQuery(sql).list();
		try{
			this.destroy();
			String price=list.get(0)[1]+"";
			
			System.out.println(price);
			return price;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		
		
	}
	
}
