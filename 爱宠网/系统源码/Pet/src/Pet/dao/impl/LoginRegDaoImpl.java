package Pet.dao.impl;


import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import Pet.dao.LoginRegDao;
import Pet.entity.Member;

/**
 * Created by GUOFENG on 2017/5/7.
 */
@Repository
@SuppressWarnings("all")
public class LoginRegDaoImpl extends HibernateDaoSupport implements LoginRegDao {
	@Autowired
	public void setSessionFactory0(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}
	
	@Override
    public boolean register(Member user) {
        if (this.getHibernateTemplate().get(user.getClass(), user.getId()) != null) {
            return false;
        }
        user.setState(0);
        this.getHibernateTemplate().save(user);
        return true;
    }

    @Override
    public Member login(Member user) {
    	//System.out.println("5454545454");
        String hql = "FROM Member WHERE id=? AND pwd=?";
        //System.out.println(user.getId()+"**"+user.getPassword());
        
        @SuppressWarnings("unchecked")
		List<Member> userPOList = (List<Member>) this.getHibernateTemplate().find(hql, user.getId(), user.getPwd());
        //System.out.println(userPOList.size());
        if (userPOList.size() > 0) {
            return userPOList.get(0);
        }
        return null;
    }
}
