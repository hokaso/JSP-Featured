package Pet.dao.impl;

import Pet.dao.CommentDao;
import Pet.entity.CommentPO;

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
public class CommentDaoImpl extends HibernateDaoSupport implements CommentDao {
	
	@Autowired
	public void setSessionFactory0(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}

	@Override
    public int findCountComment() {
        String hql = "SELECT COUNT(*) FROM CommentPO ";
        List<Long> list = (List<Long>) this.getHibernateTemplate().find(hql);
        if (list.size() > 0) {
            return list.get(0).intValue();
        }
        return 0;
    }

    @Override
    public List<CommentPO> findComment(int begin, int pageCount) {
        DetachedCriteria criteria = DetachedCriteria.forClass(CommentPO.class);
        criteria.addOrder(Order.desc("id"));
        List<CommentPO> list = (List<CommentPO>) this.getHibernateTemplate().findByCriteria(criteria, begin, pageCount);
        return list;
    }

    @Override
    public void deleteComment(CommentPO commentPO) {
        this.getHibernateTemplate().delete(commentPO);
    }

    @Override
    public void deleteMoreComment(String[] checkCommentIDs) {
    	for (String commentID : checkCommentIDs) {
            CommentPO thisComment = this.getHibernateTemplate().get(CommentPO.class, Integer.parseInt(commentID.trim()));
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
