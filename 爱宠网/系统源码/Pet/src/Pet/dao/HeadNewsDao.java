package Pet.dao;

import Pet.entity.HeadNews;

import java.util.List;

/**
 * Created by GUOFENG on 2017/4/19.
 */
public interface HeadNewsDao {



    void deleteHeadNews(HeadNews headNews);

    List<HeadNews> findHeadNews();

    void addHeadNews(HeadNews headNews);

    void updateHeadNews(HeadNews headNews);

    HeadNews existHeadNews(HeadNews headNews);
}
