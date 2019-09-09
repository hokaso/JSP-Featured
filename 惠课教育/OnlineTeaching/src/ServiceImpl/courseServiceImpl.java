package ServiceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import Mapper.courseMapper;
import Pojo.course;
import Service.courseService;

@Component
public class courseServiceImpl implements courseService {

	@Resource
	private courseMapper courseMapper;
	
//	上传课程
	public void course_add(course course) {

		courseMapper.course_add(course);
	}

	@Override
	public List<course> course_show_all() {
		List<course> list=courseMapper.course_show_all();
		return list;
	}

	@Override
	public course course_find_by_id(int course_id) {
		course course=courseMapper.course_find_by_id(course_id);
		return course;
	}

	@Override
	public void course_buy(int course_id) {
		
		courseMapper.course_buy(course_id);
	}

	@Override
	public List<course> course_find_by_name(String course_name) {
		List<course> list=courseMapper.course_find_by_name(course_name);
		return list;
	}

	@Override
	public int course_find_sales(String college_id) {
		int sales=courseMapper.course_find_sales(college_id);
		return sales;
	}

	@Override
	public void course_update_information(course course) {
		courseMapper.course_update_information(course);
		
	}

	@Override
	public List<course> course_find_by_type(String course_type) {
		List<course> list=courseMapper.course_find_by_type(course_type);
		return list;
	}
	
	



}
