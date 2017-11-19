package cn.smbms.dao;

import cn.smbms.entity.Provider;

import java.util.List;
import java.util.Map;

/**
 * Created by linlin on 2017/9/9.
 */
public interface IProDao {
    //2.获取总记录数
    public int getTotalCount();
    //3.获取单页数据
    public List<Provider> getOnePageData(Map<String,Object> map);
    public List<Provider> getOnePageDataCondition(Map<String,Object> map);
    //4.获取带条件的总记录数
    public int getTotalCountByUserName(String proName);
}
