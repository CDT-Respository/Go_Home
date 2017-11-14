package com.home.dao;

import com.home.entity.UserInfo;
import com.home.entity.Users;

/**
 * Created by SChen on 2017/11/9.
 */
public interface UserDao {
    //用户注册
    public Users addUser(Users user);
    //查询单个用户
    public Users findUserByNo(int user_no);
    //查询用户
    public Users findUserDoLogin(String hql);

    //完善用户信息
    public boolean doUserInfo(UserInfo userinfo);

}
