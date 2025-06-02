package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import dal.DBContext;

@WebServlet("/ResetPasswordServlet")
public class ResetPasswordServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String inputCode = request.getParameter("code");
        String newPassword = request.getParameter("newPassword");

        HttpSession session = request.getSession();
        String sessionCode = (String) session.getAttribute("verificationCode");
        String email = (String) session.getAttribute("email");

        if (inputCode == null || newPassword == null || email == null || !inputCode.equals(sessionCode)) {
            request.setAttribute("message", "Mã xác thực sai hoặc đã hết hạn.");
            request.getRequestDispatcher("forgotPassword.jsp").forward(request, response);
            return;
        }

        if (updatePassword(email, newPassword)) {
            session.removeAttribute("verificationCode");
            session.removeAttribute("email");
            request.setAttribute("message", "Đổi mật khẩu thành công.");
        } else {
            request.setAttribute("message", "Đổi mật khẩu thất bại.");
        }

        request.getRequestDispatcher("forgotPassword.jsp").forward(request, response);
    }

    private boolean updatePassword(String email, String password) {
        try (Connection conn = DBContext.getInstance().getConnection()) {
            PreparedStatement ps = conn.prepareStatement("UPDATE Users SET password = ? WHERE email = ?");
            ps.setString(1, password); 
            ps.setString(2, email);
            int rows = ps.executeUpdate();
            return rows > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
