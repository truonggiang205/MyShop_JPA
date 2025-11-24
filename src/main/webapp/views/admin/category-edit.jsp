<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Category</title>
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
        
        .form-container {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        
        h2 {
            color: #333;
            margin-bottom: 20px;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        label {
            display: block;
            margin-bottom: 5px;
            color: #555;
            font-weight: bold;
        }
        
        input[type="text"],
        textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
            font-family: Arial, sans-serif;
        }
        
        textarea {
            min-height: 100px;
            resize: vertical;
        }
        
        input:focus,
        textarea:focus {
            outline: none;
            border-color: #667eea;
        }
        
        .button-group {
            display: flex;
            gap: 10px;
        }
        
        button,
        .back-btn {
            padding: 12px 30px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            text-align: center;
        }
        
        button[type="submit"] {
            background: #667eea;
            color: white;
        }
        
        button[type="submit"]:hover {
            background: #5568d3;
        }
        
        .back-btn {
            background: #6c757d;
            color: white;
        }
        
        .back-btn:hover {
            background: #5a6268;
        }
    </style>
</head>
<body>
    <div class="header">
        <div class="header-content">
            <h1>Add New Category</h1>
        </div>
    </div>
    
    <div class="container">
        <div class="form-container">
            <h2>Category Information</h2>
            
            <form action="" method="post">
                <div class="form-group">
                    <label for="categoryname">Category Name:</label>
                    <input type="text" id="categoryname" name="categoryname" required>
                </div>
                
                <div class="form-group">
                    <label for="description">Description:</label>
                    <textarea id="description" name="description"></textarea>
                </div>
                
                <div class="button-group">
                    <button type="submit">Save</button>
                    <c:choose>
                        <c:when test="${account.roleId == 1}">
                            <a href="${pageContext.request.contextPath}/user/home" class="back-btn">Cancel</a>
                        </c:when>
                        <c:when test="${account.roleId == 2}">
                            <a href="${pageContext.request.contextPath}/manager/home" class="back-btn">Cancel</a>
                        </c:when>
                        <c:when test="${account.roleId == 3}">
                            <a href="${pageContext.request.contextPath}/admin/home" class="back-btn">Cancel</a>
                        </c:when>
                    </c:choose>
                </div>
            </form>
        </div>
    </div>
</body>
</html>