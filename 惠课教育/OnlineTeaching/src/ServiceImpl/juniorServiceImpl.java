package ServiceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import Mapper.juniorMapper;
import Pojo.junior;
import Service.juniorService;

@Component
public class juniorServiceImpl implements juniorService {

	@Resource
	private juniorMapper juniorMapper;
	

	public junior junior_find_by_id(String junior_id) {
		junior junior=juniorMapper.junior_find_by_id(junior_id);
		return junior;
	}

	
	public void junior_register(junior junior) {
		juniorMapper.junior_register(junior);
	}


	@Override
	public void junior_update_score(String teach_id,int college_score) {
		juniorMapper.junior_update_score(teach_id,college_score);
		
	}


	@Override
	public void junior_update_information(junior junior) {
		juniorMapper.junior_update_information(junior);
		
	}



	public String junior_find_password(String junior_id) {
	String junior_password=juniorMapper.junior_find_password(junior_id);
		return junior_password;
	}


	@Override
	public void junior_update_password(String junior_id, String junior_password) {
             juniorMapper.junior_update_password(junior_id, junior_password);		
	}


	@Override
	public int junior_register_check(String junior_id) {
       int count=juniorMapper.junior_register_check(junior_id);
       
		return count;
	}


	

}
