<%-- 
    Document   : forgotPassword
    Created on : May 30, 2025, 1:50:49 PM
    Author     : Long0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reset Password</title>
        
        <link href="${pageContext.request.contextPath}/userPages/assets/css/main.css" rel="stylesheet">

    </head>
    <body>
        <div class="login-container">
            <form action="/OLIT/SendVerificationServlet" method="post">
                <h2>Reset your password</h2>
                <p>Please enter the email address you’d like your password reset information sent to</p>
                <input type="email" class="input-field" name="email" placeholder="Enter Your Email">
                <button type="submit" class="button">Request reset link</button>
            </form>
        </div>
    </body>Z
</html>