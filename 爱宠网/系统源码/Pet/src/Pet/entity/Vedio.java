package Pet.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;
@Entity
@Table(name="video")
public class Vedio {
	private int id;//视频id
	private String address;//视频存放地址
	@Id
	@GenericGenerator(name = "generater",strategy = "native")
	@GeneratedValue(generator = "generater")
	@Column(name = "id",length=11)
	public int getId() {
		return id;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String fileFileName) {
		this.address = fileFileName;
	}
	public void setId(int id) {
		this.id = id;
	}
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
    private String vedioTitle;
    @Column(name = "vedioKey", length=20)
    public String getVedioKey() {
		return vedioKey;
	}
	public void setVedioKey(String vedioKey) {
		this.vedioKey = vedioKey;
	}
	@Column(name = "vedioAuthor", length=20)
	public String getVedioAuthor() {
		return vedioAuthor;
	}
	
	public void setVedioAuthor(String vedioAuthor) {
		this.vedioAuthor = vedioAuthor;
	}
	@Column(name = "vedioDate")
	public java.util.Date getVedioDate() {
		return vedioDate;
	}
	public void setVedioDate(java.util.Date vedioDate) {
		this.vedioDate = vedioDate;
	}
	private String vedioContent;
    private String vedioKey;
    private String vedioAuthor;
    private java.util.Date vedioDate;
    private VedioTypePO vedioTypePO;
	
	@Column(name = "vedioTitle", length=255)
	public String getVedioTitle() {
		return vedioTitle;
	}
	public void setVedioTitle(String vedioTitle) {
		this.vedioTitle = vedioTitle;
	}
	@Column(name = "vedioContent", length=255)
	public String getVedioContent() {
		return vedioContent;
	}
	public void setVedioContent(String vedioContent) {
		this.vedioContent = vedioContent;
	}

	@ManyToOne
    @JoinColumn(name = "type_id", foreignKey = @ForeignKey(name = "VEDIOTYPE_ID_FK"))
    public VedioTypePO getVedioTypePO() {
        return vedioTypePO;
    }

    public void setVedioTypePO(VedioTypePO vedioTypePO) {
        this.vedioTypePO = vedioTypePO;
    }
	
}
