package Pet.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
@Entity
@Table(name="danmu")
public class Danmu {
	 @ManyToOne
	 @JoinColumn(name = "vedio_id", foreignKey = @ForeignKey(name = "VEDIO_ID_FK"))
	public Vedio getVedio() {
		return vedio;
	}
	public void setVedio(Vedio vedio) {
		this.vedio = vedio;
	}
	private String text;
	private String color;
	private int size;
	private int position;
	private int time;
	private int id;
	private Vedio vedio;
	
	private Member member;
	@ManyToOne
	 @JoinColumn(name = "member_id", foreignKey = @ForeignKey(name = "MEMBER_ID_FK"))
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public int getPosition() {
		return position;
	}
	public void setPosition(int position) {
		this.position = position;
	}
	public int getTime() {
		return time;
	}
	public void setTime(int time) {
		this.time = time;
	}

	@Id
	@GenericGenerator(name = "generater",strategy = "native")
	@GeneratedValue(generator = "generater")
	@Column(name = "id",length=11)
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
}
