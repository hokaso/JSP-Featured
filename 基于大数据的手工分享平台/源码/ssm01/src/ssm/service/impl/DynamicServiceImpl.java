package ssm.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ssm.mapper.mineMapper.DynamicMapper;
import ssm.pojo.Mine.Dynamic;
import ssm.service.DynamicService;

@Service
public class DynamicServiceImpl implements DynamicService {

	@Autowired
	DynamicMapper dynamicMapper;

	@Override
	public List<Map<String,Object>> findCommuityDynamic(String type, String category) {
		List<Map<String,Object>> list = null;
		//判断type的类型
		if(type.equals("latestpub")) {
			list = dynamicMapper.findLatestPubDynamic(category);
		}else if(type.equals("latestresp")) {
			list = dynamicMapper.findLatestRespDynamic(category);
		}else if(type.equals("host")){
			list = dynamicMapper.findHostDynamic(category);
		}
		return list;
	}
	
	
}
