package cn.smbms.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * Created by Administrator on 2017/7/3.
 */
//`id``userCode``userName``userPassword``gender``birthday``phone``address``userRole``createBy``createDate``modifyBy``modfiyDate`
public class User {
    private Integer id; //id
    private String userCode; //用户编码
    private String userName;//用户名称
    private String userPassword; //用户密码
    private int gender;     //性别
   @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date birthday;   //出生日期
    private String phone;   //电话
    private String address;   //地址
    private int userRole;   //用户角色
    private int createdBy;   //创建者
    private Date creationDate;   //创建时间
    private int modifyBy;   //更新者
    private Date modfiyDate;   //更新时间
private String idPicPath;
private String workPicPath;




    private Role role;




    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUserCode() {
        return userCode;
    }

    public void setUserCode(String userCode) {
        this.userCode = userCode;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getUserRole() {
        return userRole;
    }

    public void setUserRole(int userRole) {
        this.userRole = userRole;
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

    public int getModifyBy() {
        return modifyBy;
    }

    public void setModifyBy(int modifyBy) {
        this.modifyBy = modifyBy;
    }

    public Date getModfiyDate() {
        return modfiyDate;
    }

    public void setModfiyDate(Date modfiyDate) {
        this.modfiyDate = modfiyDate;
    }
    public String getWorkPicPath() {
        return workPicPath;
    }

    public void setWorkPicPath(String workPicPath) {
        this.workPicPath = workPicPath;
    }
    public String getIdPicPath() {
        return idPicPath;
    }

    public void setIdPicPath(String idPicPath) {
        this.idPicPath = idPicPath;
    }
    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }
}
