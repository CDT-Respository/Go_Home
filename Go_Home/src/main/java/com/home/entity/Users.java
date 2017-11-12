package com.home.entity;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.List;

/**
 * Created by SChen on 2017/11/9.
 */
@Entity
@Table(name = "tb_users")
public class Users implements Serializable {
    private int user_no;
    @NotNull(message = "用户名不能为空")
    @Size(min = 6,message = "用户名最少6位")
    private String user_loginname;
    @NotNull(message = "密码不能为空")
    @Size(min = 6,message = "密码最少6位")
    private String user_loginpwd;

    //用户--》用户信息
    private UserInfo user_info;

    //用户--》用户发布的信息
    private List<GoHomeInfo> gohomeinfoList;

    public Users() {
    }

    public Users(int user_no, String user_loginname, String user_loginpwd) {
        this.user_no = user_no;
        this.user_loginname = user_loginname;
        this.user_loginpwd = user_loginpwd;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getUser_no() {
        return user_no;
    }

    public void setUser_no(int user_no) {
        this.user_no = user_no;
    }

    public String getUser_loginname() {
        return user_loginname;
    }

    public void setUser_loginname(String user_loginname) {
        this.user_loginname = user_loginname;
    }

    public String getUser_loginpwd() {
        return user_loginpwd;
    }

    public void setUser_loginpwd(String user_loginpwd) {
        this.user_loginpwd = user_loginpwd;
    }

    @OneToOne(optional = true,cascade = CascadeType.ALL,mappedBy = "user_login")
    public UserInfo getUser_info() {
        return user_info;
    }

    public void setUser_info(UserInfo user_info) {
        this.user_info = user_info;
    }

    @OneToMany(cascade=CascadeType.ALL)
    @JoinColumn(name="gohomeinfo_no")
    public List<GoHomeInfo> getGohomeinfoList() {
        return gohomeinfoList;
    }

    public void setGohomeinfoList(List<GoHomeInfo> gohomeinfoList) {
        this.gohomeinfoList = gohomeinfoList;
    }
}
