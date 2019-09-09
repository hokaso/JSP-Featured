package Pet.dao.impl;

import Pet.dao.DownloadDao;
import Pet.entity.Vedio1;
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
public class DownloadDaoImpl extends HibernateDaoSupport implements DownloadDao {
	@Autowired
	public void setSessionFactory0(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}
    

    @Override
    public void deleteVedio1(Vedio1 newDownload) {
    	
        Vedio1 thisVedio1 = this.getHibernateTemplate().get(Vedio1.class, newDownload.getAddress());
        
        if (thisVedio1.getAddress() != null) {
            MyFileUtils.deleteFile(Constant.systemPath + "\\" + thisVedio1.getAddress());
        }
        this.getHibernateTemplate().delete(thisVedio1);
    }

    @Override
    public int findCountVedio1ByCondition(String newDownloadKey) {
    	
        List<Long> list = null;
        String hql;
        if (!newDownloadKey.equals("")) {
            hql = "SELECT COUNT(*) FROM Vedio1 WHERE vedioTitle LIKE ?";
            list = (List<Long>) this.getHibernateTemplate().find(hql, "%" + newDownloadKey + "%");
        } else if (newDownloadKey.equals("")) {
            list = null;
        } else {
            hql = "SELECT COUNT(*) FROM Vedio1";
            list = (List<Long>) this.getHibernateTemplate().find(hql);
        }
        if (list != null && list.size() > 0) {
            return list.get(0).intValue();
        }
        return 0;
    }

    @Override
    public List<Vedio1> findVedio1ByCondition(int begin, int pageCount,String newDownloadKey) {
        DetachedCriteria criteria = DetachedCriteria.forClass(Vedio1.class);
       
        if (!newDownloadKey.equals("")) {
            criteria.add(Restrictions.like("id", "%" + newDownloadKey + "%"));
        }
        criteria.addOrder(Order.desc("id"));
        List<Vedio1> list = (List<Vedio1>) this.getHibernateTemplate().findByCriteria(criteria, begin, pageCount);
        return list;
    }

    @Override
    public void deleteMoreVedio1(String[] checkVedio1IDs) {
        for (String newDownloadID : checkVedio1IDs) {
            Vedio1 thisVedio1 = this.getHibernateTemplate().get(Vedio1.class, Integer.parseInt(newDownloadID.trim()));
            if (thisVedio1.getAddress() != null) {
                MyFileUtils.deleteFile(Constant.systemPath + "\\" + thisVedio1.getAddress());
            }
            this.getHibernateTemplate().delete(thisVedio1);
        }
    }
}
