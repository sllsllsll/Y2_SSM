package cn.smbms.service.Impl;

import cn.smbms.dao.IUserDao;
import cn.smbms.entity.User;
import cn.smbms.service.IUserService;
import cn.smbms.util.page;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by linlin on 2017/8/21.
 */
@Service("userService")
public class IUserServiceImpl implements IUserService {
    @Resource(name = "IUserDao")
    IUserDao userdao;

    public User isLogin(User user) {
        return userdao.isLogin(user);
    }

    public int count() throws IOException {
        return userdao.count();
    }

    public page UserLimit(int pageIndex, int pageSize) throws IOException {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("pageIndex", pageIndex * pageSize);
        map.put("pageSize", pageSize);
        page p = new page();
        p.setPageindex(pageIndex);
        p.setPagesize(pageSize);
        int totalCount = userdao.count();
        p.setPagetotalpages(totalCount);
        int totalPages = p.getPagetotalpages() % p.getPagesize() == 0 ? p.getPagetotalpages() / p.getPagesize() : p.getPagetotalpages() / p.getPagesize() + 1;
        p.setTotalPages(totalPages);
        List<User> list = userdao.UserLimit(map);
        p.setList(list);
        return p;
    }


    public int Useradd(User user) throws IOException {
        return userdao.Useradd(user);
    }

    public int userdel(int[] id) throws IOException {
        return userdao.userdel(id);
    }

    public User userId(int id) throws IOException {
        return userdao.userId(id);
    }

    public int userUpdate(User user) throws IOException {
        return userdao.userUpdate(user);
    }

    public List<User> UserListSelect() {
        return userdao.UserListSelect();
    }

    public page UserListSelect(String userName,int pageIndex, int pageSize) throws IOException {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("pageIndex", pageIndex * pageSize);
        map.put("pageSize", pageSize);
        map.put("userName",userName);
        page p = new page();
        p.setPageindex(pageIndex);
        p.setPagesize(pageSize);
        int totalCount = userdao.count();
        p.setPagetotalpages(totalCount);
        int totalPages = p.getPagetotalpages() % p.getPagesize() == 0 ? p.getPagetotalpages() / p.getPagesize() : p.getPagetotalpages() / p.getPagesize() + 1;
        p.setTotalPages(totalPages);
        List<User> list = userdao.likeUserName(map);
        p.setList(list);
        return p;
    }

    public int updatepwd(String userPassword,String userCode) {
        return userdao.updatepwd(userPassword,userCode);
    }
}
