package Mapper;

import Pojo.college;

public interface otherMapper {

	public college college_login(String college_id,String college_password);
	public int junior_login(String junior_id,String junior_password);
	

}
