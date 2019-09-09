package Mapper;

import java.util.List;

import Pojo.college;

public interface staffMapper {

 public List<college> check_college_statue();//查看所有状态为0的大学生（待通过）
 public void change_college_statue(String college_id,int statue);//修改大学生状态的方法
 //0为待审核，1为通过，2为不通过
 
}
