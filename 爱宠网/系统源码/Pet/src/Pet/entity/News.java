package Pet.entity;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.*;
@Entity
@Table(name="News")
public class News {

	
	private String day;
	
	private String month;
	
	private String year;
	@Transient
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	@Transient
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	@Transient
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	private int newsId;
    private String newsTitle;
    @Column(name = "newsKey", length=20)
    public String getNewsKey() {
		return newsKey;
	}
	public void setNewsKey(String newsKey) {
		this.newsKey = newsKey;
	}
	@Column(name = "newsAuthor", length=20)
	public String getNewsAuthor() {
		return newsAuthor;
	}
	
	public void setNewsAuthor(String newsAuthor) {
		this.newsAuthor = newsAuthor;
	}
	@Column(name = "newsImg")
	public String getNewsImg() {
		return newsImg;
	}
	public void setNewsImg(String newsImg) {
		this.newsImg = newsImg;
	}
	@Column(name = "newsDate")
	public java.util.Date getNewsDate() {
		return newsDate;
	}
	public void setNewsDate(java.util.Date newsDate) {
		this.newsDate = newsDate;
	}
	private String newsContent;
    private String newsKey;
    private String newsAuthor;
    private String newsImg;
    private java.util.Date newsDate;
    private NewsTypePO newsTypePO;
	
	@Column(name = "newsTitle", length=255)
	public String getNewsTitle() {
		return newsTitle;
	}
	public void setNewsTitle(String newsTitle) {
		this.newsTitle = newsTitle;
	}
	
	@Id
	@Column(name = "newsId", unique = true, nullable = false)
	public int getNewsId() {
		return newsId;
	}
	public void setNewsId(int newsId) {
		this.newsId = newsId;
	}
	@Column(name = "newsContent", length=255)
	public String getNewsContent() {
		return newsContent;
	}
	public void setNewsContent(String newsContent) {
		this.newsContent = newsContent;
	}

	@ManyToOne
    @JoinColumn(name = "type_id", foreignKey = @ForeignKey(name = "NEWSTYPE_ID_FK"))
    public NewsTypePO getNewsTypePO() {
        return newsTypePO;
    }

    public void setNewsTypePO(NewsTypePO newsTypePO) {
        this.newsTypePO = newsTypePO;
    }
}
