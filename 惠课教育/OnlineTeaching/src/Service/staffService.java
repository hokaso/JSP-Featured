package Service;

import java.util.List;

import Pojo.college;

public interface staffService {

  public List<college>	check_college_statue();
  public void update_college_statue(String college_id,int college_statue);
}
