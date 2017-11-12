package com.home.entity;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * Created by SChen on 2017/11/9.
 */
@Entity
@Table(name = "tb_gohomeinfo")
public class GoHomeInfo implements Serializable {

    private int gohomeinfo_no;                   //编号
    private String gohomeinfo_name;              //姓名
    private String gohomeinfo_sex;               //性别
    private String gohomeinfo_age;               //年龄
    private Date gohomeinfo_losstime;           //走失时间
    private String gohomeinfo_lossaddress;      //走失地点
    private String gohomeinfo_detailedinfo;     //详细描述
    private int gohomeinfo_type;                 //类型：1：宝贝寻家 2：家寻宝贝
    private int gohomeinfo_status;               //状态：1：成功回家 2：还未找到

    public GoHomeInfo() {
    }

    public GoHomeInfo(int gohomeinfo_no, String gohomeinfo_name, String gohomeinfo_sex, String gohomeinfo_age, Date gohomeinfo_losstime, String gohomeinfo_lossaddress, String gohomeinfo_detailedinfo, int gohomeinfo_type, int gohomeinfo_status) {
        this.gohomeinfo_no = gohomeinfo_no;
        this.gohomeinfo_name = gohomeinfo_name;
        this.gohomeinfo_sex = gohomeinfo_sex;
        this.gohomeinfo_age = gohomeinfo_age;
        this.gohomeinfo_losstime = gohomeinfo_losstime;
        this.gohomeinfo_lossaddress = gohomeinfo_lossaddress;
        this.gohomeinfo_detailedinfo = gohomeinfo_detailedinfo;
        this.gohomeinfo_type = gohomeinfo_type;
        this.gohomeinfo_status = gohomeinfo_status;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getGohomeinfo_no() {
        return gohomeinfo_no;
    }

    public void setGohomeinfo_no(int gohomeinfo_no) {
        this.gohomeinfo_no = gohomeinfo_no;
    }

    public String getGohomeinfo_name() {
        return gohomeinfo_name;
    }

    public void setGohomeinfo_name(String gohomeinfo_name) {
        this.gohomeinfo_name = gohomeinfo_name;
    }

    public String getGohomeinfo_sex() {
        return gohomeinfo_sex;
    }

    public void setGohomeinfo_sex(String gohomeinfo_sex) {
        this.gohomeinfo_sex = gohomeinfo_sex;
    }

    public String getGohomeinfo_age() {
        return gohomeinfo_age;
    }

    public void setGohomeinfo_age(String gohomeinfo_age) {
        this.gohomeinfo_age = gohomeinfo_age;
    }

    public Date getGohomeinfo_losstime() {
        return gohomeinfo_losstime;
    }

    public void setGohomeinfo_losstime(Date gohomeinfo_losstime) {
        this.gohomeinfo_losstime = gohomeinfo_losstime;
    }

    public String getGohomeinfo_lossaddress() {
        return gohomeinfo_lossaddress;
    }

    public void setGohomeinfo_lossaddress(String gohomeinfo_lossaddress) {
        this.gohomeinfo_lossaddress = gohomeinfo_lossaddress;
    }

    public String getGohomeinfo_detailedinfo() {
        return gohomeinfo_detailedinfo;
    }

    public void setGohomeinfo_detailedinfo(String gohomeinfo_detailedinfo) {
        this.gohomeinfo_detailedinfo = gohomeinfo_detailedinfo;
    }

    public int getGohomeinfo_type() {
        return gohomeinfo_type;
    }

    public void setGohomeinfo_type(int gohomeinfo_type) {
        this.gohomeinfo_type = gohomeinfo_type;
    }

    public int getGohomeinfo_status() {
        return gohomeinfo_status;
    }

    public void setGohomeinfo_status(int gohomeinfo_status) {
        this.gohomeinfo_status = gohomeinfo_status;
    }
}
