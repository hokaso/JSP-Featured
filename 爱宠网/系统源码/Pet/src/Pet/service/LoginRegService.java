package Pet.service;

import Pet.entity.Member;

/**
 * Created by GUOFENG on 2017/5/7.
 */
public interface LoginRegService  {
    boolean register(Member member);

    public Member login(Member member);
}
