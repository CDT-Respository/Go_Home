package com.home.dao.impl;

import com.home.dao.BaseDao;
import com.home.dao.UserDao;
import com.home.entity.UserInfo;
import com.home.entity.Users;
import org.springframework.stereotype.Repository;

/**
 * Created by SChen on 2017/11/9.
 */
@Repository("userDao")
public class UserDaoImpl extends BaseDao implements UserDao {

    //用户注册（返回信息）
    @Override
    public Users addUser(Users user) {
        return getSession().get(Users.class,getSession().save(user));
    }

    //根据user_no查询用户信息
    @Override
    public Users findUserByNo(int user_no) {
        return getSession().get(Users.class,user_no);
    }

    //查询用户
    @Override
    public Users findUserDoLogin(String hql) {
        return (Users) getSession().createQuery(hql).uniqueResult();
    }

    //完善个人信息
    @Override
    public boolean doUserInfo(UserInfo userinfo) {
        try{
            getSession().save(userinfo);
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }
            return false;
    }
}
