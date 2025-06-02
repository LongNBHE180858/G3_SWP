<%-- 
    Document   : login
    Created on : May 27, 2025, 12:49:24 PM
    Author     : Long0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>

        <link href="${pageContext.request.contextPath}/userPages/assets/css/main.css" rel="stylesheet">

    </head>
    <body>
        <div class="login-container">
            <form action="${pageContext.request.contextPath}/Login" method="post">
                <input type="email" class="input-field" name="email" placeholder="Enter Your Email">
                <input type="password" class="input-field" name="password" placeholder="Enter Your Password">
                <c:if test="${not empty err}">
                    <p class="err">${err}</p>
                </c:if>
                <div class="links">
                    <a href="${pageContext.request.contextPath}/userPages/forgotPassword.jsp">Forgot Password ?</a>
                    <a href="${pageContext.request.contextPath}/userPages/signUp.jsp">Sign up</a>
                </div>
                <button type="submit" class="button">Sign in</button>
            </form>
        </div>
    </body>
</html>
