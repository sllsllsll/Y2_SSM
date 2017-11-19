package cn.smbms.entity;

import java.util.Date;

/**
 * Created by linlin on 2017/9/1.
 */
public class faqs {
    private int id;
private String title;
    private Date createdate;
    private String content;
    private int classid;
    private classes cla;

    public classes getCla() {
        return cla;
    }

    public void setCla(classes cla) {
        this.cla = cla;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Date createdate) {
        this.createdate = createdate;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getClassid() {
        return classid;
    }

    public void setClassid(int classid) {
        this.classid = classid;
    }
}
