package cn.smbms.controller;

import cn.smbms.entity.User;
import cn.smbms.service.IUserService;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.math.RandomUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

/**
 * Created by linlin on 2017/8/21.
 */
@Controller
public class UserController {
    @Resource(name = "userService")
    IUserService userService;

    //登录
    @RequestMapping("/islogin")
    public String isLogin(User info, HttpServletRequest request) {
        User user = userService.isLogin(info);
        request.getSession().setAttribute("id", user.getUserCode());
        request.getSession().setAttribute("User",user);
        request.getSession().setAttribute("username",user.getUserName());
        request.getSession().setAttribute("pwd",user.getUserPassword());
        if (user != null && !user.getUserName().equals("")) {
            //login success
            return "welcome";
        } else {
            return "login";
        }
    }
    //注销
    @RequestMapping("/logout")
    public String logout(HttpServletRequest request){
        request.getSession().removeAttribute("User");
        return "login";
    }

//分页的查询
 /*   @RequestMapping("/userLimit")
    public String UserLimit(HttpServletRequest request, HttpServletResponse response) throws IOException {
        page p = new page();
        int pagesize = 3;
        p.setPagesize(pagesize);
        int myindex = 0;
        String pageindex = request.getParameter("pageindex");
        if (pageindex != null) {
            myindex = Integer.parseInt(pageindex);
        } else {
            myindex = 1;
        }
        p.setPageindex(myindex);
        int totalpage = 0;
        try {
            int count = userService.count();
            if (count % pagesize == 0) {
                totalpage = count / pagesize;
            } else {
                totalpage = count / pagesize + 1;
            }
            p.setPagetotalpages(totalpage);
            List<User> list = userService.UserLimit((p.getPageindex() - 1) * pagesize, p.getPagesize());
            p.setList(list);
            request.setAttribute("Page", p);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "userList";
    }*/

    @RequestMapping("/showuserLimit")
    public String showUserList() {
        return "userList";
    }

    @ResponseBody
    @RequestMapping("/getUserinfo")
    public Object UserLimit(@RequestParam(defaultValue = "1") int pageIndex, @RequestParam(defaultValue = "2") int pageSize) throws IOException {

        return userService.UserLimit(pageIndex, pageSize);
    }



    @ResponseBody
    @RequestMapping("/getinfo")
    public Object UserListSelect(String userName,@RequestParam(defaultValue = "1") int pageIndex, @RequestParam(defaultValue = "2") int pageSize) throws IOException {
        System.out.println(userName+"========================");
        return userService.UserListSelect(userName,pageIndex,pageSize);
    }

    //添加
    @RequestMapping("useradd")
    public String Useradd(User user, HttpServletRequest request,@RequestParam(value = "attachs", required = false) MultipartFile[] attachs) throws Exception {

//判断文件是否为空
        System.out.println(attachs.length+"==============");
        String idPicPath = null;
        String workPicPath = null;
        String errorInfoString=null;
        boolean flag=true;
        String path = request.getSession().getServletContext().getRealPath("statics" + File.separator + "upload");

       for (int i=0;i<attachs.length;i++) {

           MultipartFile attach = attachs[i];
           System.out.println(attach);
           if (!attach.isEmpty()) {
               if (i == 0) {
                   errorInfoString = "uploadFileError";
               } else if (i == 1) {
                   errorInfoString = "uploadWpError";
               }
               //定义上传目标路径
               String oldFileName = attach.getOriginalFilename();
               String prefix = FilenameUtils.getExtension(oldFileName);
               int filesize = 500000;
               if (attach.getSize() > filesize) {
                   request.setAttribute(errorInfoString, "上传的太大了");
                flag=false;
               } else if (prefix.equalsIgnoreCase("jpg") ||
                       prefix.equalsIgnoreCase("jpeg") ||
                       prefix.equalsIgnoreCase("png") ||
                       prefix.equalsIgnoreCase("pneg")) {
                   String fileName = System.currentTimeMillis() + RandomUtils.nextInt(100000)
                           + "_Personal.jpg";
                   File targetFile = new File(path, fileName);
                   if (!targetFile.exists()) {
                       if (i == 0) {
                           idPicPath = path + File.separator + fileName;
                       } else if (i == 1) {
                           workPicPath = path + File.separator + fileName;
                       }
                       attach.transferTo(targetFile);
                   }
                   } else {
                       request.setAttribute(errorInfoString, "上传的格式不对");
                   flag=false;
               }
           }

       }
       if(flag){
        user.setCreatedBy(Integer.parseInt(request.getSession().getAttribute("id").toString()));
        user.setCreationDate(new Date());
        user.setIdPicPath(idPicPath);
        user.setWorkPicPath(workPicPath);
           System.out.println(idPicPath+"======");
           System.out.println(workPicPath+"----------");
        int count = userService.Useradd(user);
        if (count > 0) {
            System.out.println("添加成功");
            return "userList";
        }}
        return "userAdd";
    }



    ////////////////////////////////////////////
    //添加
/*    @RequestMapping("useradd")
    public String Useradd(User user, HttpServletRequest request) throws Exception {
        user.setCreatedBy(Integer.parseInt(request.getSession().getAttribute("id").toString()));
        user.setCreationDate(new Date());
        int count = userService.Useradd(user);
        if (count > 0) {
            return "userList";
        }
        return "userAdd";
    }*/
  /*  @RequestMapping("userdel")
    public String userdel(int id) throws IOException {
        List<User> list = userService.UserListSelect();
        int count = 0;
        for (User u : list) {
            count = userService.userdel(Integer.parseInt(String.valueOf(u.getId())));
        }
        System.out.println(count);
        System.out.println("删除成功");
        return "redirect:/userLimit";

    }*/
    //删除
    @ResponseBody
    @RequestMapping("userdel")
    public String userdel(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String path=null;
        String vars=request.getParameter("vars");
        System.out.println(vars+"a");
        String [] vals=vars.split(",");
        System.out.println(vals.length+"b");
        int[] num=new int[vals.length];
        for (int i=0;i<num.length;i++){
            num[i]=Integer.parseInt(vals[i]);
        }
        int i=userService.userdel(num);
        if(i>0){
            path="success";
        }else{
            path="fail";
        }
return path;

    }

    //修改的赋值
    @RequestMapping("userUpdateId")
    public String userId(int id, HttpServletRequest request) throws IOException {
        User updateuserid = userService.userId(id);
        request.setAttribute("UpdateById", updateuserid);
        request.getSession().setAttribute("upid", updateuserid.getId());
        return "userUpdate";
    }

    //修改用户信息
    @RequestMapping("userupdateUser")
    public String userUpdateuser(/* @Validated */User user, HttpServletRequest request) throws IOException {
        System.out.println("==================================");
        user.setModifyBy(Integer.parseInt(request.getSession().getAttribute("id").toString()));
        user.setModfiyDate(new Date());
        user.setId(Integer.parseInt(request.getSession().getAttribute("upid").toString()));
        int count = userService.userUpdate(user);
        if (count > 0) {
            System.out.println("修改成功");
            return "userList";
        } else {
            System.out.println("修改失败");
            return "userUpdate";
        }
    }
    //修改密码
@RequestMapping("updatepwds")
public String updatepwds(String userPassword,HttpServletRequest request){
    String o=request.getSession().getAttribute("id").toString();
        int i=userService.updatepwd(userPassword,o);
        if(i>0){
            System.out.println("修改成功");
            return "login";
        }
        else{
            return "password";
        }

}
    //查看的赋值
    @RequestMapping("userViewId")
    public String userIds(int id, HttpServletRequest request) throws IOException {
        User updateuserid = userService.userId(id);
        request.setAttribute("item", updateuserid);
        return "userView";
    }

    //带条件的分页查询
 /*   @RequestMapping("userLikeNameLimit")
    public String userLikeNames(String userName, HttpServletRequest request) {

        return "userList";
    }*/

 /*   //带条件的分页查询
    @RequestMapping("userLikeNameLimit")
    public String userLikeName(String userName, HttpServletRequest request) {

        //模糊查询  按名称
        page p = new page();
        int pagesize = 2;
        p.setPagesize(pagesize);
        int myindex = 0;
        String pageindex = request.getParameter("pageindex");
        if (pageindex != null) {
            myindex = Integer.parseInt(pageindex);
        } else {
            myindex = 1;
        }
        p.setPageindex(myindex);
        int totalpage = 0;
        try {
            int count = userService.count();
            if (count % pagesize == 0) {
                totalpage = count / pagesize;
            } else {
                totalpage = count / pagesize + 1;
            }
            p.setPagetotalpages(totalpage);
            List<User> list = userService.likeUserName(userName, (p.getPageindex() - 1) * pagesize, p.getPagesize());
            p.setList(list);
            request.setAttribute("Page", p);
            request.setAttribute("username", userName);
            System.out.println(list);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "userList";

    }*/

    //导出用户数据到Excel文件
 @RequestMapping("/downloadFile")
    public ResponseEntity<byte[]> download() throws IOException {
        String path="d:\\userList.xlsx";
        File file=new File(path);
        HttpHeaders headers = new HttpHeaders();
        String fileName=new String("userList.xlsx".getBytes("UTF-8"),"iso-8859-1");//为了解决中文名称乱码问题
        headers.setContentDispositionFormData("attachment", fileName);
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),
                headers, HttpStatus.CREATED);
    }

  /*  @RequestMapping("/dowmloadFile")
    public void ed(){

        WritableWorkbook wwb = null;

        // 创建可写入的Excel工作簿
        String fileName = "D://book.xls";
        File file=new File(fileName);
        if (!file.exists()) {
            file.createNewFile();
        }
        //以fileName为文件名来创建一个Workbook
        wwb = Workbook.createWorkbook(file);

        // 创建工作表
        WritableSheet ws = wwb.createSheet("Test Shee 1", 0);

        //查询数据库中所有的数据
        List<StuEntity> list= StuService.getAllByDb();
        //要插入到的Excel表格的行号，默认从0开始
        Label labelId= new Label(0, 0, "编号(id)");//表示第
        Label labelName= new Label(1, 0, "姓名(name)");
        Label labelSex= new Label(2, 0, "性别(sex)");
        Label labelNum= new Label(3, 0, "薪水(num)");

        ws.addCell(labelId);
        ws.addCell(labelName);
        ws.addCell(labelSex);
        ws.addCell(labelNum);
        for (int i = 0; i < list.size(); i++) {

            Label labelId_i= new Label(0, i+1, list.get(i).getId()+"");
            Label labelName_i= new Label(1, i+1, list.get(i).getName());
            Label labelSex_i= new Label(2, i+1, list.get(i).getSex());
            Label labelNum_i= new Label(3, i+1, list.get(i).getNum()+"");
            ws.addCell(labelId_i);
            ws.addCell(labelName_i);
            ws.addCell(labelSex_i);
            ws.addCell(labelNum_i);
        }

        //写进文档
        wwb.write();
        // 关闭Excel工作簿对象
        wwb.close();
    }
*/
}
