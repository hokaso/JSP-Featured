package Pet.service.impl;
import Pet.dao.CommentDao;
import Pet.entity.CommentPO;
import Pet.entity.PageBean;
import Pet.service.CommentService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
public class CommentServiceImpl implements CommentService {
	@Autowired
    private CommentDao commentDao;
    @Override
    public PageBean<CommentPO> findComment(int currentPage) {
        PageBean<CommentPO> pageBean = new PageBean<CommentPO>();
     
        pageBean.setCurrentPage(currentPage);
  
        int pageCount = 5;
        pageBean.setPageCount(pageCount);
        
        int totalSize = commentDao.findCountComment();
        pageBean.setTotalSize(totalSize);
       
        double ts = totalSize;
        Double num = Math.ceil(ts / pageCount);
        pageBean.setPageSize(num.intValue());
       
        int begin = (currentPage - 1) * pageCount;
       
        List<CommentPO> list = commentDao.findComment(begin, pageCount);
        pageBean.setList(list);
        return pageBean;
    }

    @Override
    public void deleteComment(CommentPO commentPO) {
        commentDao.deleteComment(commentPO);
    }

    @Override
    public void deleteMoreComment(String[] checkCommentIDs) {
        commentDao.deleteMoreComment(checkCommentIDs);
    }
}
