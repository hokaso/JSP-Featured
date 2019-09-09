package Pet.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;

import Pet.entity.CommentPO;
import Pet.entity.CommentPO2;
import Pet.service.ReviewService;
import net.sf.json.JSONArray;

/**
 * Created by GUOFENG on 2017/5/7.
 */
@Controller
public class ReviewAction extends ActionSupport {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private JSONArray root;
	@Autowired
    private ReviewService reviewService;
    private int cmtnewsid;
    @SuppressWarnings("unused")
	private int cmtvedioid;
	public void setCmtvedioid(int cmtvedioid) {
		this.cmtvedioid = cmtvedioid;
	}


	public void setReviewService(ReviewService reviewService) {
        this.reviewService = reviewService;
    }


    public String findReview() {
        List<CommentPO> commentPOList = reviewService.findReviewOfFive(cmtnewsid);
        if (commentPOList != null) {
            root = JSONArray.fromObject(commentPOList);
        }
        return SUCCESS;
    }

 public String findReview1() {
        List<CommentPO2> commentPO2List = reviewService.findReviewOfFive1(cmtvedioid);

        if (commentPO2List != null) {
            root = JSONArray.fromObject(commentPO2List);
        }
        return SUCCESS;
    }
    public JSONArray getRoot() {
        return root;
    }

    public void setRoot(JSONArray root) {
        this.root = root;
    }

    public void setCmtnewsid(int cmtnewsid) {
        this.cmtnewsid = cmtnewsid;
    }
}
