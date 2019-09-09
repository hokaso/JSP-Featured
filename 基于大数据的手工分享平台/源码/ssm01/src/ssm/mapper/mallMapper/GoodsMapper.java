package ssm.mapper.mallMapper;

import java.util.List;
import java.util.Map;

import ssm.pojo.Goods.GoodsEntity;
import ssm.pojo.Goods.GoodsIntroduceImage;
import ssm.pojo.Goods.GoodsSpecs;
import ssm.pojo.Goods.MallCollection;

public interface GoodsMapper {
	
	/**
	 * 根据分类查找商品
	 * @param category
	 * @return
	 */
	public List<GoodsEntity> findGoodsByCategory(Integer category);
	
	/**
	 * 根据id加载图片
	 * @param goods_id
	 * @return
	 */
	public List<GoodsIntroduceImage> getTroduceImage(String goods_id);
	
	/**
	 * 获取商品的规格
	 * @param goods_id
	 * @return
	 */
	public GoodsEntity getGodosSpecs(String goods_id);
	
	/**
	 * 根据id查找商品
	 * @param goods_id
	 * @return
	 */
	public GoodsEntity findGoodsById(String goods_id);
	
	/**
	 * 根据id查找相应的规格
	 * @param specs_id
	 * @return
	 */
	public GoodsSpecs findSpecsById(String specs_id);
	
	/**
	 * 修改规格库存数量
	 * @param goodsSpecs
	 */
	public void updateSpecsStock(GoodsSpecs goodsSpecs);
	
	/**
	 * 通过搜索框查找
	 * @param value
	 * @return
	 */
	public List<GoodsEntity> findGoodsBySearchBar(String value);
	
	/**
	 * 获取对应规格的库存数
	 * @param specs_id
	 * @return
	 */
	public GoodsSpecs findsSpecsById(String specs_id);

	
	//这里开始是后台
	
	public List<GoodsEntity> findAllGoods();

	public void deleteGoods(String goods_id);

	public List<Map<String, Object>> findAllCategory();

	public void addGoods(GoodsEntity goods);

	public void saveGoodsSpecs(GoodsSpecs goodsSpecs);

	public void updateGoods(GoodsEntity goods);

	public void updateSpecs(GoodsSpecs goodsSpecs);
	
}
