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
            * {
                box-sizing: border-box;
            }
            
            html {
                margin: 0;
                padding: 0;
            }
            
            body {
                font-family: Arial, sans-serif;
                background-color: #f5f5f5;
                margin: 0;
                padding: 0;
            }
            
            .header {
                background-color: #1e88e5;
                color: white;
                padding: 15px 40px;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .header .logo {
                font-size: 22px;
                font-weight: bold;
            }

            .header .nav {
                display: flex;
                align-items: center;
                gap: 20px;
            }

            .header .nav a {
                color: white;
                text-decoration: none;
                font-size: 16px;
            }

            .header .nav a:hover {
                text-decoration: underline;
            }
            
            .profile-container {
                display: flex;
                max-width: 700px;
                margin: auto;
                background: white;
                border-radius: 8px;
                box-shadow: 0 0 8px rgba(0,0,0,0.1);
                overflow: hidden;
                margin-top: 50px;
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
                font-weight: bold;
                cursor: pointer;
                border-radius: 4px;
                transition: background-color 0.3s ease;
                text-decoration: none;
            }
            .btn-change:hover {
                background-color: #e6e6e6;
            }
            
            .btn-change-1 {
                background-color: white;
                color: #007bff;
                border: none;
                padding: 10px 16px;
                font-weight: bold;
                cursor: pointer;
                border-radius: 4px;
                transition: background-color 0.3s ease;
                text-decoration: none;
            }
            .btn-change-1:hover {
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
            input[readonly] {
                pointer-events: none;
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
            
            .modal {
                display: none;
                position: fixed;
                z-index: 1000;
                left: 0; top: 0;
                width: 100%; height: 100%;
                background-color: rgba(0,0,0,0.5);
              }
              .modal-content {
                background-color: white;
                margin: 10% auto;
                padding: 20px;
                border-radius: 8px;
                width: 500px;
                position: relative;
              }
              .close {
                position: absolute;
                top: 10px; right: 15px;
                font-size: 20px;
                cursor: pointer;
              }
        </style>
    </head>
    <body>
        <div class="header">
            <div class="logo">Online Course</div>
            <div class="nav">
                <a href="${pageContext.request.contextPath}/HomeServlet">Home</a>
                <a href="${pageContext.request.contextPath}/MyRegistration">Course</a>
                <a href="${pageContext.request.contextPath}/BlogListServlet">Blog</a>
                <c:choose>
                    <c:when test="${not empty sessionScope.userID}">
                        <a href="${pageContext.request.contextPath}/Logout">Logout</a>
                        <a href="${pageContext.request.contextPath}/UserProfile">
                            <img src="https://img.tripi.vn/cdn-cgi/image/width=700,height=700/https://gcs.tripi.vn/public-tripi/tripi-feed/img/482744KVW/anh-mo-ta.png" alt="Avatar" class="avatar" style="width:40px; height:40px; border-radius:50%;">
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/Login">Login</a>
                        <a href="${pageContext.request.contextPath}/Register">Register</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
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
                    <!-- Avatar và nút mở modal -->
                    <div class="left-panel">
                        <img src="${empty account.urlAvatar ? 'https://i.pravatar.cc/150' : account.urlAvatar}" 
                             alt="Avatar" class="avatar" id="avatarImg" />
                        <br />
                        <button type="button" class="btn-change-1" onclick="openModal()">Chỉnh sửa thông tin</button>
                    </div>

                    <!-- Right Panel - Hiển thị thông tin không chỉnh sửa -->
                    <div class="right-panel">
                        <div class="form-group">
                            <label>Họ và tên</label>
                            <input type="text" value="${account.fullName}" readonly />
                        </div>
                        <div class="form-group">
                            <label>Ngày sinh</label>
                            <input type="date" value="${account.birthday}" readonly />
                        </div>
                        <div class="form-group">
                            <label>Số điện thoại</label>
                            <input type="tel" value="${account.phoneNumber}" readonly />
                        </div>
                        <div class="form-group">
                            <label>Email</label>
                            <input type="email" value="${account.email}" readonly />
                        </div>
                        <div class="form-group">
                            <label>Giới tính</label>
                            <input type="text" value="${account.gender}" readonly />
                        </div>

                        <div style="margin-top: 20px;">
                            <a href="userPages/ResetPassword.jsp?email=${account.email}" class="btn-change">Đổi mật khẩu</a>
                        </div>
                    </div>

            </c:when>
            <c:otherwise>
                <p>Không tìm thấy thông tin người dùng!</p>
            </c:otherwise>
        </c:choose>
                
        <div id="editModal" class="modal">
            <div class="modal-content">
              <span class="close" onclick="closeModal()">&times;</span>
              <form method="post" action="EditUserProfile">
                  <div class="form-group">
                      <label>Họ và tên</label>
                      <input type="text" name="fullName" value="${account.fullName}" required />
                  </div>
                  <div class="form-group">
                      <label>Ngày sinh</label>
                      <input type="date" name="birthday" value="${account.birthday}" required />
                  </div>
                  <div class="form-group">
                      <label>Số điện thoại</label>
                      <input type="tel" name="phoneNumber" value="${account.phoneNumber}" required />
                  </div>
                  <div class="form-group">
                      <label>Email</label>
                      <input type="email" value="${account.email}" readonly />
                  </div>
                  <div class="form-group">
                      <label>Giới tính</label>
                      <div class="gender-group">
                          <label><input type="radio" name="gender" value="Male" <c:if test="${account.gender == 'Male'}">checked</c:if>> Nam</label>
                          <label><input type="radio" name="gender" value="Female" <c:if test="${account.gender == 'Female'}">checked</c:if>> Nữ</label>
                          <label><input type="radio" name="gender" value="Other" <c:if test="${account.gender != 'Male' && account.gender != 'Female'}">checked</c:if>> Khác</label>
                      </div>
                  </div>
                  <div style="margin-top: 20px;">
                      <button type="submit" class="btn-change">Lưu thay đổi</button>
                  </div>
              </form>
            </div>
          </div>

                <script>
                    function openModal() {
                        document.getElementById("editModal").style.display = "block";
                    }
                    function closeModal() {
                        document.getElementById("editModal").style.display = "none";
                    }
                    window.onclick = function(event) {
                      const modal = document.getElementById("editModal");
                      if (event.target == modal) {
                        closeModal();
                      }
                    }
                </script>
    </body>
</html>

