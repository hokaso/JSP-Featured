package ServiceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import Mapper.staffMapper;
import Pojo.college;
import Service.staffService;

@Component
public class staffServiceImpl implements staffService {

	@Resource
	private staffMapper staffMapper;
	
	public List<college> check_college_statue() {
      List<college> list=staffMapper.check_college_statue();
      return list;
	}

	
	public void update_college_statue(String college_id, int college_statue) {
		staffMapper.change_college_statue(college_id, college_statue);
		
	}

}
