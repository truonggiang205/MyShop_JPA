<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Category Management</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: Arial, sans-serif;
            background: #f5f5f5;
        }
        
        .header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 20px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        
        .header-content {
            max-width: 1200px;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .header h1 {
            font-size: 24px;
        }
        
        .user-info {
            display: flex;
            align-items: center;
            gap: 20px;
        }
        
        .logout-btn {
            background: rgba(255,255,255,0.2);
            color: white;
            padding: 8px 20px;
            border: 1px solid white;
            border-radius: 5px;
            text-decoration: none;
            transition: background 0.3s;
        }
        
        .logout-btn:hover {
            background: rgba(255,255,255,0.3);
        }
        
        .container {
            max-width: 1200px;
            margin: 30px auto;
            padding: 0 20px;
        }
        
        .actions {
            margin-bottom: 20px;
        }
        
        .btn {
            display: inline-block;
            padding: 10px 20px;
            background: #667eea;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background 0.3s;
        }
        
        .btn:hover {
            background: #5568d3;
        }
        
        table {
            width: 100%;
            background: white;
            border-collapse: collapse;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            border-radius: 5px;
            overflow: hidden;
        }
        
        th {
            background: #667eea;
            color: white;
            padding: 15px;
            text-align: left;
        }
        
        td {
            padding: 15px;
            border-bottom: 1px solid #eee;
        }
        
        tr:hover {
            background: #f9f9f9;
        }
        
        .action-links a {
            margin-right: 10px;
            padding: 5px 10px;
            border-radius: 3px;
            text-decoration: none;
            font-size: 14px;
        }
        
        .view-link {
            background: #4CAF50;
            color: white;
        }
        
        .edit-link {
            background: #2196F3;
            color: white;
        }
        
        .delete-link {
            background: #f44336;
            color: white;
        }
        
        .no-data {
            text-align: center;
            padding: 40px;
            color: #999;
        }
    </style>
</head>
<body>
    <div class="header">
        <div class="header-content">
            <h1>Category Management System</h1>
            <div class="user-info">
                <span>Welcome, ${account.fullname} (Role: 
                    <c:choose>
                        <c:when test="${account.roleId == 1}">User</c:when>
                        <c:when test="${account.roleId == 2}">Manager</c:when>
                        <c:when test="${account.roleId == 3}">Admin</c:when>
                    </c:choose>
                )</span>
                <a href="${pageContext.request.contextPath}/logout" class="logout-btn">Logout</a>
            </div>
        </div>
    </div>
    
    <div class="container">
        <div class="actions">
            <c:choose>
                <c:when test="${account.roleId == 1}">
                    <a href="${pageContext.request.contextPath}/user/category/add" class="btn">Add New Category</a>
                </c:when>
                <c:when test="${account.roleId == 2}">
                    <a href="${pageContext.request.contextPath}/manager/category/add" class="btn">Add New Category</a>
                </c:when>
                <c:when test="${account.roleId == 3}">
                    <a href="${pageContext.request.contextPath}/admin/category/add" class="btn">Add New Category</a>
                </c:when>
            </c:choose>
        </div>
        
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Category Name</th>
                    <th>Description</th>
                    <th>Owner</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${not empty categories}">
                        <c:forEach var="category" items="${categories}">
                            <tr>
                                <td>${category.categoryId}</td>
                                <td>${category.categoryName}</td>
                                <td>${category.description}</td>
                                <td>${category.user.fullname}</td>
                                <td class="action-links">
                                    <c:choose>
                                        <c:when test="${account.roleId == 1}">
                                            <a href="${pageContext.request.contextPath}/user/category/view?id=${category.categoryId}" class="view-link">View</a>
                                            <c:if test="${category.user.userId == account.userId}">
                                                <a href="${pageContext.request.contextPath}/user/category/edit?id=${category.categoryId}" class="edit-link">Edit</a>
                                                <a href="${pageContext.request.contextPath}/user/category/delete?id=${category.categoryId}" 
                                                   class="delete-link" onclick="return confirm('Are you sure?')">Delete</a>
                                            </c:if>
                                        </c:when>
                                        <c:when test="${account.roleId == 2}">
                                            <a href="${pageContext.request.contextPath}/manager/category/view?id=${category.categoryId}" class="view-link">View</a>
                                            <a href="${pageContext.request.contextPath}/manager/category/edit?id=${category.categoryId}" class="edit-link">Edit</a>
                                            <a href="${pageContext.request.contextPath}/manager/category/delete?id=${category.categoryId}" 
                                               class="delete-link" onclick="return confirm('Are you sure?')">Delete</a>
                                        </c:when>
                                        <c:when test="${account.roleId == 3}">
                                            <a href="${pageContext.request.contextPath}/admin/category/view?id=${category.categoryId}" class="view-link">View</a>
                                            <a href="${pageContext.request.contextPath}/admin/category/edit?id=${category.categoryId}" class="edit-link">Edit</a>
                                            <a href="${pageContext.request.contextPath}/admin/category/delete?id=${category.categoryId}" 
                                               class="delete-link" onclick="return confirm('Are you sure?')">Delete</a>
                                        </c:when>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="5" class="no-data">No categories found</td>
                        </tr>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
    </div>
</body>
</html>