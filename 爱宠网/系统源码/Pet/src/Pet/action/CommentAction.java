package Pet.action;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import Pet.dao.CommentDao;
import Pet.entity.CommentPO;
import Pet.entity.PageBean;
import Pet.service.CommentService;
@Controller
public class CommentAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	
	public CommentPO getCommentPO() {
		return commentPO;
	}

	public void setCommentPO(CommentPO commentPO) {
		this.commentPO = commentPO;
	}

	private CommentPO commentPO;
	
    @Resource
	private CommentService commentService;
    @Resource
    private CommentDao commentDao;
    private String checkComment;

    private int currentPage = 1;

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public String findComment() {
    	//System.out.println(commentService);
        PageBean<CommentPO> pageBean = commentService.findComment(currentPage);
        ActionContext.getContext().getValueStack().push(pageBean);
        return "findCommentSuccess";
    }

    public String deleteComment() {
    	System.out.println(commentService);
    	System.out.println(commentPO);
    	//commentDao.deleteComment(commentPO);
        commentService.deleteComment(commentPO);
    	System.out.println("删除成功");
        return "deleteCommentSuccess";
    }

    public String deleteMoreComment() {
        String[] checkCommentIDs = this.getCheckComment().split(",");
        //commentDao.deleteMoreComment(checkCommentIDs);
       commentService.deleteMoreComment(checkCommentIDs);
          System.out.println("删除成功");
        return "deleteMoreCommentSuccess";
    }

    public String getCheckComment() {
        return checkComment;
    }

    public void setCheckComment(String checkComment) {
        this.checkComment = checkComment;
    }
}
