package Pet.action;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;

import Pet.entity.CommentPO;
import Pet.entity.CommentPO2;
import Pet.entity.Member;
import Pet.entity.News;
import Pet.entity.Vedio;
import Pet.service.ReviewService;
import net.sf.json.JSONArray;

/**
 * Created by GUOFENG on 2017/5/8.
 */
@Controller
public class SubmitCmtAction extends ActionSupport {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Autowired
	private ReviewService reviewService;
    private JSONArray root;

    public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getVedioId() {
		return vedioId;
	}

	public void setVedioId(int vedioId) {
		this.vedioId = vedioId;
	}

	public int getUser1Id() {
		return user1Id;
	}

	public void setUser1Id(int user1Id) {
		this.user1Id = user1Id;
	}

	public String getCmtContent1() {
		return cmtContent1;
	}

	public void setCmtContent1(String cmtContent1) {
		this.cmtContent1 = cmtContent1;
	}

	private int newsId;
    private int userId;
    private int vedioId;
    private int user1Id;
    private String cmtContent;
    private String cmtContent1;
    public void setReviewService(ReviewService reviewService) {
        this.reviewService = reviewService;
    }

    public String addReview() {
    	
        CommentPO commentPO = new CommentPO();
        News news = new News();
        news.setNewsId(newsId);
       
        commentPO.setNews(news);
        Member member = new Member();
        member.setId(userId);
        
        commentPO.setMember(member);
        commentPO.setCmtContent(cmtContent);
        
        Date date = new Date();
        String nowTime1 =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
        Timestamp goodsC_date = Timestamp.valueOf(nowTime1);
        commentPO.setCmtDate(goodsC_date);
        
       
        reviewService.addReview(commentPO);
        System.out.println("ok");
        root = JSONArray.fromObject(1);
        return SUCCESS;
    }
    public String addReview1() {
    	
        CommentPO2 commentPO2 = new CommentPO2();
        Vedio vedio = new Vedio();
        vedio.setId(vedioId);
       
        commentPO2.setVedio(vedio);
        Member member = new Member();
        member.setId(user1Id);
        
        commentPO2.setMember(member);
        commentPO2.setCmtContent(cmtContent1);
        
        Date date = new Date();
        String nowTime1 =new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
        Timestamp goodsC_date = Timestamp.valueOf(nowTime1);
        commentPO2.setCmtDate(goodsC_date);
        
       
        reviewService.addReview1(commentPO2);
        System.out.println("ok");
        root = JSONArray.fromObject(1);
        return SUCCESS;
    }
    public JSONArray getRoot() {
        return root;
    }

    public void setRoot(JSONArray root) {
        this.root = root;
    }

    public int getNewsId() {
        return newsId;
    }

    public void setNewsId(int newsId) {
        this.newsId = newsId;
    }
    public String getCmtContent() {
        return cmtContent;
    }

    public void setCmtContent(String cmtContent) {
        this.cmtContent = cmtContent;
    }

}
