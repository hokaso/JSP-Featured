package ssm.service.mallService;

import java.util.List;

import ssm.pojo.Goods.GoodsCommentImageEntity;
import ssm.pojo.Goods.MallCollection;

public interface MallCollectionService {

	/**
	 * 添加到收藏夹
	 * @param collection
	 */
	public void addToGoodsCollection(MallCollection collection);
	
	/**
	 * 根据用户
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
	public void deleteCollection(List<String> ids);
}
