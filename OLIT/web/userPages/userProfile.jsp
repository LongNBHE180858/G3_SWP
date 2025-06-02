<%-- 
    Document   : userProfile
    Created on : Jun 2, 2025, 8:50:38 PM
    Author     : NAM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8" />
        <title>User Profile</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 30px;
                background-color: #f5f5f5;
            }
            .profile-container {
                display: flex;
                max-width: 700px;
                margin: auto;
                background: white;
                border-radius: 8px;
                box-shadow: 0 0 8px rgba(0,0,0,0.1);
                overflow: hidden;
            }
            .left-panel {
                width: 250px;
                background-color: #007bff;
                color: white;
                padding: 20px;
                text-align: center;
            }
            .avatar {
                width: 150px;
                height: 150px;
                border-radius: 50%;
                object-fit: cover;
                border: 4px solid white;
                margin-bottom: 15px;
            }
            .btn-change {
                background-color: white;
                color: #007bff;
                border: none;
                padding: 10px 16px;
                font-weight: bold;
                cursor: pointer;
                border-radius: 4px;
                transition: background-color 0.3s ease;
            }
            .btn-change:hover {
                background-color: #e6e6e6;
            }

            .right-panel {
                flex: 1;
                padding: 25px 40px;
            }
            .form-group {
                margin-bottom: 15px;
            }
            label {
                display: block;
                margin-bottom: 6px;
                font-weight: 600;
                color: #333;
            }
            input[type="text"],
            input[type="email"],
            input[type="date"],
            input[type="tel"] {
                width: 100%;
                padding: 8px 10px;
                font-size: 14px;
                border: 1.5px solid #ccc;
                border-radius: 4px;
                transition: border-color 0.3s ease;
            }
            input[type="text"]:focus,
            input[type="email"]:focus,
            input[type="date"]:focus,
            input[type="tel"]:focus {
                border-color: #007bff;
                outline: none;
            }

            .gender-group {
                display: flex;
                gap: 20px;
                align-items: center;
            }
            .gender-group label {
                font-weight: normal;
                color: #555;
                cursor: pointer;
            }
            .gender-group input {
                margin-right: 5px;
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <c:choose>
            <c:when test="${not empty account}">

                <!-- Hiển thị thông báo nếu có -->
                <c:if test="${not empty sessionScope.message}">
                    <div class="${sessionScope.messageType == 'success' ? 'message-success' : 'message-error'}">
                        ${sessionScope.message}
                    </div>
                    <c:remove var="message" scope="session" />
                    <c:remove var="messageType" scope="session" />
                </c:if> 
                <div class="profile-container">
                    <div class="left-panel">
                        <img src="${empty account.urlAvatar ? 'https://i.pravatar.cc/150' : account.urlAvatar}" 
                             alt="Avatar" class="avatar" id="avatarImg" />
                        <br />
                        <!-- Bằng đoạn mới sau -->
                        <button type="submit" form="profileForm" class="btn-change">Thay đổi thông tin</button>
                    </div>

                    <div class="right-panel">
                        <form id="profileForm" method="post" action="EditUserProfile">
                            <div class="form-group">
                                <label for="name">Họ và tên</label>
                                <input type="text" id="name" name="fullName" value="${account.fullName}" required />
                            </div>
                            <div class="form-group">
                                <label for="birthday">Ngày sinh</label>
                                <input type="date" id="birthday" name="birthday" value="${account.birthday}" required />
                            </div>
                            <div class="form-group">
                                <label for="phone">Số điện thoại</label>
                                <input type="tel" id="phone" name="phoneNumber" value="${account.phoneNumber}" required />
                            </div>
                            <div class="form-group">
                                <label>Email</label>
                                <input type="email" id="email" name="email" value="${account.email}" readonly />
                            </div>
                            <div class="form-group">
                                <label>Giới tính</label>
                                <div class="gender-group">
                                    <label>
                                        <input type="radio" name="gender" value="Male" <c:if test="${account.gender == 'Male'}">checked</c:if> /> Nam
                                        </label>
                                        <label>
                                            <input type="radio" name="gender" value="Female" <c:if test="${account.gender == 'Female'}">checked</c:if> /> Nữ
                                        </label>
                                        <label>
                                            <input type="radio" name="gender" value="other" <c:if test="${account.gender != 'Male' && account.gender != 'Female'}">checked</c:if> /> Khác
                                        </label>
                                    </div>
                                </div>

                                <div style="margin-top: 20px;">
                                    <button type="submit" class="btn-change">Thay đổi thông tin</button>
                                </div>
                            </form>
                        </div>
                    </div>
            </c:when>
            <c:otherwise>
                <p>Không tìm thấy thông tin người dùng!</p>
            </c:otherwise>
        </c:choose>
    </body>
</html>

