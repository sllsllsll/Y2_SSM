package cn.smbms.service;

import cn.smbms.entity.Bookcategory;
import cn.smbms.entity.faqs;

import java.util.List;

/**
 * Created by linlin on 2017/9/1.
 */
public interface IFaqsService {
    public List<faqs> selectListAll();
    public int addList(faqs f);
    public List<faqs> selectListLike(String title);
    public faqs ListView(String title);
    public List<Bookcategory> getCateById(int cid);
}
