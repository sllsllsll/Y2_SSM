package cn.smbms.controller;

import cn.smbms.entity.classes;
import cn.smbms.service.IClassesService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by linlin on 2017/9/1.
 */
@Controller
public class ClassesController {
    @Resource(name="classService")
    private IClassesService claserver;

    @RequestMapping("/classIDName")
    public String classIDName(HttpServletRequest request){
        List<classes> list=claserver.selectIDName();
        request.setAttribute("listclass",list);
        return "/add01";
    }
}
