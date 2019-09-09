package Pet.service;

import java.util.List;

import Pet.entity.CommentPO;
import Pet.entity.CommentPO2;

/**
 * Created by GUOFENG on 2017/5/7.
 */
public interface ReviewService {
    List<CommentPO> findReviewOfFive(int newsId);

    void addReview(CommentPO commentPO);
    
    List<CommentPO2> findReviewOfFive1(int id);

    void addReview1(CommentPO2 commentPO2);
}
