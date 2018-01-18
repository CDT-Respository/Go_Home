package com.home.entity;

import org.hibernate.validator.constraints.Range;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import java.io.Serializable;

/**
 * Created by SChen on 2017/11/9.
 */
@Entity
@Table(name = "tb_userinfo")
public class UserInfo implements Serializable {
    private int userinfo_no;
    @NotNull(message = "姓名不能为空")
    private String userinfo_name;
    @Range(min = 0,max = 100,message = "请输入正确的年龄")
    private int userinfo_age;
    private String userinfo_sex;
    @Pattern(regexp = "^1[34578]\\d{9}$",message = "请输入正确的手机号码")
    private String userinfo_tel;
    @Pattern(regexp = "^(\\d{18})|(\\d{17}(x|X))$",message = "请输入正确的身份证号码")
    private String userinfo_code;
    private String userinfo_image;
    @NotNull(message = "请输入详细地址")
    private String userinfo_address;

    private Users user_login;

    public UserInfo() {
    }

    public UserInfo(int userinfo_no, String userinfo_name, int userinfo_age, String userinfo_sex, String userinfo_tel, String userinfo_code, String userinfo_image, String userinfo_address) {
        this.userinfo_no = userinfo_no;
        this.userinfo_name = userinfo_name;
        this.userinfo_age = userinfo_age;
        this.userinfo_sex = userinfo_sex;
        this.userinfo_tel = userinfo_tel;
        this.userinfo_code = userinfo_code;
        this.userinfo_image = userinfo_image;
        this.userinfo_address = userinfo_address;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getUserinfo_no() {
        return userinfo_no;
    }

    public void setUserinfo_no(int userinfo_no) {
        this.userinfo_no = userinfo_no;
    }

    public String getUserinfo_name() {
        return userinfo_name;
    }

    public void setUserinfo_name(String userinfo_name) {
        this.userinfo_name = userinfo_name;
    }

    public String getUserinfo_tel() {
        return userinfo_tel;
    }

    public void setUserinfo_tel(String userinfo_tel) {
        this.userinfo_tel = userinfo_tel;
    }

    public String getUserinfo_code() {
        return userinfo_code;
    }

    public void setUserinfo_code(String userinfo_code) {
        this.userinfo_code = userinfo_code;
    }

    public String getUserinfo_image() {
        return userinfo_image;
    }

    public void setUserinfo_image(String userinfo_image) {
        this.userinfo_image = userinfo_image;
    }

    public String getUserinfo_address() {
        return userinfo_address;
    }

    public void setUserinfo_address(String userinfo_address) {
        this.userinfo_address = userinfo_address;
    }

    public int getUserinfo_age() {
        return userinfo_age;
    }

    public void setUserinfo_age(int userinfo_age) {
        this.userinfo_age = userinfo_age;
    }

    public String getUserinfo_sex() {
        return userinfo_sex;
    }

    public void setUserinfo_sex(String userinfo_sex) {
        this.userinfo_sex = userinfo_sex;
    }

    @OneToOne(optional = true,cascade = CascadeType.ALL)
    @JoinColumn(name = "login_no")
    public Users getUser_login() {
        return user_login;
    }

    public void setUser_login(Users user_login) {
        this.user_login = user_login;
    }
}
