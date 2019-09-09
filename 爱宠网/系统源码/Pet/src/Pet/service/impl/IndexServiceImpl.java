package Pet.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import Pet.dao.IndexDao;
import Pet.entity.HeadNews;
import Pet.entity.News;
import Pet.entity.Vedio;
import Pet.service.IndexService;

/**
 * Created by GUOFENG on 2017/5/5.
 */
@Service
public class IndexServiceImpl implements IndexService {
	@Resource
    private IndexDao indexDao;

    public void setIndexDao(IndexDao indexDao) {
        this.indexDao = indexDao;
    }

    @Override
    public News findNewsOfThis(int thisNewsId) {
        return indexDao.findNewsOfThis(thisNewsId);
    }


    @Override
    public List<HeadNews> findNewsOfHead() {
        List<HeadNews> list = indexDao.findNewsOfHead();
        return list;
    }

    @Override
    public int PageSizeOfHot(int pageCount) {
        
        int totalSize = indexDao.findCountNewsOfHot();
       
        double ts = totalSize;
        Double num = Math.ceil(ts / pageCount);
        return num.intValue();
    }

    @Override
    public List<News> findNewsOfHot(int hotCurrentPage, int pageCount) {
        int begin = (hotCurrentPage - 1) * pageCount;
        List<News> list = indexDao.findNewsOfHot(begin, pageCount);
        return list;
    }

    @Override
    public int PageSizeOfSociety(int pageCount) {
       
        int totalSize = indexDao.findCountNewsOfSociety();
       
        double ts = totalSize;
        Double num = Math.ceil(ts / pageCount);
        return num.intValue();
    }

    @Override
    public List<News> findNewsOfSociety(int societyCurrentPage, int pageCount) {
        int begin = (societyCurrentPage - 1) * pageCount;
        List<News> list = indexDao.findNewsOfSociety(begin, pageCount);
        return list;
    }


    @Override
    public int PageSizeOfTech(int pageCount) {
        int totalSize = indexDao.findCountNewsOfTech();
        double ts = totalSize;
        Double num = Math.ceil(ts / pageCount);
        return num.intValue();
    }

    @Override
    public List<News> findNewsOfTech(int techCurrentPage, int pageCount) {
        int begin = (techCurrentPage - 1) * pageCount;
        List<News> list = indexDao.findNewsOfTech(begin, pageCount);
        return list;
    }

    @Override
    public int PageSizeOfInte(int pageCount) {
        int totalSize = indexDao.findCountNewsOfInte();
        double ts = totalSize;
        Double num = Math.ceil(ts / pageCount);
        return num.intValue();
    }

    @Override
    public List<News> findNewsOfInte(int inteCurrentPage, int pageCount) {
        int begin = (inteCurrentPage - 1) * pageCount;
        List<News> list = indexDao.findNewsOfInte(begin, pageCount);
        return list;
    }

    @Override
    public int PageSizeOfMili(int pageCount) {
        int totalSize = indexDao.findCountNewsOfMili();
        double ts = totalSize;
        Double num = Math.ceil(ts / pageCount);
        return num.intValue();
    }

    @Override
    public List<News> findNewsOfMili(int miliCurrentPage, int pageCount) {
        int begin = (miliCurrentPage - 1) * pageCount;
        List<News> list = indexDao.findNewsOfMili(begin, pageCount);
        return list;
    }

	@Override
	public Vedio findVedioOfThis(int thisVedioId) {
		// TODO Auto-generated method stub
		return indexDao.findVedioOfThis(thisVedioId);
	}
}
