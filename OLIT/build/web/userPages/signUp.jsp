<%-- 
    Document   : sigUp
    Created on : May 30, 2025, 1:58:56 PM
    Author     : Long0
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sign Up</title>
    <link href="${pageContext.request.contextPath}/userPages/assets/css/main.css" rel="stylesheet">
</head>
<body>
    <div class="login-container">
        <form action="/OLIT/SignupServlet" method="post">
            <input type="text" class="input-field" name="fullName" placeholder="Full Name" required>

            <label for="gender">Gender</label>
            <select name="gender" class="input-field" required>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
                <option value="Other" selected>Other</option>
            </select>

            <input type="email" class="input-field" name="email" placeholder="Email" required>
            <input type="tel" class="input-field" name="phone" placeholder="Phone Number" required>

            <button type="submit" class="button">Sign up</button>

            <c:if test="${param.status == 'emailExists'}">
                <p style="color: red;">Email đã tồn tại hoặc không hợp lệ!</p>
            </c:if>
            <c:if test="${param.status == 'phoneExists'}">
                <p style="color: red;">Số điện thoại đã tồn tại!</p>
            </c:if>
            <c:if test="${param.status == 'success'}">
                <p style="color: green;">Hệ thống đã gửi link xác nhận qua email!</p>
            </c:if>
        </form>
    </div>
</body>
</html>
