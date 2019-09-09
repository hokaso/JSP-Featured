package Pet.service;

import Pet.entity.CommentPO2;
import Pet.entity.PageBean;


public interface CommentService2 {
    PageBean<CommentPO2> findComment(int currentPage);

    void deleteComment(CommentPO2 commentPO2);

    void deleteMoreComment(String[] checkCommentIDs);
}
