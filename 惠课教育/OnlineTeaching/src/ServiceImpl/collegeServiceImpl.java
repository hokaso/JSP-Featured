package ServiceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import Mapper.collegeMapper;
import Pojo.college;
import Pojo.course;
import Service.collegeService;

@Component
public class collegeServiceImpl implements collegeService {

	@Resource
	private collegeMapper collegeMapper;

	public college college_find_by_id(String college_id) {
		college college=collegeMapper.college_find_by_id(college_id);
		
		return college;
	}


	public void college_register(college college) {
		
		collegeMapper.college_register(college);
		
		
	}


	@Override
	public List<course> college_find_course(String college_id) {
		List<course> list=collegeMapper.college_find_course(college_id);
		return list;
	}


	@Override
	public void college_update_information(college college) {
          collegeMapper.college_update_information(college);
	}


	@Override
	public String college_find_password(String college_id) {
		String college_password=collegeMapper.college_find_password(college_id);
		return college_password;
	}


	@Override
	public void college_update_password(String college_id, String college_password) {
		collegeMapper.college_update_password(college_id, college_password);
		
	}




	@Override
	public int college_register_check(String college_id) {
		int count=collegeMapper.college_register_check(college_id);
		
		return count;
	}


	@Override
	public void college_photo_update(String college_id, String college_photo) {
		collegeMapper.college_photo_update(college_id, college_photo);
		
	}

	

}
