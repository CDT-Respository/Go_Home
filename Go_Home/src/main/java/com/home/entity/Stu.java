package com.home.entity;

import javax.persistence.*;

/**
 * Created by SChen on 2017/11/1.
 */
@Entity
@Table(name="tb_stu")
public class Stu {
    private int sno;
    private String sname;

    public Stu() {
    }

    public Stu(int sno, String sname) {
        this.sno = sno;
        this.sname = sname;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getSno() {
        return sno;
    }

    public void setSno(int sno) {
        this.sno = sno;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }
}
