package Pet.dao.impl;

import Pet.dao.SiteInfoDao;
import Pet.entity.SiteInfoPO;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by GUOFENG on 2017/4/17.
 */
@Repository
@SuppressWarnings("all")
public class SiteInfoDaoImpl extends HibernateDaoSupport implements SiteInfoDao {
	@Autowired
	public void setSessionFactory0(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}
	@Override
    public SiteInfoPO findInfo(int wsId) {
        String hql = "FROM SiteInfoPO WHERE wsId=?";
        List<SiteInfoPO> siteInfoPOS = (List<SiteInfoPO>) this.getHibernateTemplate().find(hql, wsId);
        if (siteInfoPOS.size() > 0) {
            return siteInfoPOS.get(0);
        }
        return null;
    }

    @Override
    public void saveOrUpdateInfo(SiteInfoPO siteInfoPO) {
        this.getHibernateTemplate().saveOrUpdate(siteInfoPO);
    }
}
