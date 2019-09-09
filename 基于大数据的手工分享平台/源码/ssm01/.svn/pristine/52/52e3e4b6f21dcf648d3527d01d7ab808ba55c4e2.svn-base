package ssm.mapper.mallMapper;

import java.util.List;

import ssm.pojo.Goods.MallCollection;

public interface MallCollectionMapper {

	/**
	 * 添加到收藏夹
	 * @param collection
	 */
	public void addToGoodsCollection(MallCollection collection);
	
	/**
	 * 
	 * @param collection
	 * @return
	 */
	public MallCollection findCollectionByGoodsIdUid(MallCollection collection);
	
	/**
	 * 根据用户查找收藏的商品
	 * @param u_id
	 * @return
	 */
	public List<MallCollection> findCollectionByUid(String u_id);
	
	/**
	 * 删除条目
	 * @param mall_collection_id
	 */
	public void deleteCollection(String mall_collection_id);
}
