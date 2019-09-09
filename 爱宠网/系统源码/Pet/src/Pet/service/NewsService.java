package Pet.service;


import Pet.entity.News;
import Pet.entity.PageBean;


public interface NewsService {
    void addNews(News newsPO);

    void deleteNews(News newsPO);

    PageBean<News> findNewsByCondition(int currentPage, int typeId, String newsKey);

    void deleteMoreNews(String[] checkNewsIDs);

}
