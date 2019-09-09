package Pet.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
@Entity
@Table(name = "headnews")
public class HeadNews {
    private int headId;
    private String headTitle;
    private String headImg;
    private News news;

    @Id
    @GeneratedValue(generator = "headIdGenerator")
    @GenericGenerator(name = "headIdGenerator", strategy = "assigned")
    @Column(name = "head_id")
    public int getHeadId() {
        return headId;
    }

    public void setHeadId(int headId) {
        this.headId = headId;
    }

    @Basic
    @Column(name = "head_title")
    public String getHeadTitle() {
        return headTitle;
    }

    public void setHeadTitle(String headTitle) {
        this.headTitle = headTitle;
    }

    @Basic
    @Column(name = "head_img")
    public String getHeadImg() {
        return headImg;
    }

    public void setHeadImg(String headImg) {
        this.headImg = headImg;
    }

//15323595491
    @ManyToOne
    @JoinColumn(name = "news_id", foreignKey = @ForeignKey(name = "NEWS_ID_FK"))
    public News getNews() {
        return news;
    }

    public void setNews(News news) {
        this.news = news;
    }
}
