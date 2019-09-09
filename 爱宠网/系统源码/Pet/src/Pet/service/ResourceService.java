package Pet.service;
import Pet.entity.PageBean;
import Pet.entity.Resource;


public interface ResourceService {
    void addResource(Resource newNesource);

    void deleteResource(Resource newNesource);

    PageBean<Resource> findResourceByCondition(int currentPage, int newNesourceKey);
    
    PageBean<Resource> findResourceByCondition1(int currentPage, String newNesourceKey);

    void deleteMoreResource(String[] checkResourceIDs);

}
