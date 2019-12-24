package com.ncu.web.bbs.entity;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

@Entity
@DynamicUpdate
@DynamicInsert
@Table(name = "user")
public class user {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "username")
    private String username;//用户名
    @Column(name = "password")
    private String password;//密码
    @Column(name = "nickname")
    private String nickname;//昵称
    @Column(name = "signature")
    private String signature;//个性签名
    @Column(name = "sculpture")
    private String sculpture;//头像
    @Column(name = "tel")
    private String tel;//电话
    @Column(name = "email")
    private String email;//邮箱
    @Column(name = "integral")
    private String integral;//积分数
    @Column(name = "nature")
    private String nature;//工作性质
    @Column(name = "position")
    private String position;//工作地点
    @Column(name = "status")
    private String status;

    @Override
    public String toString() {
        return "user{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", nickname='" + nickname + '\'' +
                ", signature='" + signature + '\'' +
                ", sculpture='" + sculpture + '\'' +
                ", tel='" + tel + '\'' +
                ", email='" + email + '\'' +
                ", integral='" + integral + '\'' +
                ", nature='" + nature + '\'' +
                ", position='" + position + '\'' +
                ", status='" + status + '\'' +
                '}';
    }

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

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature;
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

    public String getIntegral() {
        return integral;
    }

    public void setIntegral(String integral) {
        this.integral = integral;
    }

    public String getNature() {
        return nature;
    }

    public void setNature(String nature) {
        this.nature = nature;
    }

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
