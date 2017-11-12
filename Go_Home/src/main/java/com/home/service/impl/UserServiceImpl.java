package com.home.service.impl;

import com.home.dao.UserDao;
import com.home.entity.Users;
import com.home.service.UserService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

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
    public Users userDoLogin(Users user) {
        //根据用户名和密码查询
        String hql="from Users u where u.user_loginname='"+user.getUser_loginname()+"' and u.user_loginpwd='"+user.getUser_loginpwd()+"'";
        //登录成功返回对象，否则返回null
        return userDao.findUserDoLogin(hql);
    }

    //处理用户注册
    @Override
    public Users addUser(Users user) {
        return null;
    }


    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }
}
