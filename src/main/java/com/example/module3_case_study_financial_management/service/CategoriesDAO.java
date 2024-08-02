package com.example.module3_case_study_financial_management.service;

import com.example.module3_case_study_financial_management.model.Categories;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategoriesDAO implements ICategories {
    private String jdbcUrl = "jdbc:mysql://localhost:3306/quan_ly_tai_chinh/Categories";
    private String jdbcUsername = "root";
    private String jdbcPassword = "12345@abc";

    private static final String SELECT_ALL_CATEGORIES = "SELECT * FROM Categories;";
    private static final String INSERT_CATEGORY_SQL = "INSERT INTO Categories (User_Id, Name, Note, Create_At, Update_At) VALUES (?, ?, ?, ?, ?);";
    private static final String SELECT_CATEGORY_BY_ID = "SELECT * FROM Categories WHERE Category_Id = ?;";
    private static final String DELETE_CATEGORY_SQL = "DELETE FROM Categories WHERE Category_Id = ?;";
    private static final String UPDATE_CATEGORY_SQL = "UPDATE Categories SET User_Id = ?, Name = ?, Note = ?, Update_At = ? WHERE Category_Id = ?;";

    public CategoriesDAO() {
    }

    protected Connection getConnection() {
        Connection connection = null;
        try {
            connection = DriverManager.getConnection(jdbcUrl, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }

    @Override
    public List<Categories> selectAllCategories() {
        List<Categories> categories = new ArrayList<>();
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CATEGORIES)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int categoryId = rs.getInt("Category_Id");
                int userId = rs.getInt("User_Id");
                String name = rs.getString("Name");
                String note = rs.getString("Note");
                Timestamp createAt = rs.getTimestamp("Create_At");
                Timestamp updateAt = rs.getTimestamp("Update_At");
                categories.add(new Categories(categoryId, userId, name, note, createAt, updateAt));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return categories;
    }

    @Override
    public void addCategories(Categories categories) throws SQLException {
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CATEGORY_SQL)) {
            preparedStatement.setInt(1, categories.getUserId());
            preparedStatement.setString(2, categories.getName());
            preparedStatement.setString(3, categories.getNote());
            preparedStatement.setTimestamp(4, categories.getCreateAt());
            preparedStatement.setTimestamp(5, categories.getUpdateAt());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    @Override
    public Categories selectCategories(int id) {
        return null;
    }

    @Override
    public boolean updateCategories(Categories categories) throws SQLException {
        return false;
    }

    @Override
    public boolean deleteCategories(int id) throws SQLException {
        return false;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}