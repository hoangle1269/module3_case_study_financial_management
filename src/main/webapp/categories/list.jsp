<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Categories Management </title>
</head>
<body>
<center>
    <h1>Categories Management</h1>
</center>
<div align="center">
    <table border="1" cellpadding="5">
        <caption><h2>List of Categories</h2></caption>
        <tr>
            <th>Category Id</th>
            <th>User Id</th>
            <th>Name</th>
            <th>Note</th>
            <th>Date Created</th>
            <th>Update Created</th>
        </tr>
        <c:forEach var="categories" items="${listCategories}">
            <tr>
                <td><c:out value="${categories.category_id}"/></td>
                <td><c:out value="${categories.user_id}"/></td>
                <td><c:out value="${categories.name}"/></td>
                <td><c:out value="${categories.note}"/></td>
                <td><c:out value="${categories.create_at}"/></td>
                <td><c:out value="${categories.update_at}"/></td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>