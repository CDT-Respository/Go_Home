package com.home.web;

import com.home.entity.UserInfo;
import com.home.entity.Users;
import com.home.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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
    public String doRegist(@Valid Users user, BindingResult result, Model model){

        if(result.hasErrors()){//如果有错误，返回注册页面，带回注册信息
            List<ObjectError> list=result.getAllErrors();
            for(ObjectError err:list){
                System.out.println(err.getCode()+":"+err.getDefaultMessage());
            }
            model.addAttribute("backUser",user);
            return "userDoRegist";
        }else{//注册信息没错误，进行注册操作
            user=userService.addUser(user);
            if(user!=null){//注册成功，跳到完善信息页面
                model.addAttribute("doinfouser",user);
                return "forward:/userDoInfo.jsp";
            }else{//注册失败，重定向到注册页面，带回错误消息
                return "redirect:/userDoRegist.jsp?status=2";
            }
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

    //用户完善个人信息
    @RequestMapping("/doInfo")
    public String doInfo(@Valid UserInfo userinfo, BindingResult result, MultipartFile imgfile, int user_no, Model model, HttpSession session) {
        if (result.hasErrors()) {//如果有错误，返回完善信息页面
            List<ObjectError> list = result.getAllErrors();
            for (ObjectError err : list) {
                System.out.println(err.getCode() + ":" + err.getDefaultMessage());
            }
            model.addAttribute("backUserinfo", userinfo);
            model.addAttribute("doinfouser.user_no", user_no);
            return "forward:/userDoInfo.jsp";
        } else {
            if (!imgfile.isEmpty()) {
                //获取服务器路径
                String basePath = session.getServletContext().getRealPath("/images");
                String realName = imgfile.getOriginalFilename();//真实上传的文件名
                System.out.println("要上传的文件名是:" + realName);
                //执行上传操作
                try {
                    //文件名根据时间区分
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
                    String d = sdf.format(new Date());
                    System.out.println(d);
                    imgfile.transferTo(new File(basePath + "/" + d + realName));
                    userinfo.setUserinfo_image("images/" + d + realName);
                } catch (IOException e) {
                    e.printStackTrace();
                }
                if (userService.doUserInfo(userinfo, user_no)) {
                    //完善个人信息成功，重定向到登录界面，带消息
                    return "redirect:/userDoLogin.jsp?doinfostatus=1";
                } else {
                    return "";
                }
            }
            return null;
        }
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }
}