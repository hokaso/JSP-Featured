package Pet.dao;

import java.util.List;

import Pet.entity.CommentPO2;

public interface CommentDao2 {
    int findCountComment();

    List<CommentPO2> findComment(int begin, int pageCount);

    void deleteComment(CommentPO2 commentPO);

    void deleteMoreComment(String[] checkCommentIDs);

}
