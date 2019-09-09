package Pet.dao;

import Pet.entity.News;

import java.util.List;

/**
 * Created by GUOFENG on 2017/4/16.
 */
public interface NewsDao {
    void addNews(News news);

    void deleteNews(News news);

    int findCountNewsByCondition(int typeId, String newsKey);

    List<News> findNewsByCondition(int begin, int pageCount, int typeId, String newsKey);

    void deleteMoreNews(String[] checkNewsIDs);

}
