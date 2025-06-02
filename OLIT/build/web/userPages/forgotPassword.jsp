<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Forgot Password</title>
    <style>
        body { font-family: Arial; background: #f0f0f0; box-sizing: border-box; }
        .container { width: 400px; margin: 80px auto; padding: 20px; background: white; border-radius: 8px; box-sizing: border-box; }
        input { width: 93%; padding: 10px; margin: 8px 0; }
        button { width: 100%; padding: 10px; background: #54b7e7; color: white; border: none; }
        .msg { color: red; margin-top: 10px; }
    </style>
</head>
<body>
    <div class="container">
        <form method="post" action="ResetPasswordServlet">
            <h2>Forgot Password</h2>
            <input type="email" name="email" placeholder="Enter your email" required>

            <button type="submit" formaction="${pageContext.request.contextPath}/SendVerificationServlet">Send Verification Code</button>

            <input type="text" name="code" placeholder="Enter verification code">
            <input type="password" name="newPassword" placeholder="Enter new password">

            <button type="submit">Change Password</button>

            <div class="msg">${message}</div>
        </form>
    </div>
</body>
</html>
