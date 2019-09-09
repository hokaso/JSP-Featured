package ssm.service;

import java.util.List;
import java.util.Map;

import ssm.pojo.Mine.Dynamic;

public interface DynamicService {

	List<Map<String,Object>> findCommuityDynamic(String type, String category);

	
	
}
