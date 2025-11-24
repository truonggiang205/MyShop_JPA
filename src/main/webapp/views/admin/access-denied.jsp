<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Access Denied</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        
        .container {
            background: white;
            padding: 50px;
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
            text-align: center;
            max-width: 500px;
        }
        
        .error-icon {
            font-size: 80px;
            color: #f44336;
            margin-bottom: 20px;
        }
        
        h1 {
            color: #333;
            margin-bottom: 20px;
            font-size: 32px;
        }
        
        p {
            color: #666;
            margin-bottom: 30px;
            font-size: 16px;
            line-height: 1.6;
        }
        
        .btn-group {
            display: flex;
            gap: 15px;
            justify-content: center;
        }
        
        a {
            padding: 12px 30px;
            text-decoration: none;
            border-radius: 5px;
            font-size: 16px;
            transition: transform 0.2s;
        }
        
        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }
        
        .btn-secondary {
            background: #6c757d;
            color: white;
        }
        
        a:hover {
            transform: translateY(-2px);
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="error-icon">🚫</div>
        <h1>Access Denied</h1>
        <p>You don't have permission to access this page. Please contact administrator if you believe this is an error.</p>
        
        <div class="btn-group">
            <c:choose>
                <c:when test="${not empty account}">
                    <c:choose>
                        <c:when test="${account.roleId == 1}">
                            <a href="${pageContext.request.contextPath}/user/home" class="btn-primary">Go to Dashboard</a>
                        </c:when>
                        <c:when test="${account.roleId == 2}">
                            <a href="${pageContext.request.contextPath}/manager/home" class="btn-primary">Go to Dashboard</a>
                        </c:when>
                        <c:when test="${account.roleId == 3}">
                            <a href="${pageContext.request.contextPath}/admin/home" class="btn-primary">Go to Dashboard</a>
                        </c:when>
                    </c:choose>
                    <a href="${pageContext.request.contextPath}/logout" class="btn-secondary">Logout</a>
                </c:when>
                <c:otherwise>
                    <a href="${pageContext.request.contextPath}/login" class="btn-primary">Login</a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</body>
</html>