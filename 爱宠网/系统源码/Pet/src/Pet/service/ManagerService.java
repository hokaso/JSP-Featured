package Pet.service;
import java.util.List;

import Pet.entity.Danmu;
import Pet.entity.Manager;
import Pet.entity.Member;
import Pet.entity.News;
import Pet.entity.Vedio;
import Pet.entity.Vedio1;
import Pet.tool.Page;

public interface ManagerService {
	
		public void ManageMember(Member member);
		
		public Manager findManagerByIdAndPassword(Manager manager);
		
		public List<News> find(String hql,int page2);
		
		public List<Vedio> find1(String hql,int page2);
		
		public List<Vedio> find1(String hql);
		
		public Page queryForPage(int pageSize, int currentPage);//News

		public Page queryForPage1(int pageSize, int currentPage,String T);//News search
		
		public boolean updatePassword(Manager manager,String oldPassword);
		
		public List<Danmu> findDanmus(int id);
		
		public void addDanmu(Danmu danmu);
		
		public Page queryForPage4(int pageSize, int currentPage);//Vedio1
		
		public Page queryForPage5(int pageSize, int currentPage,String T);//Vedio1 search
		
		public Page queryForPage2(int pageSize, int currentPage);//Vedio
		
		public Page queryForPage3(int pageSize, int currentPage,String T);//Vedio search
		
	}
