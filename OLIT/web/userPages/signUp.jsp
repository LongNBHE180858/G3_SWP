<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Sign Up</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <style>
        * {
            box-sizing: border-box;
            font-family: 'Inter', sans-serif;
        }

        body {
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #f5f7fa, #c3cfe2);
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .login-container {
            background-color: white;
            padding: 40px 30px;
            border-radius: 16px;
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }

        .login-container h2 {
            text-align: center;
            margin-bottom: 24px;
            font-weight: 600;
            color: #333;
        }

        .input-field, select {
            width: 100%;
            padding: 12px 16px;
            margin: 12px 0;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 14px;
            transition: border-color 0.3s;
        }

        .input-field:focus, select:focus {
            border-color: #4f8ef7;
            outline: none;
        }

        label {
            font-weight: 500;
            margin-top: 10px;
            display: block;
            color: #444;
        }

        .button {
            width: 100%;
            padding: 12px;
            background-color: #4f8ef7;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 15px;
            font-weight: 600;
            margin-top: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .button:hover {
            background-color: #3b74d7;
        }

        .message {
            margin-top: 16px;
            font-size: 14px;
            text-align: center;
        }

        .message.error {
            color: #e74c3c;
        }

        .message.success {
            color: #2ecc71;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Create Your Account</h2>
        <form action="/OLIT/SignupServlet" method="post">
            <input type="text" class="input-field" name="fullName" placeholder="Full Name" required>

            <label for="gender">Gender</label>
            <select name="gender" class="input-field" required>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
                <option value="Other" selected>Other</option>
            </select>

            <input type="email" class="input-field" name="email" placeholder="Email Address" required>
            <input type="tel" class="input-field" name="phone" placeholder="Phone Number" required>

            <button type="submit" class="button">Sign Up</button>

            <c:if test="${param.status == 'emailExists'}">
                <p class="message error">Email already exists or is invalid!</p>
            </c:if>
            <c:if test="${param.status == 'lengthPhone'}">
                <p class="message error">Phone number must be 10 digits long!</p>
            </c:if>
            <c:if test="${param.status == 'phoneExists'}">
                <p class="message error">Phone number already exists!</p>
            </c:if>
            <c:if test="${param.status == 'success'}">
                <p class="message success">We've sent a confirmation link to your email.</p>
            </c:if>
        </form>
    </div>
</body>
</html>
