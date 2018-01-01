package com.home.service;

import com.home.entity.UserInfo;
import com.home.entity.Users;

import java.util.Map;

/**
 * Created by SChen on 2017/11/9.
 */
public interface UserService {
    //处理用户登录
    public Map userDoLogin(Users user);
    //用户注册
    public Users addUser(Users user);
    //完善用户的个人信息
    public boolean doUserInfo(UserInfo userinfo,int user_no);
    //用修改个人信息
    public boolean doUpdateUserInfo(UserInfo userinfo,int user_no);
    //用户查看自己信息
    public UserInfo seeMyInfo(int user_no);
}
