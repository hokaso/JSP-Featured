package Pet.dao.impl;

import Pet.dao.VedioDao;
import Pet.entity.Vedio;
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

@Repository
@SuppressWarnings("all")
public class VedioDaoImpl extends HibernateDaoSupport implements VedioDao {
	@Autowired
	public void setSessionFactory0(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}
    @Override
    public void addVedio(Vedio vedio) {
    	System.out.println(" ”∆µÃÌº”«∞");
        this.getHibernateTemplate().save(vedio);
    }

    @Override
    public void deleteVedio(Vedio vedio) {
    	
        Vedio thisVedio = this.getHibernateTemplate().get(Vedio.class, vedio.getId());
        
        if (thisVedio.getAddress() != null) {
            MyFileUtils.deleteFile(Constant.systemPath + "\\" + thisVedio.getAddress());
        }
        this.getHibernateTemplate().delete(thisVedio);
    }

    @Override
    public int findCountVedioByCondition(int typeId, String vedioKey) {
        List<Long> list = null;
        String hql;
        if (typeId == 0 && !vedioKey.equals("")) {
            hql = "SELECT COUNT(*) FROM Vedio WHERE vedioKey LIKE ?";
            list = (List<Long>) this.getHibernateTemplate().find(hql, "%" + vedioKey + "%");
        } else if (typeId != 0 && vedioKey.equals("")) {
            hql = "SELECT COUNT(*) FROM Vedio WHERE vedioTypePO.typeId=?";
            list = (List<Long>) this.getHibernateTemplate().find(hql, typeId);
        } else if (typeId != 0 && !vedioKey.equals("")) {
            hql = "SELECT COUNT(*) FROM Vedio WHERE vedioTypePO.typeId=? AND vedioKey LIKE ?";
            list = (List<Long>) this.getHibernateTemplate().find(hql, typeId, "%" + vedioKey + "%");
        } else {
            hql = "SELECT COUNT(*) FROM Vedio";
            list = (List<Long>) this.getHibernateTemplate().find(hql);
        }
        if (list != null && list.size() > 0) {
            return list.get(0).intValue();
        }
        return 0;
    }

    @Override
    public List<Vedio> findVedioByCondition(int begin, int pageCount, int typeId, String vedioKey) {
        DetachedCriteria criteria = DetachedCriteria.forClass(Vedio.class);
        if (typeId != 0) {
            criteria.add(Restrictions.eq("vedioTypePO.typeId", typeId));
        }
        if (!vedioKey.equals("")) {
            criteria.add(Restrictions.like("vedioKey", "%" + vedioKey + "%"));
        }
        criteria.addOrder(Order.desc("id"));
        List<Vedio> list = (List<Vedio>) this.getHibernateTemplate().findByCriteria(criteria, begin, pageCount);
        return list;
    }

    @Override
    public void deleteMoreVedio(String[] checkVedioIDs) {
        for (String vedioID : checkVedioIDs) {
            Vedio thisVedio = this.getHibernateTemplate().get(Vedio.class, Integer.parseInt(vedioID.trim()));
            if (thisVedio.getAddress() != null) {
                MyFileUtils.deleteFile(Constant.systemPath + "\\" + thisVedio.getAddress());
            }
            this.getHibernateTemplate().delete(thisVedio);
        }
    }
	@Override
	public Vedio find(int vedio_id) {
        List<Vedio> list=(List<Vedio>) this.getHibernateTemplate().find("from Vedio u where u.id=?",vedio_id);
        return list.get(0);
	}
}
