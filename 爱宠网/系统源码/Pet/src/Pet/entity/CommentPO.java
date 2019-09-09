package Pet.entity;

import java.sql.Timestamp;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import org.hibernate.annotations.ColumnDefault;
@Entity
@Table(name = "comment")
public class CommentPO {
    private int cmtId;
    private News news;
    private Member member;
    private String cmtContent;
    private Timestamp cmtDate;

    @Id
    @Column(name = "cmt_id")
    @ColumnDefault("0")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getCmtId() {
        return cmtId;
    }

    public void setCmtId(int cmtId) {
        this.cmtId = cmtId;
    }

    @ManyToOne
    @JoinColumn(name = "news_id", foreignKey = @ForeignKey(name = "NEWS_ID_FK"))
    public News getNews() {
        return news;
    }

    public void setNews(News news) {
        this.news = news;
    }

    @ManyToOne
    @JoinColumn(name = "member_id", foreignKey = @ForeignKey(name = "member_ID_FK"))
    public Member getMember() {
        return member;
    }

    public void setMember(Member member) {
        this.member = member;
    }


	    @Basic
	    @Column(name = "cmt_content")
	    public String getCmtContent() {
	        return cmtContent;
	    }

	    public void setCmtContent(String cmtContent) {
	        this.cmtContent = cmtContent;
	    }

	    @Basic
	    @Column(name = "cmt_date")
	    public Timestamp getCmtDate() {
			return cmtDate;
		}

		public void setCmtDate(Timestamp cmtDate) {
			this.cmtDate = cmtDate;
		}

	}

