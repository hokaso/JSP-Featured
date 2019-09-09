package Pet.dao.impl;

import Pet.dao.CountInfoDao;
import Pet.utils.MyFileUtils;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import java.io.IOException;
import java.util.List;

/**
 * Created by GUOFENG on 2017/4/20.
 */
@Repository
@SuppressWarnings("all")
public class CountInfoDaoImpl extends HibernateDaoSupport implements CountInfoDao {

	@Autowired
	public void setSessionFactory0(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}
	
    @Override
    public int countUser() {
    	//System.out.println("11111223131");
        String hql = "SELECT COUNT(*) FROM Manager ";
        List<Long> list = (List<Long>) this.getHibernateTemplate().find(hql);
        //System.out.println("11111223131");
        if (list.size() > 0) {
            return list.get(0).intValue();
        }
        return 0;
    }

    @Override
    public int countNews() {
        String hql = "SELECT COUNT(*) FROM News";
        List<Long> list = (List<Long>) this.getHibernateTemplate().find(hql);
        if (list.size() > 0) {
            return list.get(0).intValue();
        }
        return 0;
    }

    @Override
    public int countComment() {
        String hql = "SELECT COUNT(*) FROM CommentPO";
        List<Long> list = (List<Long>) this.getHibernateTemplate().find(hql);
        if (list.size() > 0) {
            return list.get(0).intValue();
        }
        return 0;
    }

    @Override
    public int countLook() {
        try {
            return MyFileUtils.readTxtFile();
        } catch (IOException e) {
            return 0;
        }
    }
}
