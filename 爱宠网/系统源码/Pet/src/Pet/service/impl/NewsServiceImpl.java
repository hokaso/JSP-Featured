package Pet.service.impl;
import Pet.dao.NewsDao;
import Pet.entity.News;
import Pet.entity.PageBean;
import Pet.service.NewsService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class NewsServiceImpl implements NewsService{
	@Autowired
    private NewsDao newsDao;

    public void setNewsDao(NewsDao newsDao) {
        this.newsDao = newsDao;
    }

    @Override
    public void addNews(News news) {
    	
        newsDao.addNews(news);
    }

    @Override
    public void deleteNews(News news) {
    	System.out.println(news);
        newsDao.deleteNews(news);
        
    }


    @Override
    public PageBean<News> findNewsByCondition(int currentPage, int typeId, String newsKey) {
        PageBean<News> pageBean = new PageBean<News>();
        
        pageBean.setCurrentPage(currentPage);
       
        int pageCount = 5;
        pageBean.setPageCount(pageCount);
        
        int totalSize = newsDao.findCountNewsByCondition(typeId,newsKey);
        pageBean.setTotalSize(totalSize);
        
        double ts = totalSize;
        Double num = Math.ceil(ts / pageCount);
        pageBean.setPageSize(num.intValue());
        
        int begin = (currentPage - 1) * pageCount;
        
        List<News> list = newsDao.findNewsByCondition(begin, pageCount,typeId,newsKey);
        pageBean.setList(list);
        return pageBean;
    }

    @Override
    public void deleteMoreNews(String[] checkNewsIDs) {
    	System.out.println(newsDao);
        newsDao.deleteMoreNews(checkNewsIDs);
    }
}
