package Mapper;


import java.util.List;

import Pojo.course;

public interface courseMapper {

	public void course_add(course course);
	public List<course> course_show_all();
	public course course_find_by_id(int course_id);
	public void course_buy(int course_id);//购买时把状态设置为0
	
	public List<course> course_find_by_name(String course_name);

	public int course_find_sales(String college_id);//查找大学生的销量
	
	public void course_update_information(course course);//更新课程信息

	public List<course> course_find_by_type(String course_type);
}
