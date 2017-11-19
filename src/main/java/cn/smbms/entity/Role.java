package cn.smbms.entity;

import java.util.Date;

/**
 * Created by Administrator on 2017/7/3.
 */
public class Role {
    //`id``roleCode``roleName``createBy``creationDate``modfiyBy``modfiyDate`
    private Integer id;   //id
    private String roleCode;  //角色编码
    private String roleName;  //角色名称
    private int createBy;   //创建者
    private Date creationDate;  //创建时间
    private Double modfiyBy;  //更新者
    private Date modfiyDate;   //更新时间

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRoleCode() {
        return roleCode;
    }

    public void setRoleCode(String roleCode) {
        this.roleCode = roleCode;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public int getCreateBy() {
        return createBy;
    }

    public void setCreateBy(int createBy) {
        this.createBy = createBy;
    }

    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    public Double getModfiyBy() {
        return modfiyBy;
    }

    public void setModfiyBy(Double modfiyBy) {
        this.modfiyBy = modfiyBy;
    }

    public Date getModfiyDate() {
        return modfiyDate;
    }

    public void setModfiyDate(Date modfiyDate) {
        this.modfiyDate = modfiyDate;
    }
}
