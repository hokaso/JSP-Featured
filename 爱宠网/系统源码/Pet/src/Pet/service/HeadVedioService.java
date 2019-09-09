package Pet.service;



import Pet.entity.HeadVedio;
import Pet.entity.PageBean;


public interface HeadVedioService {


    void deleteHeadVedio(HeadVedio headVedio);

    PageBean<HeadVedio> findHeadVedio();

    HeadVedio existHeadVedio(HeadVedio headVedio);

    void addHeadVedio(HeadVedio headVedio);

    void updateHeadVedio(HeadVedio headVedio);
}
