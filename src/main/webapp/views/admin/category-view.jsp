<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Category</title>
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
            max-width: 800px;
            margin: 0 auto;
        }
        
        .container {
            max-width: 800px;
            margin: 30px auto;
            padding: 0 20px;
        }
        
        .detail-container {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        
        h2 {
            color: #333;
            margin-bottom: 20px;
        }
        
        .detail-row {
            margin-bottom: 20px;
            padding-bottom: 15px;
            border-bottom: 1px solid #eee;
        }
        
        .detail-row:last-child {
            border-bottom: none;
        }
        
        .detail-label {
            font-weight: bold;
            color: #555;
            margin-bottom: 5px;
        }
        
        .detail-value {
            color: #333;
            font-size: 16px;
        }
        
        .back-btn {
            display: inline-block;
            padding: 12px 30px;
            background: #667eea;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 20px;
        }
        
        .back-btn:hover {
            background: #5568d3;
        }
    </style>
</head>
<body>
    <div class="header">
        <div class="header-content">
            <h1>Category Details</h1>
        </div>
    </div>
    
    <div class="container">
        <div class="detail-container">
            <h2>${category.categoryName}</h2>
            
            <div class="detail-row">
                <div class="detail-label">Category ID:</div>
                <div class="detail-value">${category.categoryId}</div>
            </div>
            
            <div class="detail-row">
                <div class="detail-label">Category Name:</div>
                <div class="detail-value">${category.categoryName}</div>
            </div>
            
            <div class="detail-row">
                <div class="detail-label">Description:</div>
                <div class="detail-value">
                    <c:choose>
                        <c:when test="${not empty category.description}">
                            ${category.description}
                        </c:when>
                        <c:otherwise>
                            <em>No description</em>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            
            <div class="detail-row">
                <div class="detail-label">Owner:</div>
                <div class="detail-value">${category.user.fullname}</div>
            </div>
            
            <c:choose>
                <c:when test="${account.roleId == 1}">
                    <a href="${pageContext.request.contextPath}/user/home" class="back-btn">Back to List</a>
                </c:when>
                <c:when test="${account.roleId == 2}">
                    <a href="${pageContext.request.contextPath}/manager/home" class="back-btn">Back to List</a>
                </c:when>
                <c:when test="${account.roleId == 3}">
                    <a href="${pageContext.request.contextPath}/admin/home" class="back-btn">Back to List</a>
                </c:when>
            </c:choose>
        </div>
    </div>
</body>
</html>