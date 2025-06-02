<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Đổi mật khẩu</title>
    <link href="${pageContext.request.contextPath}/userPages/assets/css/main.css" rel="stylesheet">
</head>
<body>
    <div class="login-container">
        <h2>Đổi mật khẩu</h2>

        <c:if test="${param.status == 'success'}">
            <p style="color: green;">Đổi mật khẩu thành công! Bạn có thể đăng nhập lại.</p>
        </c:if>
        <c:if test="${param.status == 'fail'}">
            <p style="color: red;">Đã xảy ra lỗi. Vui lòng thử lại.</p>
        </c:if>

        <form action="/OLIT/ResetPasswordServlet" method="post">
            <input type="hidden" name="email" value="${param.email}" />
            <input type="password" name="newPassword" class="input-field" placeholder="Nhập mật khẩu mới">
            <button type="submit" class="button">Đổi mật khẩu</button>
        </form>
    </div>
</body>
</html>
