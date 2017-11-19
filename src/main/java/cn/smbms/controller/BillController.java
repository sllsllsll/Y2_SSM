package cn.smbms.controller;

import cn.smbms.entity.Bill;
import cn.smbms.service.IBillService;
import cn.smbms.util.page;
import com.alibaba.fastjson.JSON;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Created by linlin on 2017/8/22.
 */
@Controller
public class BillController {

    @Resource(name = "billService")
    IBillService billService;

   @RequestMapping("/showBillLimit")
    public String showBillLimit(HttpServletRequest request) {

        return "redirect:/userLimit";
    }

/*@ResponseBody
@RequestMapping("/billLimits")
public void billLimit(@RequestParam(defaultValue = "1") int pageIndex, @RequestParam(defaultValue = "2") int pageSize, HttpServletRequest request, HttpServletResponse response) throws IOException {

 List<Bill> p=billService.billselectlist();
        for(Bill item:p){
            System.out.println(item.getProductUnit()+"------");

 }
  //  request.getSession().setAttribute("listpro",p);
        request.setAttribute("listpro",p);
    page page = billService.BillLimit(pageIndex, pageSize);
    String s = JSON.toJSONString(page);
    response.getWriter().write(s);

}*/

    /*@ResponseBody
    //获取单页用户数据
    @RequestMapping("/getUserInfo")
    public Object getUserInfo(@RequestParam(defaultValue = "1") int pageIndex,@RequestParam(defaultValue = "2") int pageSize){
        return  userInfoService.getOnePageData(pageIndex,pageSize);
    }*/


/*
    @ResponseBody
    //获取单页用户数据
    @RequestMapping("/selectUser")
    public Object selectUser(@RequestParam(defaultValue = "1") int pageIndex,@RequestParam(defaultValue = "2") int pageSize,Bill b) throws IOException {
        System.out.println("==========================");
        if (b==null){
            System.out.println("============null");
            return  billService.BillLimit(pageIndex,pageSize);
        }else{
            System.out.println("=============no null");
            return  billService.BillLimit(pageIndex,pageSize,b);
        }
    }

    @ResponseBody
    @RequestMapping("/billLimitLike")
    public Object billLimit(String billName, String productUnit, int isPayment,@RequestParam(defaultValue = "2") int pageIndex, @RequestParam(defaultValue = "2") int pageSize) throws IOException {
        System.out.println(billName+"===========================limit"+productUnit+"===="+isPayment);
        return billService.BillBillSelect(billName,productUnit,isPayment,pageIndex,pageSize);
    }
*/
@RequestMapping("userLimit")
public String userName(HttpServletRequest request) {

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
        int count = billService.count();
        if (count % pagesize == 0) {
            totalpage = count / pagesize;
        } else {
            totalpage = count / pagesize + 1;
        }
        p.setPagetotalpages(totalpage);
        List<Bill> list = billService.BillLimit((p.getPageindex() - 1) * pagesize, p.getPagesize());
        p.setListbill(list);
        request.setAttribute("Page", p);
        List<Bill> lists=billService.billselectlist();
        request.setAttribute("list",lists);
        System.out.println("=============================");
        System.out.println(list);
    } catch (Exception e) {
        e.printStackTrace();
    }

    return "billList";

}


    //带条件的分页查询
    @RequestMapping("userLikeNameLimit")
    public String userLikeName(String productName,String productUnit,int isPayment, HttpServletRequest request) {

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
            int count = billService.count();
            if (count % pagesize == 0) {
                totalpage = count / pagesize;
            } else {
                totalpage = count / pagesize + 1;
            }
            p.setPagetotalpages(totalpage);
            List<Bill> list = billService.Billselect(productName, productUnit,isPayment,(p.getPageindex() - 1) * pagesize, p.getPagesize());
            p.setListbill(list);
            request.setAttribute("Page", p);
            request.setAttribute("username", productName);
            System.out.println(list);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "billList";

    }

}
