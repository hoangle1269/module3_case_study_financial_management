package com.example.module3_case_study_financial_management.service;

import com.example.module3_case_study_financial_management.model.Categories;

import java.sql.SQLException;
import java.util.List;

public interface ICategories {
    public List<Categories> selectAllCategories();

    public void addCategories(Categories categories) throws SQLException;

    public Categories selectCategories(int id);

    public boolean updateCategories(Categories categories) throws SQLException;

    public boolean deleteCategories(int id) throws SQLException;
}
