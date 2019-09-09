package ServiceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import Mapper.teachMapper;
import Pojo.teach;
import Service.teachService;

@Component
public class teachServiceImpl implements teachService {

	@Resource
	private teachMapper teachMapper;

	public void teach_add_order(teach teach) {
		teachMapper.teach_add_order(teach);
	
	}

	public teach teach_find_by_id(String teach_id) {
		teach teach=teachMapper.teach_find_by_id(teach_id);
		return teach;
	}

	public teach teach_find_by_course_id(int course_id) {
		teach teach=teachMapper.teach_find_by_course_id(course_id);
		
		return teach;
	}

	public void teach_teach(String teach_id) {
		teachMapper.teach_teach(teach_id);
		
	}

	public List<teach> teach_find_by_junior_id(String junior_id) {
		List<teach> list=teachMapper.teach_find_by_junior_id(junior_id);
		
		return list;
	}

	@Override
	public List<teach> teach_find_by_college_id(String college_id) {
		List<teach> list=teachMapper.teach_find_by_college_id(college_id);
		return list;
	}

	@Override
	public int teach_average_score(String college_id) {
		int score;
		try {
		score=teachMapper.teach_average_score(college_id);}catch (Exception e) {
		 score=0;
		}
		return score;
	}

}
