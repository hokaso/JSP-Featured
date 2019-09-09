package Service;

import java.util.List;

import Pojo.college;
import Pojo.course;

public interface collegeService {

    public college college_find_by_id(String college_id);//根据大学生id找大学生信息
	
	public void college_register(college college);//注册大学生信息
	
	public List<course> college_find_course(String college_id);//查询该大学生的所有课程状态
	
	public void college_update_information(college college);
	
	public String college_find_password(String college_id);
	
	public void college_update_password(String college_id,String college_password);
	
	public int college_register_check(String college_id);//查询大学生的id是否被注册了
	
	public void college_photo_update(String college_id,String college_photo);
	
}
