package Pet.service;

import Pet.entity.CommentPO;
import Pet.entity.PageBean;


public interface CommentService {
    PageBean<CommentPO> findComment(int currentPage);

    void deleteComment(CommentPO commentPO);

    void deleteMoreComment(String[] checkCommentIDs);
}
