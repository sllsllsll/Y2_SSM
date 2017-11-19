package cn.smbms.entity;

import java.util.HashSet;
import java.util.Set;

/**
 * Created by linlin on 2017/9/1.
 */
public class Bookcategory {

    private int cateid;
    private String catename;
    private int pid;

    private Set<Bookcategory> cate=new HashSet<Bookcategory>();

    public Set<Bookcategory> getCate() {
        return cate;
    }

    public void setCate(Set<Bookcategory> cate) {
        this.cate = cate;
    }

    public int getCateid() {
        return cateid;
    }

    public void setCateid(int cateid) {
        this.cateid = cateid;
    }

    public String getCatename() {
        return catename;
    }

    public void setCatename(String catename) {
        this.catename = catename;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }
}
