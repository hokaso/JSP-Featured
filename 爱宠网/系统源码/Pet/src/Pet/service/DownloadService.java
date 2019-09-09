package Pet.service;

import Pet.entity.PageBean;
import Pet.entity.Vedio1;


public interface DownloadService {
  
    void deleteDownload(Vedio1 newDownload);

    PageBean<Vedio1> findDownloadByCondition(int currentPage, String newDownloadKey);

    void deleteMoreDownload(String[] checkDownloadIDs);

}
