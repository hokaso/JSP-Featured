package DbUtils;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {
	private static final Configuration cfg;
	private static final SessionFactory sessionFactory;
	static{
		cfg = new Configuration().configure();
		sessionFactory = cfg.buildSessionFactory();
	}
	public static Session getSessionObject(){
		return sessionFactory.openSession();
	}
	public static SessionFactory getSessionFactory(){
		return sessionFactory;
	}
}
