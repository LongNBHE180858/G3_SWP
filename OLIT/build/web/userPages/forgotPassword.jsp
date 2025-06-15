<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Change password</title>
    <link href="${pageContext.request.contextPath}/userPages/assets/css/main.css" rel="stylesheet">
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background: linear-gradient(to right, #dfe9f3, #ffffff);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .login-container {
            background-color: #ffffff;
            padding: 35px 30px;
            border-radius: 12px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 420px;
            text-align: center;
        }

        .login-container h2 {
            margin-bottom: 25px;
            color: #222;
            font-size: 22px;
        }

        .input-field {
            width: 100%;
            padding: 14px 12px;
            margin: 12px 0;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
            transition: border 0.3s ease;
        }

        .input-field:focus {
            outline: none;
            border-color: #54b7e7;
            box-shadow: 0 0 5px rgba(84, 183, 231, 0.4);
        }

        .button {
            width: 100%;
            padding: 13px;
            background-color: #54b7e7;
            color: white;
            font-size: 16px;
            font-weight: 600;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            margin-top: 15px;
            transition: background-color 0.3s ease;
        }

        .button:hover {
            background-color: #409fd1;
        }

        p {
            margin-top: 15px;
            font-size: 14px;
            color: red;
        }

    </style>
    <%
    String email = request.getParameter("email");
%>
</head>
<body>
    <div class="login-container">

        <form action="/OLIT/ForgotPassword" method="post">
            <h2>Set Your Password</h2>
            <input type="text" name="email" class="input-field" placeholder="Email" required>
            <input type="password" name="password" class="input-field" placeholder="New Password" required>
            <input type="password" name="confirmPassword" class="input-field" placeholder="Confirm Password" required>
            <button type="submit" class="button">Set Password</button>
            <p style="color:red">${error}</p>
        </form>
    </div>
</body>
</html>
