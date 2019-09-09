package Pet.dao.impl;

import Pet.dao.ResourceDao;
import Pet.entity.Resource;
import Pet.utils.Constant;
import Pet.utils.MyFileUtils;

import org.hibernate.SQLQuery;
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
public class ResourceDaoImpl extends HibernateDaoSupport implements ResourceDao {
	@Autowired
	public void setSessionFactory0(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}
    @Override
    public void addResource(Resource resource) {
        this.getHibernateTemplate().save(resource);
    }

    @Override
    public void deleteResource(Resource resource) {
    	
        Resource thisResource = this.getHibernateTemplate().get(Resource.class, resource.getId());
        
        if (thisResource.getDownloadUrl() != null) {
            MyFileUtils.deleteFile(Constant.systemPath + "\\" + thisResource.getDownloadUrl());
        }
        this.getHibernateTemplate().delete(thisResource);
    }

    @Override
    public int findCountResourceByCondition(int id) {
        List<Long> list = null;
        String hql;
        String sql;
        System.out.println(id+"$$$");
        if (id!=0) {
            hql = "SELECT COUNT(*) FROM Resource a WHERE a.member.id = ?";
        	//sql = "select count(*) from resource where member_id ="+id;
           list = (List<Long>) this.getHibernateTemplate().find(hql,id);
           
        	//SQLQuery c=this.getHibernateTemplate().getSessionFactory().openSession().createSQLQuery(sql); 
        	//return Integer.parseInt(c.uniqueResult().toString());
//        } else if (resourceKey.equals("")) {
//        	hql = "SELECT COUNT(*) FROM Resource";
//            list = (List<Long>) this.getHibernateTemplate().find(hql);
        }
        if (list != null && list.size() > 0) {
        	System.out.println(list.get(0).intValue());
            return list.get(0).intValue();
        }
        return 0;
    }

    @Override
    public List<Resource> findResourceByCondition(int begin, int pageCount,int id) {
        DetachedCriteria criteria = DetachedCriteria.forClass(Resource.class);
        if (id!=0) {
            criteria.add(Restrictions.like("member.id",id));
        }
        criteria.addOrder(Order.desc("id"));
        List<Resource> list = (List<Resource>) this.getHibernateTemplate().findByCriteria(criteria, begin, pageCount);
        return list;
    }

    @Override
    public void deleteMoreResource(String[] checkResourceIDs) {
        for (String resourceID : checkResourceIDs) {
            Resource thisResource = this.getHibernateTemplate().get(Resource.class, Integer.parseInt(resourceID.trim()));
            if (thisResource.getDownloadUrl() != null) {
                MyFileUtils.deleteFile(Constant.systemPath + "\\" + thisResource.getDownloadUrl());
            }
            this.getHibernateTemplate().delete(thisResource);
        }
    }
	@Override
	public int findCountResourceByCondition1(String newNesourceKey) {
		List<Long> list = null;
        String hql;
        
       
        if (newNesourceKey!=null) {
            hql = "SELECT COUNT(*) FROM Resource a WHERE a.introduce = ?";
        	//sql = "select count(*) from resource where member_id ="+id;
           list = (List<Long>) this.getHibernateTemplate().find(hql,newNesourceKey);
           
        	//SQLQuery c=this.getHibernateTemplate().getSessionFactory().openSession().createSQLQuery(sql); 
        	//return Integer.parseInt(c.uniqueResult().toString());
//        } else if (resourceKey.equals("")) {
//        	hql = "SELECT COUNT(*) FROM Resource";
//            list = (List<Long>) this.getHibernateTemplate().find(hql);
        }
        if (list != null && list.size() > 0) {
            return list.get(0).intValue();
        }
        return 0;
	}
	@Override
	public List<Resource> findResourceByCondition1(int begin, int pageCount, String newNesourceKey) {
		DetachedCriteria criteria = DetachedCriteria.forClass(Resource.class);
        if (newNesourceKey!=null) {
            criteria.add(Restrictions.like("introduce",newNesourceKey));
        }
        criteria.addOrder(Order.desc("id"));
        List<Resource> list = (List<Resource>) this.getHibernateTemplate().findByCriteria(criteria, begin, pageCount);
        return list;
	}
}
