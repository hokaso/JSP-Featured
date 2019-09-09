package Pet.service.impl;
import Pet.dao.ResourceDao;
import Pet.entity.Resource;
import Pet.entity.PageBean;
import Pet.service.ResourceService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ResourceServiceImpl implements ResourceService{
	@Autowired
    private ResourceDao resourceDao;

    public void setResourceDao(ResourceDao resourceDao) {
        this.resourceDao = resourceDao;
    }

    @Override
    public void addResource(Resource resource) {
    	
        resourceDao.addResource(resource);
    }

    @Override
    public void deleteResource(Resource resource) {
        resourceDao.deleteResource(resource);
        
    }


    @Override
    public PageBean<Resource> findResourceByCondition(int currentPage, int resourceKey) {
        PageBean<Resource> pageBean = new PageBean<Resource>();
        
        pageBean.setCurrentPage(currentPage);
       
        int pageCount = 5;
        pageBean.setPageCount(pageCount);
        
        int totalSize = resourceDao.findCountResourceByCondition(resourceKey);
        System.out.println(totalSize+"**");
        pageBean.setTotalSize(totalSize);
        
        double ts = totalSize;
        Double num = Math.ceil(ts / pageCount);
        pageBean.setPageSize(num.intValue());
        
        int begin = (currentPage - 1) * pageCount;
        
        List<Resource> list = resourceDao.findResourceByCondition(begin, pageCount,resourceKey);
        pageBean.setList(list);
        return pageBean;
    }

    @Override
    public void deleteMoreResource(String[] checkResourceIDs) {
    	System.out.println(resourceDao);
        resourceDao.deleteMoreResource(checkResourceIDs);
    }

	@Override
	public PageBean<Resource> findResourceByCondition1(int currentPage, String newNesourceKey) {
		// TODO Auto-generated method stub
		 PageBean<Resource> pageBean = new PageBean<Resource>();
	        
	        pageBean.setCurrentPage(currentPage);
	       
	        int pageCount = 5;
	        pageBean.setPageCount(pageCount);
	        
	        int totalSize = resourceDao.findCountResourceByCondition1(newNesourceKey);
	        pageBean.setTotalSize(totalSize);
	        
	        double ts = totalSize;
	        Double num = Math.ceil(ts / pageCount);
	        pageBean.setPageSize(num.intValue());
	        
	        int begin = (currentPage - 1) * pageCount;
	        
	        List<Resource> list = resourceDao.findResourceByCondition1(begin, pageCount,newNesourceKey);
	        pageBean.setList(list);
	        return pageBean;
	}
}
