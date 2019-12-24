package com.ncu.web.bbs.entity;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Date;

@Entity
@Table(name = "article")
public class article {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name = "title")
    private String title;//标题
    @Column(name = "summary")
    private String summary;//摘要
    @Column(name = "content")
    private String context;//内容
    @Column(name = "time")
    private Date time;//发布时间
    @Column(name = "praise_points")
    private int praise_points;//点赞数
    @Column(name = "comment")
    private int comment;//评论数
    @Column(name = "category_id")
    private int category_id;//文章类型
    @Column(name = "keyword")
    private String keyword;//关键字
    @Column(name = "istop")
    private int isTop;//是否置顶
    @Column(name = "time_istop")
    private  long time_isTop;//置顶时间
    @Column(name = "authorid")
    private int authorID;//作者ID

    @Override
    public String toString() {
        return "article{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", summary='" + summary + '\'' +
                ", context='" + context + '\'' +
                ", time=" + time +
                ", praise_points=" + praise_points +
                ", comment=" + comment +
                ", category_id=" + category_id +
                ", keyword='" + keyword + '\'' +
                ", isTop='" + isTop + '\'' +
                ", time_isTop=" + time_isTop +
                ", authorID=" + authorID +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public int getPraise_points() {
        return praise_points;
    }

    public void setPraise_points(int praise_points) {
        this.praise_points = praise_points;
    }

    public int getComment() {
        return comment;
    }

    public void setComment(int comment) {
        this.comment = comment;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }



    public void setIsTop(int isTop) {
        this.isTop = isTop;
    }

    public int getIsTop() {
        return isTop;
    }

    public long getTime_isTop() {
        return time_isTop;
    }

    public void setTime_isTop(long time_isTop) {
        this.time_isTop = time_isTop;
    }

    public int getAuthorID() {
        return authorID;
    }

    public void setAuthorID(int authorID) {
        this.authorID = authorID;
    }
}
