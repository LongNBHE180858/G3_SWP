<%-- 
    Document   : home
    Created on : May 30, 2025, 2:31:57 PM
    Author     : Long0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <%
            if (session == null) {
                out.println("<p>⚠️ Session không tồn tại</p>");
            } else {
                out.println("<p>✅ Session tồn tại</p>");
                out.println("<p>User ID: " + session.getAttribute("userID") + "</p>");
                out.println("<p>Role ID: " + session.getAttribute("roleID") + "</p>");
                out.println("<p>Email: " + session.getAttribute("userEmail") + "</p>");
            }
        %>
        
        <a href="${pageContext.request.contextPath}/UserProfile">
            <img src="${pageContext.request.contextPath}/images/avatar.png" alt="Avatar" style="width:40px; height:40px; border-radius:50%;">
        </a>
    <a href="${pageContext.request.contextPath}/MyRegistration">Registration</a>
    </head>
    <body>
        <h1>This is home</h1>
    </body>
</html>
