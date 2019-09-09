package Pet.service;

import java.util.List;

import Pet.entity.HeadNews;
import Pet.entity.News;
import Pet.entity.Vedio;

/**
 * Created by GUOFENG on 2017/5/5.
 */
public interface IndexService {
    List<HeadNews> findNewsOfHead();

    int PageSizeOfSociety(int pageCount);

    List<News> findNewsOfSociety(int societyCurrentPage, int pageCount);

    int PageSizeOfTech(int pageCount);

    List<News> findNewsOfTech(int techCurrentPage, int pageCount);

    int PageSizeOfInte(int pageCount);

    List<News> findNewsOfInte(int inteCurrentPage, int pageCount);

    int PageSizeOfMili(int pageCount);

    List<News> findNewsOfMili(int miliCurrentPage, int pageCount);

    int PageSizeOfHot(int pageCount);

    List<News> findNewsOfHot(int hotCurrentPage, int pageCount);

    News findNewsOfThis(int thisNewsId);
    
    Vedio findVedioOfThis(int thisVedioId);
}
