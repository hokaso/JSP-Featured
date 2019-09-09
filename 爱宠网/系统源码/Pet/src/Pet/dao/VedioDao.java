package Pet.dao;

import java.util.List;

import Pet.entity.*;
/**
 * Created by GUOFENG on 2017/4/16.
 */
public interface VedioDao {
    void addVedio(Vedio vedio);

    void deleteVedio(Vedio news);

    int findCountVedioByCondition(int typeId, String vedioKey);

    List<Vedio> findVedioByCondition(int begin, int pageCount, int typeId, String vedioKey);

    void deleteMoreVedio(String[] checkVedioIDs);
    
    Vedio find(int vedio_id);
}
