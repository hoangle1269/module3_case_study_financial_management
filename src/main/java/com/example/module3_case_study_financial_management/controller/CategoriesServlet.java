package com.example.module3_case_study_financial_management.controller;

import com.example.module3_case_study_financial_management.model.Categories;
import com.example.module3_case_study_financial_management.service.CategoriesDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

@WebServlet(name = "categoriesServlet", urlPatterns = "/categories")
public class CategoriesServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CategoriesDAO categoriesDAO;

    public void init() {
        categoriesDAO = new CategoriesDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        try {
            switch (action) {
                case "add":
                    addCategories(request, response);
                    break;
                default:
                    listCategories(request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "add":
                    showAddForm(request, response);
                    break;
                default:
                    listCategories(request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void listCategories(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        List<Categories> categoriesList = categoriesDAO.selectAllCategories();
        request.setAttribute("listCategories", categoriesList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("categories/list.jsp");
        dispatcher.forward(request, response);
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("categories/add.jsp");
        dispatcher.forward(request, response);
    }

    private void addCategories(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int userId = Integer.parseInt(request.getParameter("user_id"));
        String name = request.getParameter("name");
        String note = request.getParameter("note");

        Categories newCategory = new Categories(0, userId, name, note, new Timestamp(System.currentTimeMillis()), new Timestamp(System.currentTimeMillis()));
        categoriesDAO.addCategories(newCategory);
        response.sendRedirect("categories?action=list");
    }
}
