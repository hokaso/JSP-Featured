package Pet.dao.impl;

import Pet.dao.NewsDao;
import Pet.entity.News;
import Pet.utils.Constant;
import Pet.utils.MyFileUtils;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by GUOFENG on 2017/4/16.
 */
@Repository
@SuppressWarnings("all")
public class NewsDaoImpl extends HibernateDaoSupport implements NewsDao {
	@Autowired
	public void setSessionFactory0(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}
    @Override
    public void addNews(News news) {
        this.getHibernateTemplate().save(news);
    }

    @Override
    public void deleteNews(News news) {
    	System.out.println("fdsfdfs");
        News thisNews = this.getHibernateTemplate().get(News.class, news.getNewsId());
        
        if (thisNews.getNewsImg() != null) {
            MyFileUtils.deleteFile(Constant.systemPath + "\\" + thisNews.getNewsImg());
        }
        this.getHibernateTemplate().delete(thisNews);
    }

    @Override
    public int findCountNewsByCondition(int typeId, String newsKey) {
        List<Long> list = null;
        String hql;
        if (typeId == 0 && !newsKey.equals("")) {
            hql = "SELECT COUNT(*) FROM News WHERE newsKey LIKE ?";
            list = (List<Long>) this.getHibernateTemplate().find(hql, "%" + newsKey + "%");
        } else if (typeId != 0 && newsKey.equals("")) {
            hql = "SELECT COUNT(*) FROM News WHERE newsTypePO.typeId=?";
            list = (List<Long>) this.getHibernateTemplate().find(hql, typeId);
        } else if (typeId != 0 && !newsKey.equals("")) {
            hql = "SELECT COUNT(*) FROM News WHERE newsTypePO.typeId=? AND newsKey LIKE ?";
            list = (List<Long>) this.getHibernateTemplate().find(hql, typeId, "%" + newsKey + "%");
        } else {
            hql = "SELECT COUNT(*) FROM News";
            list = (List<Long>) this.getHibernateTemplate().find(hql);
        }
        if (list != null && list.size() > 0) {
            return list.get(0).intValue();
        }
        return 0;
    }

    @Override
    public List<News> findNewsByCondition(int begin, int pageCount, int typeId, String newsKey) {
        DetachedCriteria criteria = DetachedCriteria.forClass(News.class);
        if (typeId != 0) {
            criteria.add(Restrictions.eq("newsTypePO.typeId", typeId));
        }
        if (!newsKey.equals("")) {
            criteria.add(Restrictions.like("newsKey", "%" + newsKey + "%"));
        }
        criteria.addOrder(Order.desc("id"));
        List<News> list = (List<News>) this.getHibernateTemplate().findByCriteria(criteria, begin, pageCount);
        return list;
    }

    @Override
    public void deleteMoreNews(String[] checkNewsIDs) {
        for (String newsID : checkNewsIDs) {
            News thisNews = this.getHibernateTemplate().get(News.class, Integer.parseInt(newsID.trim()));
            if (thisNews.getNewsImg() != null) {
                MyFileUtils.deleteFile(Constant.systemPath + "\\" + thisNews.getNewsImg());
            }
            this.getHibernateTemplate().delete(thisNews);
        }
    }
}
