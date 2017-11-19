package cn.smbms.controller;

import cn.smbms.entity.Provider;
import cn.smbms.service.IProService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

/**
 * Created by linlin on 2017/9/9.
 */
@Controller
public class ProController {

    @Resource(name = "proservice")
    IProService proservice;

    @RequestMapping("/showProLimit")
    public String showProLimit() {
        return "providerList";
    }

    @ResponseBody
    //获取单页用户数据
    @RequestMapping("/getProInfo")
    public Object getProInfo(@RequestParam(defaultValue = "1") int pageIndex, @RequestParam(defaultValue = "2") int pageSize){
        System.out.println("=========================");
        return  proservice.getOnePageData(pageIndex,pageSize);
    }

    @ResponseBody
    //获取单页用户数据
    @RequestMapping("/selectPro")
    public Object selectPro(@RequestParam(defaultValue = "1") int pageIndex,@RequestParam(defaultValue = "2") int pageSize,Provider info){
        if (info==null){
            return  proservice.getOnePageData(pageIndex,pageSize);
        }else{
            return  proservice.getOnePageData(pageIndex,pageSize,info);
        }
    }
}


