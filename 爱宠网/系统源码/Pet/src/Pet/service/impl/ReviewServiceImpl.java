package Pet.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import Pet.dao.ReviewDao;
import Pet.entity.CommentPO;
import Pet.entity.CommentPO2;
import Pet.service.ReviewService;
@Service
public class ReviewServiceImpl implements ReviewService {
    @Resource
    private ReviewDao reviewDao;

    public void setReviewDao(ReviewDao reviewDao) {
        this.reviewDao = reviewDao;
    }

    @Override
    public List<CommentPO> findReviewOfFive(int newsId) {
        int begin = 0;
        int count = 5;
        return reviewDao.findReviewOfFive(begin, count,newsId);
    }

    @Override
    public void addReview(CommentPO commentPO) {
        reviewDao.addReview(commentPO);
    }

	@Override
	public List<CommentPO2> findReviewOfFive1(int id) {
		  int begin = 0;
	      int count = 5;
	      return reviewDao.findReviewOfFive1(begin, count,id);
	}

	@Override
	public void addReview1(CommentPO2 commentPO2) {
		  reviewDao.addReview1(commentPO2);
		
	}
}
