package com.ncu.web.bbs.pojo;

import java.io.Serializable;
import java.sql.Timestamp;

public class commentList implements Serializable {
    private int id;
    private String context;//内容
    private Timestamp time_comment;//评论时间
    private String nickName;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context;
    }

    public Timestamp getTime_comment() {
        return time_comment;
    }

    public void setTime_comment(Timestamp time_comment) {
        this.time_comment = time_comment;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }
}
