package Pet.dao.impl;

import Pet.dao.CommentDao2;
import Pet.entity.CommentPO2;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import java.sql.SQLException;
import java.util.List;

@Repository
@SuppressWarnings("all")
public class CommentDaoImpl2 extends HibernateDaoSupport implements CommentDao2 {
	
	@Autowired
	public void setSessionFactory0(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}

	@Override
    public int findCountComment() {
        String hql = "SELECT COUNT(*) FROM CommentPO2 ";
        List<Long> list = (List<Long>) this.getHibernateTemplate().find(hql);
        if (list.size() > 0) {
            return list.get(0).intValue();
        }
        return 0;
    }

    @Override
    public List<CommentPO2> findComment(int begin, int pageCount) {
    	System.out.println("112112111221");
        DetachedCriteria criteria = DetachedCriteria.forClass(CommentPO2.class);
        criteria.addOrder(Order.desc("id"));
        List<CommentPO2> list = (List<CommentPO2>) this.getHibernateTemplate().findByCriteria(criteria, begin, pageCount);
        return list;
    }

    @Override
    public void deleteComment(CommentPO2 commentPO2) {
        this.getHibernateTemplate().delete(commentPO2);
    }

    @Override
    public void deleteMoreComment(String[] checkCommentIDs) {
    	for (String commentID : checkCommentIDs) {
            CommentPO2 thisComment = this.getHibernateTemplate().get(CommentPO2.class, Integer.parseInt(commentID.trim()));
            this.getHibernateTemplate().delete(thisComment);
        }
//        this.getHibernateTemplate().execute(new HibernateCallback<Object>() {
//
//			@Override
//			public Object doInHibernate(Session session) throws HibernateException {
//				session.beginTransaction();
//				for (String commentID : checkCommentIDs) {
//					session.delete(commentID);
//				}
//				session.getTransaction().commit();
//				session.flush();
//				session.clear();
//				return null;
//
//			}
//        	 
//		}
//
//	);

    }
}
