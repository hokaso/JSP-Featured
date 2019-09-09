package ssm.service.mallService.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ssm.mapper.mallMapper.MallCollectionMapper;
import ssm.pojo.Goods.GoodsCommentImageEntity;
import ssm.pojo.Goods.MallCollection;
import ssm.service.mallService.MallCollectionService;

@Service
public class MallCollectionServiceImpl implements MallCollectionService {

	@Autowired
	private MallCollectionMapper collectionMapper;
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	/**
	 * 添加到收藏夹
	 * @param collection
	 */
	@Override
	public void addToGoodsCollection(MallCollection collection) {
		// TODO Auto-generated method stub
		collectionMapper.addToGoodsCollection(collection);
	}

	/**
	 * 根据用户
	 * @param collection
	 * @return
	 */
	@Override
	public MallCollection findCollectionByGoodsIdUid(MallCollection collection) {
		// TODO Auto-generated method stub
		return collectionMapper.findCollectionByGoodsIdUid(collection);
	}

	/**
	 * 根据用户查找收藏的商品
	 * @param u_id
	 * @return
	 */
	@Override
	public List<MallCollection> findCollectionByUid(String u_id) {
		return collectionMapper.findCollectionByUid(u_id);
	}

	/**
	 * 删除条目
	 * @param mall_collection_id
	 */
	@Override
	public void deleteCollection(List<String> ids) {
		MallCollectionMapper mapper = sqlSessionTemplate.getMapper(MallCollectionMapper.class);
		
		for (String string : ids) {
			mapper.deleteCollection(string);
		}
	}

}
