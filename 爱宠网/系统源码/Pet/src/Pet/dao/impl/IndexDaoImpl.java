package Pet.dao.impl;

import Pet.entity.HeadNews;
import Pet.entity.News;
import Pet.entity.Vedio;
import Pet.dao.IndexDao;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateCallback;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import java.math.BigInteger;
import java.util.List;

/**
 * 
 */
@Repository
@SuppressWarnings("all")
public class IndexDaoImpl extends HibernateDaoSupport implements IndexDao {
	@Autowired
	public void setSessionFactory0(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}
	

    @Override
    public News findNewsOfThis(int thisNewsId) {
        return this.getHibernateTemplate().get(News.class, thisNewsId);
    }


    @Override
    public List<HeadNews> findNewsOfHead() {
        DetachedCriteria criteria = DetachedCriteria.forClass(HeadNews.class);
        criteria.addOrder(Order.desc("id"));
        List<HeadNews> list = (List<HeadNews>) this.getHibernateTemplate().findByCriteria(criteria);
        return list;
    }


    @Override
    public int findCountNewsOfHot() {
        String sql = "select COUNT(distinct news_id) from `comment`";

        return this.getHibernateTemplate().execute(new HibernateCallback<Integer>() {
            @Override
            public Integer doInHibernate(Session session) throws HibernateException {
                Query query = session.createSQLQuery(sql);
                return ((BigInteger) query.uniqueResult()).intValue();
            }
        });
    }

    /**
     * 濮濄倖鏌熷▔鏇熸箒閺囩繝绱梿鍛畱閺傜懓绱＄紓鏍у晸閿涘矁顕稉宥呮殮鐠ф劖鏆�閵嗭拷
     * iamguofeng@163.com
     *
     * @param begin
     * @param pageCount
     * @return
     */
    @Override
    public List<News> findNewsOfHot(int begin, int pageCount) {
        String sql = "SELECT  mynews.*  FROM `news` as mynews,(select news_id as  nid,count(*) as ct FROM `comment` GROUP BY `comment`.news_id) as mycount WHERE mynews.news_id=mycount.nid ORDER BY mycount.ct DESC";
        return this.getHibernateTemplate().execute(new HibernateCallback<List<News>>() {
            @Override
            public List<News> doInHibernate(Session session) throws HibernateException {
                Query query = session.createSQLQuery(sql).addEntity(News.class)
                        .setFirstResult(begin)
                        .setMaxResults(pageCount);
                return (List<News>) query.list();
            }
        });
    }

    //--------------------------------------------------------
    @Override
    public int findCountNewsOfSociety() {
        String hql = "SELECT COUNT(*) FROM News WHERE newsTypePO.id=?";
        List<Long> list = (List<Long>) this.getHibernateTemplate().find(hql, 1);
        if (list.size() > 0) {
            return list.get(0).intValue();
        }
        return 0;
    }

    @Override
    public List<News> findNewsOfSociety(int begin, int pageCount) {
        DetachedCriteria criteria = DetachedCriteria.forClass(News.class);
        criteria.add(Restrictions.eq("newsTypePO.typeId", 1));
        criteria.addOrder(Order.desc("id"));
        List<News> list = (List<News>) this.getHibernateTemplate().findByCriteria(criteria, begin, pageCount);
        return list;
    }

    @Override
    public int findCountNewsOfTech() {
        String hql = "SELECT COUNT(*) FROM News WHERE newsTypePO.id=?";
        List<Long> list = (List<Long>) this.getHibernateTemplate().find(hql, 2);
        if (list.size() > 0) {
            return list.get(0).intValue();
        }
        return 0;
    }

    @Override
    public List<News> findNewsOfTech(int begin, int pageCount) {
        DetachedCriteria criteria = DetachedCriteria.forClass(News.class);
        criteria.add(Restrictions.eq("newsTypePO.typeId", 2));
        criteria.addOrder(Order.desc("id"));
        List<News> list = (List<News>) this.getHibernateTemplate().findByCriteria(criteria, begin, pageCount);
        return list;
    }

    @Override
    public int findCountNewsOfInte() {
        String hql = "SELECT COUNT(*) FROM News WHERE newsTypePO.id=?";
        List<Long> list = (List<Long>) this.getHibernateTemplate().find(hql, 3);
        if (list.size() > 0) {
            return list.get(0).intValue();
        }
        return 0;
    }

    @Override
    public List<News> findNewsOfInte(int begin, int pageCount) {
        DetachedCriteria criteria = DetachedCriteria.forClass(News.class);
        criteria.add(Restrictions.eq("newsTypePO.typeId", 3));
        criteria.addOrder(Order.desc("id"));
        List<News> list = (List<News>) this.getHibernateTemplate().findByCriteria(criteria, begin, pageCount);
        return list;
    }

    @Override
    public int findCountNewsOfMili() {
        String hql = "SELECT COUNT(*) FROM News WHERE newsTypePO.id=?";
        @SuppressWarnings("unchecked")
		List<Long> list = (List<Long>) this.getHibernateTemplate().find(hql, 4);
        if (list.size() > 0) {
            return list.get(0).intValue();
        }
        return 0;
    }

    @Override
    public List<News> findNewsOfMili(int begin, int pageCount) {
        DetachedCriteria criteria = DetachedCriteria.forClass(News.class);
        criteria.add(Restrictions.eq("newsTypePO.typeId", 4));
        criteria.addOrder(Order.desc("id"));
        List<News> list = (List<News>) this.getHibernateTemplate().findByCriteria(criteria, begin, pageCount);
        return list;
    }


	@Override
	public Vedio findVedioOfThis(int thisVedioId) {
		// TODO Auto-generated method stub
		return this.getHibernateTemplate().get(Vedio.class, thisVedioId);
	}
}
