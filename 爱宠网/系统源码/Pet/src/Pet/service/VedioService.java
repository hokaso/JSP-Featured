package Pet.service;


import Pet.entity.Vedio;
import Pet.entity.Member;
import Pet.entity.PageBean;


public interface VedioService {
    void addVedio(Vedio vedio);

    void deleteVedio(Vedio vedio);

    PageBean<Vedio> findVedioByCondition(int currentPage, int typeId, String vedioKey);

    void deleteMoreVedio(String[] checkVedioIDs);
    
    public Vedio find(int vedio_id);
}
