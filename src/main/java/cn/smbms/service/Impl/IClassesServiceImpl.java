package cn.smbms.service.Impl;

import cn.smbms.dao.IClassesDao;
import cn.smbms.entity.classes;
import cn.smbms.service.IClassesService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by linlin on 2017/9/1.
 */
@Service("classService")
public class IClassesServiceImpl implements IClassesService {
    @Resource(name="IClassesDao")
    private IClassesDao cladao;
    public List<classes> selectIDName() {
        return cladao.selectIDName();
    }
}
