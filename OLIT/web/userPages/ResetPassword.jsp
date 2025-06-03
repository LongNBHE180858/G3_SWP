<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Đổi mật khẩu</title>
    <link href="${pageContext.request.contextPath}/userPages/assets/css/main.css" rel="stylesheet">
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        body {
            background-color: #f0f2f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-container {
            background-color: #fff;
            padding: 30px 25px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 420px;
            text-align: center;
        }

        .login-container h2 {
            margin-bottom: 20px;
            color: #333;
        }

        .input-field {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
        }

        .button {
            width: 100%;
            padding: 12px;
            background-color: #54b7e7;
            color: white;
            font-size: 15px;
            font-weight: bold;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            margin-top: 10px;
        }

        .button:hover {
            background-color: #409fd1;
        }

        p {
            margin-bottom: 15px;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <div class="login-container">

        <form action="/OLIT/ResetPasswordServlet" method="post">
        <h2>Đổi mật khẩu</h2>
            <input name="email" value="${param.email}" class="input-field" />
            <input type="password" name="newPassword" class="input-field" placeholder="Nhập mật khẩu mới">
            <input type="password" name="confirmPassword" class="input-field" placeholder="Xác minh mật khẩu">
            <button type="submit" class="button">Đổi mật khẩu</button>
            
        <c:if test="${param.status == 'success'}">
            <p style="color: green;">Đổi mật khẩu thành công! Bạn có thể đăng nhập lại.</p>
        </c:if>
        <c:if test="${param.status == 'fail'}">
            <p style="color: red;">Đã xảy ra lỗi. Vui lòng thử lại.</p>
        </c:if>

        </form>
    </div>
</body>
</html>
