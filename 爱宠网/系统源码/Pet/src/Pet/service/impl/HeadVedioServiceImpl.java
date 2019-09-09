package Pet.service.impl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Pet.dao.HeadVedioDao;
import Pet.entity.HeadVedio;
import Pet.entity.HeadVedio;
import Pet.entity.PageBean;
import Pet.service.HeadVedioService;


/**
 * Created by GUOFENG on 2017/4/19.
 */
@Service("headVedioService")
public class HeadVedioServiceImpl implements HeadVedioService {
	
	
    @Autowired
	private HeadVedioDao headVedioDao;
    public HeadVedio existHeadVedio(HeadVedio headVedio) {
        return headVedioDao.existHeadVedio(headVedio);
    }

    @Override
    public void addHeadVedio(HeadVedio headVedio) {
        headVedioDao.addHeadVedio(headVedio);
    }

    @Override
    public void updateHeadVedio(HeadVedio headVedio) {
        headVedioDao.updateHeadVedio(headVedio);
    }


    @Override
    public void deleteHeadVedio(HeadVedio headVedio) {
    	System.out.println(headVedio);
    	System.out.println(headVedioDao);
        headVedioDao.deleteHeadVedio(headVedio);
    }

    @Override
    public PageBean<HeadVedio> findHeadVedio() {
        PageBean<HeadVedio> pageBean = new PageBean<HeadVedio>();
        System.out.println(headVedioDao);
        List<HeadVedio> list = headVedioDao.findHeadVedio();
        pageBean.setList(list);
        return pageBean;
    }
}
