package Pet.dao;

import java.util.List;

import Pet.entity.CommentPO;

public interface CommentDao {
    int findCountComment();

    List<CommentPO> findComment(int begin, int pageCount);

    void deleteComment(CommentPO commentPO);

    void deleteMoreComment(String[] checkCommentIDs);

}
