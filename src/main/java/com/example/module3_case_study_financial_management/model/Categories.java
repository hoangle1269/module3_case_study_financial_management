package com.example.module3_case_study_financial_management.model;

import java.sql.Timestamp;

public class Categories {
    private int categoryId;
    private int userId;
    private String name;
    private String note;
    private Timestamp createAt;
    private Timestamp updateAt;

    // Constructor
    public Categories(int categoryId, int userId, String name, String note, Timestamp createAt, Timestamp updateAt) {
        this.categoryId = categoryId;
        this.userId = userId;
        this.name = name;
        this.note = note;
        this.createAt = createAt;
        this.updateAt = updateAt;
    }

    // Getters and Setters
    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public Timestamp getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Timestamp createAt) {
        this.createAt = createAt;
    }

    public Timestamp getUpdateAt() {
        return updateAt;
    }

    public void setUpdateAt(Timestamp updateAt) {
        this.updateAt = updateAt;
    }

    // toString method
    @Override
    public String toString() {
        return "Categories{" +
                "categoryId=" + categoryId +
                ", userId=" + userId +
                ", name='" + name + '\'' +
                ", note='" + note + '\'' +
                ", createAt=" + createAt +
                ", updateAt=" + updateAt +
                '}';
    }
}
