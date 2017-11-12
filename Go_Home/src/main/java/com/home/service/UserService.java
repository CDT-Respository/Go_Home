package com.home.service;

import com.home.entity.Users;

/**
 * Created by SChen on 2017/11/9.
 */
public interface UserService {
    //处理用户登录
    public Users userDoLogin(Users user);
    //用户注册
    public Users addUser(Users user);
}
