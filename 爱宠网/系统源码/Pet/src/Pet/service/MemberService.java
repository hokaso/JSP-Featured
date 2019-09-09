package Pet.service;

import Pet.entity.Manager;
import Pet.entity.Member;
import Pet.entity.Vedio1;
public interface MemberService {
	
	 public Member seeVideo(Member member);
	 
	
	 
	 public Member findMemberByNameAndPassword(Member member);
	 
	 public void sendMail(String mail,String url);
		
	 public void Insert(Member member);
	 
	 public void update(Member member);
	 
	 void addVedio1(Vedio1 vedio1);
	   
	 public Member find(int member_id);
	 
	 public boolean updatePassword(Member member,String oldPassword);
	 
	
}
