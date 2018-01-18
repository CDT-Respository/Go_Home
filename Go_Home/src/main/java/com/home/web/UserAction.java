package com.home.web;

import com.home.entity.UserInfo;
import com.home.entity.Users;
import com.home.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

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
            return "redirect:/userDoRegist.jsp?status=2";
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
    public String doLogin(Users user, HttpSession session,Model model){
        if(user!=null) {
            Map map = userService.userDoLogin(user);
            user = (Users) map.get("user");
            int isDoInfo = (int) map.get("userIsDoInfo");
            //如果用户不为空且不需要完善信息，直接去到主页
            if (user != null && isDoInfo == 1) {
                session.setAttribute("LoginUser", user);
                return "redirect:/index.jsp";
            } else if (user != null && isDoInfo == 2) {//登录成功，但是信息未完善
                //去到完善信息页面
                model.addAttribute("doinfouser", user);
                return "forward:/userDoInfo.jsp";
            } else {
                return "redirect:/userDoLogin.jsp?status=0";
            }
        }
        return "redirect:/userDoLogin.jsp?status=0";
    }

    //用户完善个人信息
    @RequestMapping("/doInfo")
    public String doInfo(@Valid UserInfo userinfo, BindingResult result, MultipartFile imgfile, int user_no, Model model, HttpSession session) {
        System.out.println(1);
        if (result.hasErrors()) {//如果有错误，返回完善信息页面
            List<ObjectError> list = result.getAllErrors();
            for (ObjectError err : list) {
                System.out.println(err.getCode() + ":" + err.getDefaultMessage());
            }
            model.addAttribute("backUserinfo", userinfo);
            model.addAttribute("doinfouser.user_no", user_no);
            return "redirect:/userDoInfo.jsp?doinfostatus=2";
        } else {
            if (!imgfile.isEmpty()) {
                //获取服务器路径
                String basePath = session.getServletContext().getRealPath("/images");
                String realName = imgfile.getOriginalFilename();//真实上传的文件名
                System.out.println("要上传的文件名是:" + realName);
                //执行上传操作
                try {
                    //文件名根据时间区分
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
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
                    //完善个人信息失败
                    return "redirect:/userDoInfo.jsp?doinfostatus=2";
                }
            }
            //用户上传图片失败，重新完善信息
            return "redirect:/userDoInfo.jsp?doinfostatus=2";
        }
    }


    //用户个人信息的查看
    @RequestMapping("/seeMyInfo")
    public String findUserInfo(@ModelAttribute(name="user_no") int user_no, HttpSession session){
        UserInfo userinfo=userService.seeMyInfo(user_no);
        session.setAttribute("MySelfInfo",userinfo);
        return "redirect:/MyInfo.jsp";
    }

    //用户个人信息的修改
    @RequestMapping("/doUpdateInfo")
    public String doUpdateInfo(@Valid UserInfo userinfo, BindingResult result, MultipartFile imgfile, int user_no, Model model, HttpSession session,String a,RedirectAttributes attr) {
        System.out.println(userinfo.getUserinfo_no()+","+user_no);
        attr.addFlashAttribute("user_no",user_no);
        if (result.hasErrors()) {//如果有错误，返回个人信息页面
//            List<ObjectError> list = result.getAllErrors();//获取错误
//            for (ObjectError err : list) {//遍历错误
//                System.out.println(err.getCode() + ":" + err.getDefaultMessage());
//            }
//            //保存到model 传到页面
//            model.addAttribute("backUserinfo", userinfo);
//            model.addAttribute("doinfouser.user_no", user_no);
            //重定向到
            return "redirect:/userAction/seeMyInfo";
        } else {//没有错误就进行文件判断
            if (imgfile.isEmpty()) {
                userinfo.setUserinfo_image(a.substring(10,a.length()));
            }else{//如果用户没有选择信息图片，用老图片
                //获取服务器路径
                String basePath = session.getServletContext().getRealPath("/images");
                String realName = imgfile.getOriginalFilename();//真实上传的文件名
                System.out.println("要上传的文件名是:" + realName);
                //执行上传操作
                try {
                    // 定义文件名，文件名根据时间区分
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
                    String d = sdf.format(new Date());
                    imgfile.transferTo(new File(basePath + "/" + d + realName));
                    userinfo.setUserinfo_image("images/" + d + realName);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            if (userService.doUpdateUserInfo(userinfo, user_no)) {
                //修改个人信息成功
                return "redirect:/userAction/seeMyInfo";
            } else {
                //修改个人信息失败
                return "redirect:/userAction/seeMyInfo";
            }
        }
    }

    @RequestMapping("/cancellationUser")
    public String cancellationUser(HttpSession session){
        session.removeAttribute("LoginUser");
        return "userDoLogin";
    }


    public void setUserService(UserService userService) {
        this.userService = userService;
    }
}