<%-- 
    Document   : sigUp
    Created on : May 30, 2025, 1:58:56 PM
    Author     : Long0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link href="${pageContext.request.contextPath}/userPages/assets/css/main.css" rel="stylesheet">

    </head>
    <body>
        <div class="login-container">
            <form action="Login" method="post">
                <input type="email" class="input-field" name="userEmail" placeholder="Enter Your Email">
                <input type="password" class="input-field" name="userPassword" placeholder="Enter Your Password">
                <div class="links">
                    <a href="${pageContext.request.contextPath}/userPages/forgotPassword.jsp">Forgot Password ?</a>
                    <a href="signUp.jsp">Sign up</a>
                </div>
                <button type="submit" class="button">Sign in</button>
            </form>
        </div>
    </body>
</html>
