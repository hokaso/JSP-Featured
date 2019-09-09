package Mapper;

import java.util.List;

import Pojo.teach;

public interface teachMapper {

	public void teach_add_order(teach teach);
	
	public teach teach_find_by_id(String teach_id);
	
	public teach teach_find_by_course_id(int course_id);
	
	public List<teach> teach_find_by_junior_id(String junior_id);
	
	public void teach_teach(String teach_id);
	
	public List<teach> teach_find_by_college_id(String college_id);
	
	public int teach_average_score(String college_id);
	
}
