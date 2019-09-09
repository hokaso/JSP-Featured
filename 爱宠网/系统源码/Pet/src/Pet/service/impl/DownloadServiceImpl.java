package Pet.service.impl;
import Pet.dao.DownloadDao;
import Pet.entity.Vedio1;
import Pet.entity.PageBean;
import Pet.service.DownloadService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class DownloadServiceImpl implements DownloadService{
	@Autowired
    private DownloadDao downloadDao;

    public void setDownloadDao(DownloadDao downloadDao) {
        this.downloadDao = downloadDao;
    }

    @Override
    public void deleteDownload(Vedio1 download) {
        downloadDao.deleteVedio1(download);
        
    }


    @Override
    public PageBean<Vedio1> findDownloadByCondition(int currentPage, String downloadKey) {
        PageBean<Vedio1> pageBean = new PageBean<Vedio1>();
        
        pageBean.setCurrentPage(currentPage);
       
        int pageCount = 5;
        pageBean.setPageCount(pageCount);
        
        int totalSize = downloadDao.findCountVedio1ByCondition(downloadKey);
        pageBean.setTotalSize(totalSize);
        
        double ts = totalSize;
        Double num = Math.ceil(ts / pageCount);
        pageBean.setPageSize(num.intValue());
        
        int begin = (currentPage - 1) * pageCount;
        
        List<Vedio1> list = downloadDao.findVedio1ByCondition(begin, pageCount,downloadKey);
        pageBean.setList(list);
        return pageBean;
    }

    @Override
    public void deleteMoreDownload(String[] checkDownloadIDs) {
    	System.out.println(downloadDao);
        downloadDao.deleteMoreVedio1(checkDownloadIDs);
    }
}
