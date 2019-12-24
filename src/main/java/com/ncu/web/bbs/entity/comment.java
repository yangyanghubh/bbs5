package com.ncu.web.bbs.entity;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "comment")
public class comment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "user_id")
    private int user_id;//用户名id,评论者
    @Column(name = "article_id")
    private String article_id;//评论的文章id
    @Column(name = "content")
    private String context;//内容
    @Column(name = "time_comment")
    private Timestamp time_comment;//评论时间
    @Column(name = "status")
    private int status;//评论状态

    @Override
    public String toString() {
        return "comment{" +
                "id=" + id +
                ", user_id=" + user_id +
                ", article_id='" + article_id + '\'' +
                ", context='" + context + '\'' +
                ", time_comment=" + time_comment +
                ", status=" + status +
                '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        comment comment = (comment) o;

        return id == comment.id;
    }

    @Override
    public int hashCode() {
        return id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getArticle_id() {
        return article_id;
    }

    public void setArticle_id(String article_id) {
        this.article_id = article_id;
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

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
