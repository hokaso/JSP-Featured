package Pet.dao;

import Pet.entity.HeadNews;
import Pet.entity.News;
import Pet.entity.Vedio;

import java.util.List;

/**
 * Created by GUOFENG on 2017/5/5.
 */
public interface IndexDao {
    List<HeadNews> findNewsOfHead();

    int findCountNewsOfHot();

    List<News> findNewsOfHot(int begin, int pageCount);

    int findCountNewsOfSociety();

    List<News> findNewsOfSociety(int begin, int pageCount);

    int findCountNewsOfTech();

    List<News> findNewsOfTech(int begin, int pageCount);

    int findCountNewsOfInte();

    List<News> findNewsOfInte(int begin, int pageCount);

    int findCountNewsOfMili();

    List<News> findNewsOfMili(int begin, int pageCount);


    News findNewsOfThis(int thisNewsId);

	Vedio findVedioOfThis(int thisVedioId);

}
