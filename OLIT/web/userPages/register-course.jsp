<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Register Course</title>
        <style>
            body {
                font-family: 'Segoe UI', sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f4f4f4;
            }
            .overlay {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0,0,0,0.6);
                display: flex;
                align-items: center;
                justify-content: center;
                z-index: 1000;
            }
            .popup {
                background: #fff;
                width: 400px;
                padding: 30px 25px;
                border-radius: 10px;
                box-shadow: 0 10px 25px rgba(0,0,0,0.2);
                animation: fadeIn 0.3s ease-in-out;
            }
            @keyframes fadeIn {
                from {
                    opacity: 0;
                    transform: scale(0.95);
                }
                to {
                    opacity: 1;
                    transform: scale(1);
                }
            }
            .popup h2 {
                text-align: center;
                color: #1e88e5;
                margin-bottom: 20px;
            }
            .form-group {
                margin-bottom: 15px;
            }
            label {
                display: block;
                font-weight: 500;
                margin-bottom: 5px;
                color: #333;
            }
            select,
            input[type="text"],
            input[type="email"],
            input[type="tel"] {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 6px;
                font-size: 14px;
                transition: border-color 0.3s;
            }
            select:focus,
            input:focus {
                border-color: #1e88e5;
                outline: none;
            }
            .gender-group {
                display: flex;
                gap: 15px;
                margin-top: 5px;
            }
            .gender-group label {
                font-weight: normal;
            }
            .button-group {
                display: flex;
                justify-content: space-between;
                margin-top: 25px;
            }
            .btn {
                padding: 10px 20px;
                font-size: 15px;
                border: none;
                border-radius: 6px;
                cursor: pointer;
                transition: background 0.3s;
            }
            .btn-register {
                background-color: #1e88e5;
                color: white;
            }
            .btn-register:hover {
                background-color: #1565c0;
            }
            .btn-cancel {
                background-color: #e0e0e0;
                color: #333;
            }
            .btn-cancel:hover {
                background-color: #c2c2c2;
            }
            input[readonly] {
                background-color: #f0f0f0;
                cursor: not-allowed;
            }
        </style>
    </head>
    <body>

        <div class="overlay">
            <div class="popup">
                <h2>Register Course</h2>
                <form action="registerCourse" method="post">
                    <!-- Gửi kèm Course ID nếu cần -->
                    <input type="hidden" name="courseID" value="${param.courseID}" />

                    <div class="form-group">
                        <label for="package">Choose Price Package</label>
                        <select id="package" name="package" required>
                            <option value="">-- Select Package --</option>
                            <option value="basic">Basic - $50</option>
                            <option value="standard">Standard - $100</option>
                            <option value="premium">Premium - $150</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="fullName">Full Name</label>
                        <input type="text" id="fullName" name="fullName"
                               value="${sessionScope.fullAccount != null ? sessionScope.fullAccount.fullName : ''}"
                               ${sessionScope.fullAccount != null ? 'readonly' : ''} required>
                    </div>

                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" id="email" name="email"
                               value="${sessionScope.fullAccount != null ? sessionScope.fullAccount.email : ''}"
                               ${sessionScope.fullAccount != null ? 'readonly' : ''} required>
                    </div>

                    <div class="form-group">
                        <label for="phoneNumber">Phone Number</label>
                        <input type="tel" id="phoneNumber" name="phoneNumber"
                               value="${not empty sessionScope.fullAccount ? sessionScope.fullAccount.phoneNumber : ''}"
                               ${not empty sessionScope.fullAccount ? 'readonly' : ''} required>
                    </div>

                    <div class="form-group">
                        <label>Giới tính</label>
                        <div class="gender-group">
                            <label>
                                <input type="radio" name="gender" value="Male" <c:if test="${fullAccount.gender == 'Male'}">checked</c:if> /> Nam
                                </label>
                                <label>
                                    <input type="radio" name="gender" value="Female" <c:if test="${fullAccount.gender == 'Female'}">checked</c:if> /> Nữ
                                </label>
                                <label>
                                    <input type="radio" name="gender" value="other" <c:if test="${fullAccount.gender != 'Male' && fullAccount.gender != 'Female'}">checked</c:if> /> Khác
                                </label>
                            </div>
                        </div>

                        <div class="button-group">
                            <button type="submit" class="btn btn-register">Register</button>
                            <button type="button" class="btn btn-cancel" onclick="window.location.href = 'CourseDetail?id=${param.courseID}'">Cancel</button>
                    </div>
                </form>
            </div>
        </div>

    </body>
</html>
