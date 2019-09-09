package Pet.dao;

import Pet.entity.Resource;

import java.util.List;

/**
 * Created by GUOFENG on 2017/4/16.
 */
public interface ResourceDao {
    void addResource(Resource newNesource);

    void deleteResource(Resource newNesource);

    int findCountResourceByCondition(int newNesourceKey);

    List<Resource> findResourceByCondition(int begin, int pageCount,int newNesourceKey);

    void deleteMoreResource(String[] checkResourceIDs);
    
    int findCountResourceByCondition1(String newNesourceKey);

    List<Resource> findResourceByCondition1(int begin, int pageCount,String newNesourceKey);

}
