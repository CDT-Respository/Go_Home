package com.home.service.impl;

import com.home.dao.GoHomeInfoDao;
import com.home.dao.UserDao;
import com.home.entity.GoHomeInfo;
import com.home.entity.Users;
import com.home.service.GoHomeInfoService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by SChen on 2017/12/21.
 */
@Service("goHomeInfoService")
@Transactional(propagation = Propagation.REQUIRED)
public class GoHomeInfoServiceImpl implements GoHomeInfoService {

    @Resource(name = "goHomeInfoDao")
    private GoHomeInfoDao goHomeInfoDao;
    @Resource(name = "userDao")
    private UserDao userDao;

    //发布走失信息
    @Override
    public boolean doGoHomeInfo(GoHomeInfo goHomeInfo,int user_no) {
        Users user=userDao.findUserByNo(user_no);
        goHomeInfo.setMyuser(user);
        return goHomeInfoDao.addGoHomeInfo(goHomeInfo);
    }

    //用户查询自己发布的信息
    @Override
    public List findGoHomeInfo(int userno) {
        return null;
    }


    @Override
    public List findGoHomeInfo(int thispage, String sheng, String shi, String qu,int thistype) {
        int start=thispage*6-6;
        String sql="select g.gohomeinfo_image,g.gohomeinfo_name,g.gohomeinfo_age,g.gohomeinfo_lossaddress,u.user_no,g.gohomeinfo_no from tb_gohomeinfo g,tb_users u where g.myuser_user_no=u.user_no and g.gohomeinfo_type="+thistype+" limit "+start+",6";
        if(sheng!=null&&!sheng.equals("undefined")&&sheng.length()>0&&shi!=null&&!shi.equals("undefined")&&shi.length()>0&&qu!=null&&!qu.equals("undefined")&&qu.length()>0){
            sql="select g.gohomeinfo_image,g.gohomeinfo_name,g.gohomeinfo_age,g.gohomeinfo_lossaddress,u.user_no,g.gohomeinfo_no from " +
                    "tb_gohomeinfo g,tb_users u where g.myuser_user_no=u.user_no and g.gohomeinfo_type="+thistype+" and (g.gohomeinfo_lossaddress like '%"+sheng+"%' " +
                    "or g.gohomeinfo_lossaddress like '%"+shi+"%' " +
                    "or g.gohomeinfo_lossaddress like '%"+qu+"%') " +
                    "  limit "+start+",6";
        }else if(sheng!=null&&!sheng.equals("undefined")&&sheng.length()>0&&shi!=null&&!shi.equals("undefined")&&shi.length()>0){
            sql="select g.gohomeinfo_image,g.gohomeinfo_name,g.gohomeinfo_age,g.gohomeinfo_lossaddress,u.user_no,g.gohomeinfo_no from " +
                    "tb_gohomeinfo g,tb_users u where (g.myuser_user_no=u.user_no and g.gohomeinfo_type="+thistype+" and (g.gohomeinfo_lossaddress like '%"+sheng+"%')) " +
                    "or (g.myuser_user_no=u.user_no and g.gohomeinfo_type="+thistype+" and (g.gohomeinfo_lossaddress like '%"+shi+"%')) " +
                    "  limit "+start+",6";
        }else if(sheng!=null&&!sheng.equals("undefined")&&sheng.length()>0){
            sql="select g.gohomeinfo_image,g.gohomeinfo_name,g.gohomeinfo_age,g.gohomeinfo_lossaddress,u.user_no,g.gohomeinfo_no from " +
                    "tb_gohomeinfo g,tb_users u where (g.myuser_user_no=u.user_no and g.gohomeinfo_type="+thistype+" and (g.gohomeinfo_lossaddress like '%"+sheng+"%')) " +
                    "  limit "+start+",6";
        }
        return goHomeInfoDao.findAllGoHomeInfo(sql);
    }


    @Override
    public List findGoHomeInfoCount(String sheng,String shi,String qu,int thistype) {
        String sql="select count(*) from tb_gohomeinfo t where t.gohomeinfo_type = "+thistype;
        if(sheng!=null&&!sheng.equals("undefined")&&sheng.length()>0&&shi!=null&&!shi.equals("undefined")&&shi.length()>0&&qu!=null&&!qu.equals("undefined")&&qu.length()>0){
            sql = "select count(*) from tb_gohomeinfo t where t.gohomeinfo_type="+thistype+" and (t.gohomeinfo_lossaddress like '%"+sheng+"%' " +
                    " or t.gohomeinfo_lossaddress like '%"+shi+"%'" +
                    " or t.gohomeinfo_lossaddress like '%"+qu+"%')";
        }else if(sheng!=null&&!sheng.equals("undefined")&&sheng.length()>0&&shi!=null&&!shi.equals("undefined")&&shi.length()>0){
            sql = "select count(*) from tb_gohomeinfo t where t.gohomeinfo_type="+thistype+" and (t.gohomeinfo_lossaddress like '%"+sheng+"%' " +
                    " or t.gohomeinfo_lossaddress like '%"+shi+"%')" ;
        }else if(sheng!=null&&!sheng.equals("undefined")&&sheng.length()>0){
            sql = "select count(*) from tb_gohomeinfo t where t.gohomeinfo_type="+thistype+" and t.gohomeinfo_lossaddress like '%"+sheng+"%' " ;
        }
        return goHomeInfoDao.findAllGoHomeInfo(sql);
    }

    @Override
    public List findGoHomeAllInfo(int info_user_no, int gohomeinfo_no) {
        String sql="select * from tb_gohomeinfo g,tb_userinfo u where g.myuser_user_no=u.login_no="+info_user_no+" and g.gohomeinfo_no="+gohomeinfo_no;
        return goHomeInfoDao.findAllGoHomeInfo(sql);
    }


    public void setGoHomeInfoDao(GoHomeInfoDao goHomeInfoDao) {
        this.goHomeInfoDao = goHomeInfoDao;
    }

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }
}
