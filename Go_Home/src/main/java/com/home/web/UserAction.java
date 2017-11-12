package com.home.web;

import com.home.entity.Users;
import com.home.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * Created by SChen on 2017/11/9.
 */
@Controller
@RequestMapping("/userAction")
public class UserAction {

    @Resource(name = "userService")
    private UserService userService;

    //用户注册
    @RequestMapping("/doRegist")
    public String doRegist(Users user, Model model){
        user=userService.addUser(user);
        if(user!=null){
            model.addAttribute("registuser",user);
            return "forward:/userDInfo.jsp";
        }else{

            return "redirect:/userDoRegist.jsp?status=2";
        }
    }

    //用户登录
    @RequestMapping("/doLogin")
    public String doLogin(Users user, HttpSession session){
        user = userService.userDoLogin(user);
        if(user!=null){
            session.setAttribute("LoginUser",user);
            return "userDoInfo";
        }else{
            //登录失败返回登录页面
            return "redirect:/userDoLogin.jsp?status=0";
        }
    }


    public void setUserService(UserService userService) {
        this.userService = userService;
    }
}
