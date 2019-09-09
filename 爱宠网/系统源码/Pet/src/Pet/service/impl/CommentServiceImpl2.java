package Pet.service.impl;
import Pet.dao.CommentDao2;
import Pet.entity.CommentPO2;
import Pet.entity.PageBean;
import Pet.service.CommentService;
import Pet.service.CommentService2;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
public class CommentServiceImpl2 implements CommentService2 {
	@Autowired
    private CommentDao2 commentDao2;
    @Override
    public PageBean<CommentPO2> findComment(int currentPage) {
        PageBean<CommentPO2> pageBean = new PageBean<CommentPO2>();
     
        pageBean.setCurrentPage(currentPage);
  
        int pageCount = 5;
        pageBean.setPageCount(pageCount);
        
        int totalSize = commentDao2.findCountComment();
        pageBean.setTotalSize(totalSize);
       
        double ts = totalSize;
        Double num = Math.ceil(ts / pageCount);
        pageBean.setPageSize(num.intValue());
       
        int begin = (currentPage - 1) * pageCount;
       
        List<CommentPO2> list = commentDao2.findComment(begin, pageCount);
        pageBean.setList(list);
        return pageBean;
    }

    @Override
    public void deleteComment(CommentPO2 commentPO2) {
        commentDao2.deleteComment(commentPO2);
    }

    @Override
    public void deleteMoreComment(String[] checkCommentIDs) {
        commentDao2.deleteMoreComment(checkCommentIDs);
    }
}
