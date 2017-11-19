package cn.smbms.entity;

import java.util.Date;

/**
 * Created by Administrator on 2017/7/3.
 */
public class Address {
    //`id``contact``addressDesc``postCode``tel``createdBy``creationDate``modfiyBy``modfiyDate`
    private Integer id; //id
    private String contact;   // 联系人姓名
    private String addressDesc;  //收货地址明细
    private String postCode;   //邮编
    private String tel;  //联系人电话
    private int createdBy;  //创建者
    private Date creationDate;  //创建时间
    private int modfiyBy;    //更新者
    private Date modfiyDate;  //更新时间

    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }


    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getAddressDesc() {
        return addressDesc;
    }

    public void setAddressDesc(String addressDesc) {
        this.addressDesc = addressDesc;
    }

    public String getPostCode() {
        return postCode;
    }

    public void setPostCode(String postCode) {
        this.postCode = postCode;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
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
