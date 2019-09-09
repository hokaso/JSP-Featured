package Pet.service.impl;
import Pet.dao.HeadNewsDao;
import Pet.entity.HeadNews;
import Pet.entity.PageBean;
import Pet.service.HeadNewsService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;


/**
 * Created by GUOFENG on 2017/4/19.
 */
@Service("headNewsService")
public class HeadNewsServiceImpl implements HeadNewsService {
	
	
    @Autowired
	private HeadNewsDao headNewsDao;
    @Override
    public HeadNews existHeadNews(HeadNews headNews) {
        return headNewsDao.existHeadNews(headNews);
    }

    @Override
    public void addHeadNews(HeadNews headNews) {
        headNewsDao.addHeadNews(headNews);
    }

    @Override
    public void updateHeadNews(HeadNews headNews) {
        headNewsDao.updateHeadNews(headNews);
    }


    @Override
    public void deleteHeadNews(HeadNews headNews) {
    	System.out.println(headNews);
    	System.out.println(headNewsDao);
        headNewsDao.deleteHeadNews(headNews);
    }

    @Override
    public PageBean<HeadNews> findHeadNews() {
        PageBean<HeadNews> pageBean = new PageBean<HeadNews>();
        System.out.println(headNewsDao);
        List<HeadNews> list = headNewsDao.findHeadNews();
        pageBean.setList(list);
        return pageBean;
    }
}
