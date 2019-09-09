package Pet.dao.impl;

import Pet.entity.CommentPO;
import Pet.entity.CommentPO2;
import Pet.dao.ReviewDao;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by GUOFENG on 2017/5/7.
 */
@Repository
@SuppressWarnings("all")
public class ReviewDaoImpl extends HibernateDaoSupport implements ReviewDao {
    
	@Autowired
	public void setSessionFactory0(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}
	
	@SuppressWarnings("unchecked")
	@Override
    public List<CommentPO> findReviewOfFive(int begin, int count, int newsId) {
        DetachedCriteria criteria = DetachedCriteria.forClass(CommentPO.class);
        criteria.add(Restrictions.eq("news.newsId", newsId));
        criteria.addOrder(Order.desc("id"));
        List<CommentPO> list = (List<CommentPO>) this.getHibernateTemplate().findByCriteria(criteria, begin, count);
        return list;
    }

    @Override
    public void addReview(CommentPO commentPO) {
        this.getHibernateTemplate().save(commentPO);
    }

	@Override
	public List<CommentPO2> findReviewOfFive1(int begin, int count, int id) {
		// TODO Auto-generated method stub
		 DetachedCriteria criteria = DetachedCriteria.forClass(CommentPO2.class);
	        criteria.add(Restrictions.eq("vedio.id", id));
	        criteria.addOrder(Order.desc("id"));
	        List<CommentPO2> list = (List<CommentPO2>) this.getHibernateTemplate().findByCriteria(criteria, begin, count);
	        return list;
	}

	@Override
	public void addReview1(CommentPO2 commentPO2) {
		 this.getHibernateTemplate().save(commentPO2);
		
	}
}
