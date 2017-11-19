package cn.smbms.service.Impl;

import cn.smbms.dao.IProDao;
import cn.smbms.entity.Provider;
import cn.smbms.service.IProService;
import cn.smbms.util.page;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by linlin on 2017/9/9.
 */
@Service("proservice")
public class IProServiceImpl implements IProService {
    @Resource()
    IProDao prodao;
    public int getTotalCount() {
        return prodao.getTotalCount() ;
    }

    public page getOnePageData(int pageIndex, int pageSize) {

        Map<String,Object> map=new HashMap<String,Object>();
        map.put("pageIndex",pageIndex*pageSize);
        map.put("pageSize",pageSize);

        page page=new page(); //实例化一个PageUtil对象

        page.setPagesize(pageSize); //给PageUtil属性赋值
        page.setPageindex(pageIndex);//给PageUtil的pageIndex赋值
        //
        page.setPagetotalpages(prodao.getTotalCount());

        int totalPages=page.getPagetotalpages()%page.getPagesize()==0?page.getPagetotalpages()/page.getPagesize():page.getPagetotalpages()/page.getPagesize()+1;
        page.setTotalPages(totalPages);
        //为什么dao层方法的入参我写成map？？？
        List<Provider> list = prodao.getOnePageData(map);
       // List<Provider> list = prodao.getOnePageData(map);
        page.setListpro(list);
        return page;
    }

    public int getTotalCountByUserName(String proName) {
        return prodao.getTotalCountByUserName(proName);
    }

    public page getOnePageData(int pageIndex, int pageSize, Provider info) {
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("pageIndex",pageIndex*pageSize);
        map.put("pageSize",pageSize);
        if (info!=null) {
            map.put("proName", info.getProName());
        }
        page page=new page(); //实例化一个PageUtil对象

        page.setPagesize(pageSize); //给PageUtil属性赋值
        page.setPageindex(pageIndex);//给PageUtil的pageIndex赋值
        //
        if (info!=null){
            page.setPagetotalpages(prodao.getTotalCountByUserName(info.getProName()));
        }else{
            page.setTotalPages(prodao.getTotalCount());
        }
        int totalPages=page.getPagetotalpages()%page.getPagesize()==0?page.getPagetotalpages()/page.getPagesize():page.getPagetotalpages()/page.getPagesize()+1;
        page.setTotalPages(totalPages);
        //为什么dao层方法的入参我写成map？？？
        List<Provider> list = prodao.getOnePageData(map);
        page.setListpro(list);
        return page;
    }
}
