<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Forgot Password</title>
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            width: 100%;
            max-width: 420px;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        h2 {
            margin-top: 0;
            margin-bottom: 10px;
            text-align: center;
            color: #333;
        }

        p {
            font-size: 14px;
            text-align: center;
            color: #666;
            margin-bottom: 20px;
        }

        input[type="email"] {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
        }

        button {
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

        button:hover {
            background-color: #409fd1;
        }

        .msg {
            color: red;
            margin-top: 15px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <c:choose>
            <c:when test="${not empty message}">
                <h2>Reset Requested</h2>
                <p class="success-msg">${message}</p>
            </c:when>
            <c:otherwise>
                <form action="/OLIT/SendVerificationServlet" method="post">
                    <h2>Reset your password</h2>
                    <p>Please enter the email address you’d like your password reset information sent to</p>
                    <input type="email" name="email" placeholder="Enter Your Email" required>
                    <button type="submit">Request reset link</button>
                    <div class="msg">${message}</div>
                </form>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>
