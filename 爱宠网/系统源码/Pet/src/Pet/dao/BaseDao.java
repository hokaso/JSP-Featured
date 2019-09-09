package Pet.dao;

import java.io.Serializable;
import java.util.List;

import Pet.entity.Member;
import Pet.entity.Vedio1;

/**
 * 基础数据库操作类
 * 
 * @author www.java1234.com
 * 
 */
public interface BaseDao<T> {

	/**
	 * 保存一个对象
	 * 
	 * @param o
	 * @return
	 */
	public Serializable save(T o);

	/**
	 * 删除一个对象
	 * 
	 * @param o
	 */
	public void delete(T o);

	/**
	 * 更新一个对象
	 * 
	 * @param o
	 */
	public void update(T o);

	/**
	 * 保存或更新对象
	 * 
	 * @param o
	 */
	public void saveOrUpdate(T o);

	/**
	 * 查询
	 * 
	 * @param hql
	 * @return
	 */
	public List<T> find(String hql);

	/**
	 * 查询集合
	 * 
	 * @param hql
	 * @param param
	 * @return
	 */
	public List<T> find(String hql, Object[] param);

	/**
	 * 查询集合
	 * 
	 * @param hql
	 * @param param
	 * @return
	 */
	public List<T> find(String hql, List<Object> param);

	/**
	 * 查询集合(带分页)
	 * 
	 * @param hql
	 * @param param
	 * @param page
	 *            查询第几页
	 * @param rows
	 *            每页显示几条记录
	 * @return
	 */
	public List<T> find(String hql, Object[] param, Integer page, Integer rows);

	/**
	 * 查询集合(带分页)
	 * 
	 * @param hql
	 * @param param
	 * @param page
	 * @param rows
	 * @return
	 */
	public List<T> find(String hql, List<Object> param, Integer page, Integer rows);

	/**
	 * 获得一个对象
	 * 
	 * @param c
	 *            对象类型
	 * @param id
	 * @return Object
	 */
	public T get(Class<T> c, Serializable id);

	/**
	 * 获得一个对象
	 * 
	 * @param hql
	 * @param param
	 * @return Object
	 */
	public T get(String hql, Object[] param);

	/**
	 * 获得一个对象
	 * 
	 * @param hql
	 * @param param
	 * @return
	 */
	public T get(String hql, List<Object> param);

	/**
	 * select count(*) from 类
	 * 
	 * @param hql
	 * @return
	 */
	public Long count(String hql);

	/**
	 * select count(*) from 类
	 * 
	 * @param hql
	 * @param param
	 * @return
	 */
	public Long count(String hql, Object[] param);

	/**
	 * select count(*) from 类
	 * 
	 * @param hql
	 * @param param
	 * @return
	 */
	public Long count(String hql, List<Object> param);

	/**
	 * 执行HQL语句
	 * 
	 * @param hql
	 * @return 响应数目
	 */
	public Integer executeHql(String hql);

	/**
	 * 执行HQL语句
	 * 
	 * @param hql
	 * @param param
	 * @return 响应数目
	 */
	public Integer executeHql(String hql, Object[] param);

	/**
	 * 执行HQL语句
	 * 
	 * @param hql
	 * @param param
	 * @return
	 */
	public Integer executeHql(String hql, List<Object> param);
	/**
	 * 插入到数据库中
	 */
	public void Insert(Member member);
    
	/**
	 * 查询
	 * 
	 * @param hql
	 * @return
	 */
	 public List<T> queryForPage(String hql,int offset,int length);
	  /**
	   *    
	   * @param hql
	   * @return
	   */
	     //总记录条数
	public int getCount(String hql);
	
	
	 public boolean checkOldPassword(String hql,Object[] param);

	 public T updatePassword(String hql,Object[] param);
	 
	void addVedio1(T vedio1);
	
	public List<T> find(String hql,Integer page, Integer rows);
}
