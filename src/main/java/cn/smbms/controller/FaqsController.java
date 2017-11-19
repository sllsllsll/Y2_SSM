package cn.smbms.controller;

import cn.smbms.entity.Bookcategory;
import cn.smbms.entity.faqs;
import cn.smbms.service.IFaqsService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Date;
import java.util.List;

/**
 * Created by linlin on 2017/9/1.
 */
@Controller
public class FaqsController {
    @Resource(name="faqsService")
    private IFaqsService Ifservice;

    @ResponseBody
    @RequestMapping("/first")
    public Object userlisthh(String title){
        System.out.println(title);
        return Ifservice.selectListLike(title);
    }



    @RequestMapping("/ListALL01")
    public String UserLimits(HttpServletRequest request) throws IOException {
   List<faqs> list=Ifservice.selectListAll();
        request.setAttribute("listL",list);
        return "/List01";
    }
    @RequestMapping("/addList")
    public String addList(faqs f, HttpServletRequest request){
     f.setCreatedate(new Date());
    int i=Ifservice.addList(f);
        if (i > 0) {
            System.out.println("添加成功");
            return "redirect:/ListALL01";
        }
        return "/add01";
    }

    @RequestMapping("/ListLikeA")
    public String ListLikeA(String title,HttpServletRequest request) throws IOException {
        List<faqs> list=Ifservice.selectListLike(title);
        request.setAttribute("listL",list);
        return "/List01";
    }


    @RequestMapping("/ListViews")
    public String ListView(String title,HttpServletRequest request) throws IOException {
        faqs ff=Ifservice.ListView(title);
        request.setAttribute("listf",ff);
        return "/IDView01";
    }

    @RequestMapping("/cate")
    public String getcate(HttpServletRequest request){
        List<Bookcategory> list=Ifservice.getCateById(0);
        request.setAttribute("listcates",list);
        return "/easyui";
    }

}
