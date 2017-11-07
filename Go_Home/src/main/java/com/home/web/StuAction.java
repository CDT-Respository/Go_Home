package com.home.web;

import com.home.entity.Stu;
import com.home.service.StuService;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by SChen on 2017/11/1.
 */
@Controller
@Scope("prototype")
@RequestMapping("/stuAction")
public class StuAction {
    @Resource
    private StuService stuService;

    @RequestMapping("/addStu")
    public String addStu(Stu stu, RedirectAttributes attr){
        if(stuService.addStu(stu)){
            attr.addAttribute("rtype","1");
        }else{
            attr.addAttribute("rtype","-1");
        }

        return "redirect:/index.jsp";
    }

    @RequestMapping("/findStuList")
    @ResponseBody
    public List findStuList(){
        return stuService.findStuList();
    }


    public void setStuService(StuService stuService) {

        this.stuService = stuService;
    }

}
