package Pet.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
@Entity
@Table(name="Resource")
public class Resource {
	            private Member member;
	            @ManyToOne
	            @JoinColumn(name = "member_id", foreignKey = @ForeignKey(name = "MEMBER1_ID_FK"))
	            public Member getMember() {
					return member;
				}
				public void setMember(Member member) {
					this.member = member;
				}
				private String downloadUrl;
                public String getDownloadUrl() {
					return downloadUrl;
				}
				public void setDownloadUrl(String downloadUrl) {
					this.downloadUrl = downloadUrl;
				}
				private  int id;
                @Id
            	@Column(name = "id", unique = true, nullable = false)
				public int getId() {
					return id;
				}
				public void setId(int id) {
					this.id = id;
				}
				private String name;
				private String introduce;
				private String time;
				public String getName() {
					return name;
				}
				public void setName(String name) {
					this.name = name;
				}
				public String getIntroduce() {
					return introduce;
				}
				public void setIntroduce(String introduce) {
					this.introduce = introduce;
				}
				public String getTime() {
					return time;
				}
				public void setTime(String string) {
					this.time = string;
				}
				public int getDownloadTimes() {
					return downloadTimes;
				}
				public void setDownloadTimes(int downloadTimes) {
					this.downloadTimes = downloadTimes;
				}
				public long getSize() {
					return size;
				}
				public void setSize(long l) {
					this.size = l;
				}
				private int  downloadTimes;
				private long  size;
				
}
