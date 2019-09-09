package Pet.service;



import Pet.entity.HeadNews;
import Pet.entity.PageBean;


public interface HeadNewsService {


    void deleteHeadNews(HeadNews headNews);

    PageBean<HeadNews> findHeadNews();

    HeadNews existHeadNews(HeadNews headNews);

    void addHeadNews(HeadNews headNews);

    void updateHeadNews(HeadNews headNews);
}
