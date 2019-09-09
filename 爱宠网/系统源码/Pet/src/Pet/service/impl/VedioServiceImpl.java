package Pet.service.impl;
import Pet.dao.VedioDao;
import Pet.entity.Vedio;
import Pet.entity.PageBean;
import Pet.entity.Vedio;
import Pet.service.VedioService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class VedioServiceImpl implements VedioService{
	@Autowired
    private VedioDao vedioDao;

    public void setVedioDao(VedioDao vedioDao) {
        this.vedioDao = vedioDao;
    }

    @Override
    public void addVedio(Vedio vedio) {
    	
        vedioDao.addVedio(vedio);
    }

    @Override
    public void deleteVedio(Vedio vedio) {
    	
        vedioDao.deleteVedio(vedio);
        
    }


    @Override
    public PageBean<Vedio> findVedioByCondition(int currentPage, int typeId, String vedioKey) {
        PageBean<Vedio> pageBean = new PageBean<Vedio>();
        
        pageBean.setCurrentPage(currentPage);
       
        int pageCount = 5;
        pageBean.setPageCount(pageCount);
        
        int totalSize = vedioDao.findCountVedioByCondition(typeId,vedioKey);
        pageBean.setTotalSize(totalSize);
        
        double ts = totalSize;
        Double num = Math.ceil(ts / pageCount);
        pageBean.setPageSize(num.intValue());
        
        int begin = (currentPage - 1) * pageCount;
        
        List<Vedio> list = vedioDao.findVedioByCondition(begin, pageCount,typeId,vedioKey);
        pageBean.setList(list);
        return pageBean;
    }

    @Override
    public void deleteMoreVedio(String[] checkVedioIDs) {
    	System.out.println(vedioDao);
        vedioDao.deleteMoreVedio(checkVedioIDs);
    }

	@Override
	public Vedio find(int vedio_id) {
		// TODO Auto-generated method stub
		return vedioDao.find(vedio_id);
	}
}
