package com.home.service;

import com.home.entity.GoHomeInfo;

import java.util.List;

/**
 * Created by SChen on 2017/12/21.
 */
public interface GoHomeInfoService {
    //用户发布信息
    public boolean doGoHomeInfo(GoHomeInfo goHomeInfo,int user_no);
    //用户查询自己发布的信息
    public List findGoHomeInfo(int userno);
    //用户查看所有信息（根据省市区）
    public List findGoHomeInfo(int thispage,String sheng,String shi,String qu,int thistype);
    //查询所有信息总条数
    public List findGoHomeInfoCount(String sheng,String shi,String qu,int thistype);
    //查看回家信息详情
    public List findGoHomeAllInfo(int info_user_no,int gohomeinfo_no);
}
