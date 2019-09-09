package Pet.service.impl;

import org.springframework.stereotype.Service;

import Pet.dao.LoginRegDao;
import Pet.entity.Manager;
import Pet.entity.Member;
import Pet.service.LoginRegService;

/**
 * Created by GUOFENG on 2017/5/7.
 */
@Service
public class LoginRegServiceImpl implements LoginRegService {
    private LoginRegDao loginRegDao;

    public void setLoginRegDao(LoginRegDao loginRegDao) {
        this.loginRegDao = loginRegDao;
    }

    @Override
    public boolean register(Member member) {
        return loginRegDao.register(member);
    }

    @Override
    public Member login(Member member) {
        return loginRegDao.login(member);
    }
}
