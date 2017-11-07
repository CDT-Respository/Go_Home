package com.home.dao;

import com.home.entity.Stu;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by SChen on 2017/11/1.
 */
@Repository("stuDao")
public class StuDao extends BaseDao {
    public boolean addStu(Stu stu){
        getSession().save(stu);
        return true;
    }

    public List findStuList(String hql){
        return getSession().createQuery(hql).list();
    }
}
