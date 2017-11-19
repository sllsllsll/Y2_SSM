package cn.smbms.service.Impl;

import cn.smbms.dao.IFaqs;
import cn.smbms.entity.Bookcategory;
import cn.smbms.entity.faqs;
import cn.smbms.service.IFaqsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by linlin on 2017/9/1.
 */
@Service("faqsService")
public class IFaqsServiceImpl implements IFaqsService {
    @Resource(name = "IFaqs")
    private IFaqs ifdao;
    public List<faqs> selectListAll() {
        return ifdao.selectListAll();
    }

    public int addList(faqs f) {
        return ifdao.addList(f);
    }

    public List<faqs> selectListLike(String title) {
        return ifdao.selectListLike(title);
    }

    public faqs ListView(String title) {
        return ifdao.ListView(title);
    }

    public List<Bookcategory> getCateById(int cid) {
        return ifdao.getCateById(cid);
    }

    public IFaqs getIfdao() {
        return ifdao;
    }

    public void setIfdao(IFaqs ifdao) {
        this.ifdao = ifdao;
    }
}
