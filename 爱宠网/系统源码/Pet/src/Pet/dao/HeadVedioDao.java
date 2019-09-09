package Pet.dao;

import Pet.entity.HeadVedio;

import java.util.List;

/**
 * Created by GUOFENG on 2017/4/19.
 */
public interface HeadVedioDao {



    void deleteHeadVedio(HeadVedio headvedio);

    List<HeadVedio> findHeadVedio();

    void addHeadVedio(HeadVedio headvedio);

    void updateHeadVedio(HeadVedio headvedio);

    public HeadVedio existHeadVedio(HeadVedio headvedio);
}
