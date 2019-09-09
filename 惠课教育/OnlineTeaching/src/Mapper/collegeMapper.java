package Mapper;

import java.util.List;

import Pojo.college;
import Pojo.course;

public interface collegeMapper {

	public college college_find_by_id(String college_id);//根据大学生id找大学生信息
	
	public int college_register(college college);//注册大学生信息
	
	public List<course> college_find_course(String college_id);//查询该大学生的所有课程状态
	
	public void college_update_information(college college);
	
	public String college_find_password(String college_id);//根据id找密码
	
	public void college_update_password(String college_id,String college_password);//修改密码
	
	public int college_register_check(String college_id);//查询大学生的id是否被注册了
	
	public void college_photo_update(String college_id,String college_photo);//大学生重新上传照片
}
