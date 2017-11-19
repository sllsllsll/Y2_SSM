package cn.smbms.util;




import cn.smbms.entity.Bill;
import cn.smbms.entity.Provider;
import cn.smbms.entity.User;

import java.util.List;

/**
 * Created by linlin on 2017/7/5.
 */
public class page {
    private int pageindex;
    private int pagesize;
    private int pagetotalpages;//总记录数
    private Integer totalPages; //总页数
    private List<User> list;
    private List<Bill> listbill;
    private List<Provider> listpro;

    public List<Provider> getListpro() {
        return listpro;
    }

    public void setListpro(List<Provider> listpro) {
        this.listpro = listpro;
    }

    public Integer getTotalPages() {
        return totalPages;
    }

    public void setTotalPages(Integer totalPages) {
        this.totalPages = totalPages;
    }

    public List<Bill> getListbill() {
        return listbill;
    }

    public void setListbill(List<Bill> listbill) {
        this.listbill = listbill;
    }

    public List<User> getList() {
        return list;
    }

    public void setList(List<User> list) {
        this.list = list;
    }

    public int getPageindex() {
        return pageindex;
    }

    public void setPageindex(int pageindex) {
        this.pageindex = pageindex;
    }

    public int getPagesize() {
        return pagesize;
    }

    public void setPagesize(int pagesize) {
        this.pagesize = pagesize;
    }

    public int getPagetotalpages() {
        return pagetotalpages;
    }

    public void setPagetotalpages(int pagetotalpages) {
        this.pagetotalpages = pagetotalpages;
    }

}
