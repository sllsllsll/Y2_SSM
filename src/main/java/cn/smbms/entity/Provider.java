package cn.smbms.entity;

import java.util.Date;

/**
 * Created by Administrator on 2017/7/3.
 */
public class Provider {
    //`id``proCode``proName``proDesc``proContact``proPhone`
    // `proAddress``proFax``createdBy``creationDate``modfiyBy``modfiyDate`
    private Integer id;   //id
    private String proCode;   //供应商编码
    private String proName;   // 供应商名称
    private String proDesc;   //供应商详细描述
    private String proContact;   //供应商联系人
    private String proPhone;   //联系电话
    private String proAddress;   //地址
    private String proFax;   //传真
    private int createdBy;  //创建者
    private Date creationDate;  //创建时间
    private int modfiyBy;  //更新者
    private Date modfiyDate;  // 更新时间

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getProCode() {
        return proCode;
    }

    public void setProCode(String proCode) {
        this.proCode = proCode;
    }

    public String getProName() {
        return proName;
    }

    public void setProName(String proName) {
        this.proName = proName;
    }

    public String getProDesc() {
        return proDesc;
    }

    public void setProDesc(String proDesc) {
        this.proDesc = proDesc;
    }

    public String getProContact() {
        return proContact;
    }

    public void setProContact(String proContact) {
        this.proContact = proContact;
    }

    public String getProPhone() {
        return proPhone;
    }

    public void setProPhone(String proPhone) {
        this.proPhone = proPhone;
    }

    public String getProAddress() {
        return proAddress;
    }

    public void setProAddress(String proAddress) {
        this.proAddress = proAddress;
    }

    public String getProFax() {
        return proFax;
    }

    public void setProFax(String proFax) {
        this.proFax = proFax;
    }

    public int getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(int createdBy) {
        this.createdBy = createdBy;
    }

    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    public int getModfiyBy() {
        return modfiyBy;
    }

    public void setModfiyBy(int modfiyBy) {
        this.modfiyBy = modfiyBy;
    }

    public Date getModfiyDate() {
        return modfiyDate;
    }

    public void setModfiyDate(Date modfiyDate) {
        this.modfiyDate = modfiyDate;
    }
}
