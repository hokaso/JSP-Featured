package Pet.action;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import Pet.dao.CommentDao2;
import Pet.entity.CommentPO2;
import Pet.entity.PageBean;
import Pet.service.CommentService2;
@Controller
public class CommentAction2 extends ActionSupport {
	private static final long serialVersionUID = 1L;
	
	public CommentPO2 getCommentPO2() {
		return commentPO2;
	}

	public void setCommentPO2(CommentPO2 commentPO2) {
		this.commentPO2 = commentPO2;
	}

	private CommentPO2 commentPO2;
	
    @Resource
	private CommentService2 commentService2;
    @Resource
    private CommentDao2 commentDao2;
    private String checkComment;

    private int currentPage = 1;

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public String findComment() {
    	System.out.println(commentService2);
        PageBean<CommentPO2> pageBean = commentService2.findComment(currentPage);
        ActionContext.getContext().getValueStack().push(pageBean);
        return "findCommentSuccess";
    }

    public String deleteComment() {
    	System.out.println(commentService2);
    	System.out.println(commentPO2);
        commentService2.deleteComment(commentPO2);
    	System.out.println("删除成功");
        return "deleteCommentSuccess";
    }

    public String deleteMoreComment() {
        String[] checkCommentIDs = this.getCheckComment().split(",");
       
       commentService2.deleteMoreComment(checkCommentIDs);
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
