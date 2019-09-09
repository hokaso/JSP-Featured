package Pet.dao.impl;

import java.io.IOException;
import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import Pet.dao.BaseDao;
import Pet.entity.Manager;
import Pet.entity.Member;
import Pet.entity.News;
import Pet.entity.Vedio1;
import Pet.utils.MyFileUtils;
import Pet.entity.Manager;

@Repository
@SuppressWarnings("all")
public class BaseDaoImpl<T> implements BaseDao<T> {

	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	private Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}


	public Serializable save(T o) {
		return this.getCurrentSession().save(o);
	}

	public void delete(T o) {
		this.getCurrentSession().delete(o);
	}

	public void update(T o) {
		this.getCurrentSession().update(o);
	}

	public void saveOrUpdate(T o) {
		this.getCurrentSession().saveOrUpdate(o);
	}

	public List<T> find(String hql, Object[] param) {
		Query q = (Query) this.getCurrentSession().createQuery(hql);
		if (param != null && param.length > 0) {
			for (int i = 0; i < param.length; i++) {
				q.setParameter(i, param[i]);
			}
		}
		return q.list();
	}

	public List<T> find(String hql, List<Object> param) {
		Query q = (Query) this.getCurrentSession().createQuery(hql);
		if (param != null && param.size() > 0) {
			for (int i = 0; i < param.size(); i++) {
				q.setParameter(i, param.get(i));
			}
		}
		return q.list();
	}

	public List<T> find(String hql, Object[] param, Integer page, Integer rows) {
		if (page == null || page < 1) {
			page = 1;
		}
		if (rows == null || rows < 1) {
			rows = 10;
		}
		Query q = (Query) this.getCurrentSession().createQuery(hql);
		if (param != null && param.length > 0) {
			for (int i = 0; i < param.length; i++) {
				q.setParameter(i, param[i]);
			}
		}
		return q.setFirstResult((page - 1) * rows).setMaxResults(rows).list();
	}

	public List<T> find(String hql, List<Object> param, Integer page, Integer rows) {
		if (page == null || page < 1) {
			page = 1;
		}
		if (rows == null || rows < 1) {
			rows = 10;
		}
		Query q = (Query) this.getCurrentSession().createQuery(hql);
		if (param != null && param.size() > 0) {
			for (int i = 0; i < param.size(); i++) {
				q.setParameter(i, param.get(i));
			}
		}
		return q.setFirstResult((page - 1) * rows).setMaxResults(rows).list();
	}

	public T get(Class<T> c, Serializable id) {
		return (T) this.getCurrentSession().get(c, id);
	}

	public T get(String hql, Object[] param) {
		List<T> l = this.find(hql, param);
		if (l != null && l.size() > 0) {
			return l.get(0);
		} else {
			//System.out.println("dfsdfds");
			return null;
		}
	}

	public T get(String hql, List<Object> param) {
		List<T> l = this.find(hql, param);
		if (l != null && l.size() > 0) {
			return l.get(0);
		} else {
			return null;
		}
	}

	public Long count(String hql, Object[] param) {
		Query q = (Query) this.getCurrentSession().createQuery(hql);
		if (param != null && param.length > 0) {
			for (int i = 0; i < param.length; i++) {
				q.setParameter(i, param[i]);
			}
		}
		return (Long) q.uniqueResult();
	}

	public Long count(String hql, List<Object> param) {
		Query q = (Query) this.getCurrentSession().createQuery(hql);
		if (param != null && param.size() > 0) {
			for (int i = 0; i < param.size(); i++) {
				q.setParameter(i, param.get(i));
			}
		}
		return (Long) q.uniqueResult();
	}

	public Integer executeHql(String hql, Object[] param) {
		Query q = (Query) this.getCurrentSession().createQuery(hql);
		if (param != null && param.length > 0) {
			for (int i = 0; i < param.length; i++) {
				q.setParameter(i, param[i]);
			}
		}
		return q.executeUpdate();
	}

	public Integer executeHql(String hql, List<Object> param) {
		Query q = (Query) this.getCurrentSession().createQuery(hql);
		if (param != null && param.size() > 0) {
			for (int i = 0; i < param.size(); i++) {
				q.setParameter(i, param.get(i));
			}
		}
		return q.executeUpdate();
	}

	@Override
	public void Insert(Member member) {
		Member t = new Member();
		t.setAccount(member.getAccount());
		t.setEmail(member.getEmail());
		t.setPwd(member.getPwd());
		t.setState(0);
		this.getCurrentSession().save(t);
		// this.getCurrentSession().update(t);
	}

	@Override
	public List<T> queryForPage(String hql, int offset, int length) {
		Query q = (Query) this.getCurrentSession().createQuery(hql);
		q.setFirstResult(offset);
		q.setMaxResults(length);
		return q.list();
	}

	@Override
	public int getCount(String hql) {
		Query q = (Query) this.getCurrentSession().createQuery(hql);
		return Integer.parseInt(q.list().get(0).toString());
	}

	@Override
	public List<T> find(String hql) {
		return (List<T>) this.getCurrentSession().createQuery(hql);

	}

	@Override
	public Long count(String hql) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Integer executeHql(String hql) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public boolean checkOldPassword(String hql,Object[] param) {
		List<T> l = this.find(hql, param);
		if (l != null && l.size() > 0) {
			return true;
		} else {
		
			return false;
		}
    }
	@Override
    public T updatePassword(String hql,Object[] param) {
      
    	List<T> l = this.find(hql, param);
		if (l != null && l.size() > 0) {
			 return l.get(0);
		} else {
		return null;
		}
    }

	@Override
	public void addVedio1(T vedio1) {
		// TODO Auto-generated method stub
		save( vedio1);
	}

	@Override
	public List<T> find(String hql, Integer page, Integer rows) {
		
		if (page == null || page < 1) {
			page = 1;
		}
		if (rows == null || rows < 1) {
			rows = 5;
		}
		Query q = (Query) this.getCurrentSession().createQuery(hql);
		return q.setFirstResult((page - 1) * rows).setMaxResults(rows).list();
	}
}
