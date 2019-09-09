package Pet.dao;

import Pet.entity.Vedio1;

import java.util.List;

/**
 * Created by GUOFENG on 2017/4/16.
 */
public interface DownloadDao {

    void deleteVedio1(Vedio1 newnewDownload);

    int findCountVedio1ByCondition(String newnewDownloadKey);

    List<Vedio1> findVedio1ByCondition(int begin, int pageCount,String newnewDownloadKey);

    void deleteMoreVedio1(String[] checkVedio1IDs);

}
