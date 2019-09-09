package Pet.dao;

import java.util.List;

import Pet.entity.CommentPO;
import Pet.entity.CommentPO2;

/**
 * Created by GUOFENG on 2017/5/7.
 */
public interface ReviewDao {
    List<CommentPO> findReviewOfFive(int begin, int count, int newsId);

    void addReview(CommentPO commentPO);
    
    List<CommentPO2> findReviewOfFive1(int begin, int count, int id);

    void addReview1(CommentPO2 commentPO2);

}
