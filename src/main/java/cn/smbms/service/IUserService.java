package cn.smbms.service;

import cn.smbms.entity.User;
import cn.smbms.util.page;
import org.apache.ibatis.annotations.Param;

import java.io.IOException;
import java.util.List;

/**
 * Created by linlin on 2017/8/21.
 */
public interface IUserService {
    public User isLogin(User user);
    //分页的查询用户管理
    public int count() throws IOException;//总记录数
    //简单分页用户管理
   /* public List<User> UserLimit(@Param("from")Integer from,
                                @Param("pagesize")Integer pagesize) throws IOException;*/

   public page UserLimit(int pageIndex, int pageSize) throws IOException;
    public int Useradd(User user) throws IOException;
    //删除用户
/*    public int userdel(int id) throws IOException;*/
    public int userdel(int[] id) throws IOException;
    public User userId(int id) throws IOException;
    public int userUpdate(User user) throws IOException;
   /* public List<User> likeUserName(@Param("userName")String userName,@Param("from")Integer from,
                                   @Param("pagesize")Integer pagesize) throws IOException;*/
    public List<User> UserListSelect();
    public page UserListSelect(String userName,int pageIndex, int pageSize) throws IOException;
    public int updatepwd(String userPassword,String userCode);
}
