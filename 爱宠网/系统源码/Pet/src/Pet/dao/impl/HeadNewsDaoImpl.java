package Pet.dao.impl;

import Pet.dao.HeadNewsDao;
import Pet.entity.HeadNews;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by GUOFENG on 2017/4/19.
 */
@Repository
@SuppressWarnings("all")
public class HeadNewsDaoImpl extends HibernateDaoSupport implements HeadNewsDao {
	@Autowired
	public void setSessionFactory0(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}

	@Override
    public HeadNews existHeadNews(HeadNews headNews) {
        return this.getHibernateTemplate().get(HeadNews.class, headNews.getHeadId());
    }

    @Override
    public void addHeadNews(HeadNews headNews) {
        this.getHibernateTemplate().save(headNews);
    }

    @Override
    public void updateHeadNews(HeadNews headNews) {
        this.getHibernateTemplate().update(headNews);
    }

    @Override
    public void deleteHeadNews(HeadNews headNews) {
        this.getHibernateTemplate().delete(headNews);
    }


    @Override
    public List<HeadNews> findHeadNews() {
        String hql = "FROM HeadNews";
        ArrayList<HeadNews> headNewsList = (ArrayList<HeadNews>) this.getHibernateTemplate().find(hql);
        if (headNewsList.size() > 0) {
            return headNewsList;
        }
        return null;
    }

}
