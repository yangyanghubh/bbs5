package com.ncu.web.bbs.entity;

import javax.persistence.*;

@Entity
@Table(name = "admin")
public class admin {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "username")
    private String username;//管理用户名
    @Column(name = "password")
    private String password;//密码
    @Column(name = "limitation")
    private int limitation;//权限
    @Column(name = "sculpture")
    private String sculpture;//头像
    @Column(name = "tel")
    private String tel;//电话
    @Column(name = "email")
    private String email;//邮箱

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getLimitation() {
        return limitation;
    }

    public void setLimitation(String limitation) {
        this.limitation = Integer.parseInt(limitation);
    }

    public String getSculpture() {
        return sculpture;
    }

    public void setSculpture(String sculpture) {
        this.sculpture = sculpture;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "jsp{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", limitation=" + limitation +
                ", sculpture='" + sculpture + '\'' +
                ", tel='" + tel + '\'' +
                ", email='" + email + '\'' +
                '}';
    }
}
