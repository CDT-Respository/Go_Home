package com.home.service.impl;

import com.home.dao.UserDao;
import com.home.entity.UserInfo;
import com.home.entity.Users;
import com.home.service.UserService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by SChen on 2017/11/9.
 */
@Service("userService")
@Transactional(propagation = Propagation.REQUIRED)
public class UserServiceImpl implements UserService {

    @Resource(name = "userDao")
    private UserDao userDao;

    //处理用户登录
    @Override
    public Map userDoLogin(Users user) {
        Map map=new HashMap();
        //根据用户名和密码查询
        String hql="from Users u where u.user_loginname='"+user.getUser_loginname()+"' and u.user_loginpwd='"+user.getUser_loginpwd()+"'";
        //用户名密码是否正确
        user=userDao.findUserDoLogin(hql);
        System.out.println(user.getUser_no()+","+user.getUser_loginname());
        //用户名密码正确，查询出对应的用户详细信息
        if(user!=null){
            map.put("user",user);
            UserInfo userInfo=user.getUser_info();
            //如果用户的详细信息不为空，则带回1,（不用去到完善信息页面）
            if(userInfo!=null){
                map.put("userIsDoInfo",1);
            }else{//用户信息不完善，带回2
                map.put("userIsDoInfo",2);
            }
        }else{//如果用户名密码不正确，带回2：返回登录页面
            map.put("userIsDoInfo",3);
        }
        return map;
    }

    //处理用户注册
    @Override
    public Users addUser(Users user) {
        return userDao.addUser(user);
    }

    //完善用户个人信息的方法
    @Override
    public boolean doUserInfo(UserInfo userinfo, int user_no) {
        //根据userno查询用户信息
        Users user=userDao.findUserByNo(user_no);
        //给信息绑定用户
        userinfo.setUser_login(user);
        return userDao.doUserInfo(userinfo);
    }

    //用户修改个人信息的方法
    @Override
    public boolean doUpdateUserInfo(UserInfo userinfo, int user_no) {
        //先保存一次，以免和回话连接内冲突
        userDao.updateUserInfo(userinfo);
        //根据userno查询用户信息
        Users user=userDao.findUserByNo(user_no);
        //给信息绑定用户
        userinfo.setUser_login(user);
        return userDao.updateUserInfo(userinfo);
    }

    @Override
    public UserInfo seeMyInfo(int user_no) {
        //获取到用户登录编号，根据登录编号查询用户信息
        Users user=userDao.findUserByNo(user_no);
        UserInfo userInfo=userDao.findUserInfoByUno(user.getUser_info().getUserinfo_no());
        return userInfo;
    }


    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }
}
