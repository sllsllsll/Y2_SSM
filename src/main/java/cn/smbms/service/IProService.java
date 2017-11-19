package cn.smbms.service;

import cn.smbms.entity.Provider;
import cn.smbms.util.page;

/**
 * Created by linlin on 2017/9/9.
 */
public interface IProService {

    //2.获取总记录数
    public int getTotalCount();
    //3.获取单页数据
    public page getOnePageData(int pageIndex, int pageSize);

    //4.获取带条件的总记录数
    public int getTotalCountByUserName(String proName);

    //4.模糊查询
    public page getOnePageData(int pageIndex, int pageSize, Provider info);
}
