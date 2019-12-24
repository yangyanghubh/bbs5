package com.ncu.web.bbs.entity;

import javax.persistence.*;

@Entity
@Table(name = "category")
public class category {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;//类型id
    @Column(name = "name")
    private String name;//类型名
    @Column(name = "description")
    private String description;//描述

    @Override
    public String toString() {
        return "category{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                '}'+"\n";
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
