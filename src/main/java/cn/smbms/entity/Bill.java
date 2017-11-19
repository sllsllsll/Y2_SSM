package cn.smbms.entity;

import java.util.Date;

/**
 * Created by Administrator on 2017/7/3.
 */
public class Bill {
    //`id``billCode``productName``productDesc``productUnit``productCount``
    // totalPrice``isPayment``providerId``createdBy``creationDate``modfiyBy``modfiyDate`
    private Integer id;   //id
    private String billCode;    //订单编码
    private String productName;   //商品名称
    private String productDesc;  //商品描述
    private String productUnit;   //商品单位
    private Double productCount;  //商品数量
    private Double totalPrice;   //商品总额
    private int isPayment;   //是否支付
    private int providerId;   //供应商id
    private int createdBy;  //创建者
    private Date creationDate;   //创建时间
    private int modfiyBy;  //更新者
    private Date modfiyDate; // 更新时间
    ///添加一个供应商的对象
    private Provider pro;

    public Provider getPro() {
        return pro;
    }

    public void setPro(Provider pro) {
        this.pro = pro;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getBillCode() {
        return billCode;
    }

    public void setBillCode(String billCode) {
        this.billCode = billCode;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductDesc() {
        return productDesc;
    }

    public void setProductDesc(String productDesc) {
        this.productDesc = productDesc;
    }

    public String getProductUnit() {
        return productUnit;
    }

    public void setProductUnit(String productUnit) {
        this.productUnit = productUnit;
    }

    public Double getProductCount() {
        return productCount;
    }

    public void setProductCount(Double productCount) {
        this.productCount = productCount;
    }

    public Double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public int getIsPayment() {
        return isPayment;
    }

    public void setIsPayment(int isPayment) {
        this.isPayment = isPayment;
    }

    public int getProviderId() {
        return providerId;
    }

    public void setProviderId(int providerId) {
        this.providerId = providerId;
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
