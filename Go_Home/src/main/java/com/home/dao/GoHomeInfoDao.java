package com.home.dao;

import com.home.entity.GoHomeInfo;

import java.util.List;

/**
 * Created by SChen on 2017/11/15.
 */
public interface GoHomeInfoDao {
    //用户发布信息
    public boolean addGoHomeInfo(GoHomeInfo goHomeInfo);
    //查询信息
    public List findAllGoHomeInfo(String hql);
}
