package com.home.dao.impl;

import com.home.dao.BaseDao;
import com.home.dao.GoHomeInfoDao;
import com.home.entity.GoHomeInfo;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by SChen on 2017/11/15.
 */
@Repository("goHomeInfoDao")
public class GoHomeInfoDaoImpl extends BaseDao implements GoHomeInfoDao {

    //添加信息
    @Override
    public boolean addGoHomeInfo(GoHomeInfo goHomeInfo) {
        try{
            getSession().save(goHomeInfo);
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }

    //查出信息
    @Override
    public List findAllGoHomeInfo(String sql) {
        return getSession().createSQLQuery(sql).list();
    }

}
