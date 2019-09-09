package Service;

import java.util.List;

import Pojo.course;

public interface courseService {

	public void course_add(course course);

	public List<course> course_show_all();

	public course course_find_by_id(int course_id);

	public void course_buy(int course_id);

	public List<course> course_find_by_name(String course_name);
	
	public int course_find_sales(String college_id);
	
	public void course_update_information(course course);
	
	public List<course> course_find_by_type(String course_type);
}
