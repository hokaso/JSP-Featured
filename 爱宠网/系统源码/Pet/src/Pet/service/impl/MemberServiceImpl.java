package Pet.service.impl;
import Pet.entity.Manager;
import Pet.entity.Member;
import Pet.entity.Vedio1;
import Pet.service.MemberService;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import Pet.dao.BaseDao;
import Pet.dao.impl.MailDao;

@Service("memberService")
public class MemberServiceImpl implements MemberService{
	@Resource
	private BaseDao<Member> baseDao;
	@Resource
	private BaseDao<Vedio1> baseDao1;
	private MailDao mailDao;
	@Override
	public Member seeVideo(Member member1) {
		// TODO Auto-generated method stub
		return null;
	}

	

	@Override
	public Member findMemberByNameAndPassword(Member member) {
		// TODO Auto-generated method stub
		return baseDao.get("from Member m where m.account=? and m.pwd=?", new Object[]{member.getAccount(),member.getPwd()});
	}

	@Override
	public void sendMail(String mail, String url) {
		// TODO Auto-generated method stub
		mailDao.handelMail(mail, url);
	}

	@Override
	public void Insert(Member member) {
		 
		 baseDao.Insert(member);
	}



	@Override
	public void update(Member member) {
		baseDao.update(member);
		
	}



	@Override
	public void addVedio1(Vedio1 vedio1) {
		// TODO Auto-generated method stub
		baseDao1.addVedio1(vedio1);
	}



	@Override
	public Member find(int member_id) {
		return baseDao.get("from Member m where m.id=?", new Object[]{member_id});
	}



	@Override
	public boolean updatePassword(Member member, String oldPassword) {
		boolean isOK =baseDao.checkOldPassword("from Member m where m.id=? and m.pwd=?", new Object[]{member.getId(),oldPassword});
        if (!isOK) {
            return false;
        }
        Member member1=baseDao.get("from Member m where m.id=?",new Object[]{member.getId()});
        member1.setPwd(member.getPwd());
        baseDao.update(member1);
        System.out.println("更新成功");
        return true;
	}


}
