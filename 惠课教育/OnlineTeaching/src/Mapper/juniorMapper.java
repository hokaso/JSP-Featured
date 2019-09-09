package Mapper;

import Pojo.junior;

public interface juniorMapper {

	public junior junior_find_by_id(String junior_id);
	public void junior_register(junior junior);
	public void junior_update_score(String teach_id,int college_score);
	public void junior_update_information(junior junior);
	
    public String junior_find_password(String junior_id);//根据id找密码
	
	public void junior_update_password(String junior_id,String junior_password);//修改密码
	
	public int  junior_register_check(String junior_id);
}
