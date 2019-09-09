package ssm.service;

import java.util.List;

import ssm.pojo.Mine.Dynamic;

public interface BigDataService {
	
	public List<Dynamic> ProductDownSuggestion();
	
	public List<Dynamic> ProductUpSuggestion();
}
