package ssm.service.mallService.impl;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ssm.mapper.mallMapper.GoodsMapper;
import ssm.pojo.Goods.GoodsEntity;
import ssm.pojo.Goods.GoodsIntroduceImage;
import ssm.pojo.Goods.GoodsSpecs;
import ssm.pojo.Goods.MallCollection;
import ssm.service.mallService.GoodsService;

@Service
public class GoodsServiceImpl implements GoodsService {
	
	@Autowired
	private GoodsMapper goodsMapper;
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<GoodsEntity> findGoodsByCategory(Integer category) {
		return goodsMapper.findGoodsByCategory(category);
	}

	@Override
	public List<GoodsIntroduceImage> getTroduceImage(String goods_id) {
		List<GoodsIntroduceImage>  list = goodsMapper.getTroduceImage(goods_id);
		return list;
	}
	
	/**
	 * 获取商品的规格
	 * @param goods_id
	 * @return
	 */
	public GoodsEntity getGodosSpecs(String goods_id) {
		return goodsMapper.getGodosSpecs(goods_id);
	}

	/**
	 * 根据id查找商品
	 * @param goods_id
	 * @return
	 */
	@Override
	public GoodsEntity findGoodsById(String goods_id) {
		// TODO Auto-generated method stub
		return goodsMapper.findGoodsById(goods_id);
	}

	/**
	 * 根据id查找相应的规格
	 * @param specs_id
	 * @return
	 */
	@Override
	public GoodsSpecs findSpecsById(String specs_id) {
		// TODO Auto-generated method stub
		return goodsMapper.findSpecsById(specs_id);
	}
	
	
	@Override
	public Map<String, GoodsSpecs> findSpecsList(List<String> specs_ids){
		GoodsMapper mapper = sqlSessionTemplate.getMapper(GoodsMapper.class);
		Map<String, GoodsSpecs> map = new HashMap<String, GoodsSpecs>();
		for (String specs_id : specs_ids) {
			map.put(specs_id, mapper.findSpecsById(specs_id));
		}
		return map;
	}

	/**
	 * 批量修改规格
	 * @param values
	 */
	@Override
	public void updateSpecsSet(Collection<GoodsSpecs> values) {
		// TODO Auto-generated method stub
		for (GoodsSpecs goodsSpecs : values) {
			goodsMapper.updateSpecsStock(goodsSpecs);
		}
	}
	
	/**
	 * 通过搜索框查找
	 * @param value
	 * @return
	 */
	@Override
	public List<GoodsEntity> findGoodsBySearchBar(String value) {
		// TODO Auto-generated method stub
		return goodsMapper.findGoodsBySearchBar(value);
	}
	
	/**
	 * 获取对应规格的库存数
	 * @param specs_id
	 * @return
	 */
	@Override
	public GoodsSpecs findsSpecsById(String specs_id) {
		// TODO Auto-generated method stub
		return goodsMapper.findsSpecsById(specs_id);
	}

	

	//----------------------------------这里开始是后台---------------------------------//
	
	@Override
	public List<GoodsEntity> findAllGoods() {
		
		return goodsMapper.findAllGoods();
	}

	@Override
	public void deleteGoods(String goods_id) {
		goodsMapper.deleteGoods(goods_id);
	}

	@Override
	public List<Map<String, Object>> findAllCategory() {
		
		return goodsMapper.findAllCategory();
	}

	@Override
	public void addGoods(GoodsEntity goods) {
		goodsMapper.addGoods(goods);
		List<GoodsSpecs> specsList = goods.getGoodsSpecs();
		for (GoodsSpecs goodsSpecs : specsList) {
			goodsMapper.saveGoodsSpecs(goodsSpecs);
		}
	}

	@Override
	public void updateGoods(GoodsEntity goods) {
		goodsMapper.updateGoods(goods);
		List<GoodsSpecs> specsList = goods.getGoodsSpecs();
		for (GoodsSpecs goodsSpecs : specsList) {
			goodsMapper.updateSpecs(goodsSpecs);
		}
	}

	
	
}
