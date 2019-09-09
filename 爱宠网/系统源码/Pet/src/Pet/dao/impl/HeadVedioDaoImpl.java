package Pet.dao.impl;

import Pet.dao.HeadVedioDao;
import Pet.entity.HeadVedio;

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
public class HeadVedioDaoImpl extends HibernateDaoSupport implements HeadVedioDao {
	@Autowired
	public void setSessionFactory0(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}

	@Override
    public HeadVedio existHeadVedio(HeadVedio headvedio) {
        return this.getHibernateTemplate().get(HeadVedio.class, headvedio.getHeadId());
    }

    @Override
    public void addHeadVedio(HeadVedio headvedio) {
        this.getHibernateTemplate().save(headvedio);
    }

    @Override
    public void updateHeadVedio(HeadVedio headvedio) {
        this.getHibernateTemplate().update(headvedio);
    }

    @Override
    public void deleteHeadVedio(HeadVedio headvedio) {
        this.getHibernateTemplate().delete(headvedio);
    }


    @Override
    public List<HeadVedio> findHeadVedio() {
        String hql = "FROM HeadVedio";
        ArrayList<HeadVedio> headVedioList = (ArrayList<HeadVedio>) this.getHibernateTemplate().find(hql);
        if (headVedioList.size() > 0) {
            return headVedioList;
        }
        return null;
    }

}
