package Pet.entity;

import org.hibernate.annotations.ColumnDefault;

import javax.persistence.*;

/**
 * Created by GUOFENG on 2017/4/17.
 */
@Entity
@Table(name = "siteinfo")
public class SiteInfoPO {
    private int wsId;
    private String wsTitle;
    private String wsSite;
    private String wsKey;
    private String wsDes;
    private String wsAdmin;
    private String wsPhone;
    private String wsQq;
    private String wsEmail;
    private String wsAddress;
    private String wsFootor;

    @Id
    @Column(name = "ws_id")
    @ColumnDefault("1")
    public int getWsId() {
        return wsId;
    }

    public void setWsId(int wsId) {
        this.wsId = wsId;
    }

    @Basic
    @Column(name = "ws_title")
    public String getWsTitle() {
        return wsTitle;
    }

    public void setWsTitle(String wsTitle) {
        this.wsTitle = wsTitle;
    }


    @Basic
    @Column(name = "ws_site")
    public String getWsSite() {
        return wsSite;
    }

    public void setWsSite(String wsSite) {
        this.wsSite = wsSite;
    }

    @Basic
    @Column(name = "ws_key")
    public String getWsKey() {
        return wsKey;
    }

    public void setWsKey(String wsKey) {
        this.wsKey = wsKey;
    }

    @Basic
    @Column(name = "ws_des")
    public String getWsDes() {
        return wsDes;
    }

    public void setWsDes(String wsDes) {
        this.wsDes = wsDes;
    }

    @Basic
    @Column(name = "ws_admin")
    public String getWsAdmin() {
        return wsAdmin;
    }

    public void setWsAdmin(String wsAdmin) {
        this.wsAdmin = wsAdmin;
    }

    @Basic
    @Column(name = "ws_phone")
    public String getWsPhone() {
        return wsPhone;
    }

    public void setWsPhone(String wsPhone) {
        this.wsPhone = wsPhone;
    }

    @Basic
    @Column(name = "ws_qq")
    public String getWsQq() {
        return wsQq;
    }

    public void setWsQq(String wsQq) {
        this.wsQq = wsQq;
    }

    @Basic
    @Column(name = "ws_email")
    public String getWsEmail() {
        return wsEmail;
    }

    public void setWsEmail(String wsEmail) {
        this.wsEmail = wsEmail;
    }

    @Basic
    @Column(name = "ws_address")
    public String getWsAddress() {
        return wsAddress;
    }

    public void setWsAddress(String wsAddress) {
        this.wsAddress = wsAddress;
    }

    @Basic
    @Column(name = "ws_footor")
    public String getWsFootor() {
        return wsFootor;
    }

    public void setWsFootor(String wsFootor) {
        this.wsFootor = wsFootor;
    }

}
