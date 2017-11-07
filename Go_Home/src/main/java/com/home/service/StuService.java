package com.home.service;

import com.home.dao.StuDao;
import com.home.entity.Stu;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by SChen on 2017/11/1.
 */
@Service("stuService")
@Transactional(propagation = Propagation.REQUIRED)
public class StuService {
    @Resource
    private StuDao stuDao;

    public boolean addStu(Stu stu){
        return stuDao.addStu(stu);
    }

    public List findStuList(){
        return stuDao.findStuList("from Stu");
    }

    public void setStuDao(StuDao stuDao) {
        this.stuDao = stuDao;
    }
}
