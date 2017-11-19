package cn.smbms.dao;

import cn.smbms.entity.User;
import cn.smbms.util.page;
import org.apache.ibatis.annotations.Param;

import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * Created by linlin on 2017/8/21.
 */
public interface IUserDao {
    public User isLogin(User user);
    //分页的查询用户管理
    public int count() throws IOException;//总记录数
    //简单分页用户管理
  /*  public List<User> UserLimit(@Param("from")Integer from,
                                @Param("pagesize")Integer pagesize) throws IOException;*/
  public List<User> UserLimit(Map<String,Object> map);

    public int Useradd(User user) throws IOException;
    //删除用户
    public int userdel(int[] id) throws IOException;
    public User userId(int id) throws IOException;
    public int userUpdate(User user) throws IOException;
  /*  public List<User> likeUserName(@Param("userName")String userName,@Param("from")Integer from,
                                   @Param("pagesize")Integer pagesize) throws IOException;*/
public List<User> UserListSelect();
//模糊查询的分页
    public List<User> likeUserName(Map<String,Object> map);
    public int updatepwd(String userPassword,String userCode);
}
