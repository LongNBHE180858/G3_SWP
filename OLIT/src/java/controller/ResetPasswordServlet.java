package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import dal.DBContext;
import dao.AccountDAO;

/**
 *
 * @author macbook
 */
@WebServlet(name="ResetPasswordServlet", urlPatterns={"/ResetPasswordServlet"})
public class ResetPasswordServlet extends HttpServlet {
   
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String email = request.getParameter("email");
        String pass = request.getParameter("password");
        String confirm = request.getParameter("confirmPassword");

        if (!pass.equals(confirm)) {
            request.setAttribute("error", "Passwords do not match.");
            request.getRequestDispatcher("userPages/ResetPassword.jsp?email=" + email).forward(request, response);
            return;
        }

        if (!isStrongPassword(pass)) {
            request.setAttribute("error", "Password must be at least 8 characters long and include uppercase, lowercase, number, and special character.");
            request.getRequestDispatcher("userPages/ResetPassword.jsp?email=" + email).forward(request, response);
            return;
        }

        boolean success = AccountDAO.updatePasswordAndActivate(email, pass);
        if (success) {
            response.sendRedirect("userPages/login.jsp");
        } else {
            request.setAttribute("error", "Failed to reset the password.");
            request.getRequestDispatcher("userPages/ResetPassword.jsp?email=" + email).forward(request, response);
        }

    }
    
    private boolean isStrongPassword(String password) {
        String pattern = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$";
        return password != null && password.matches(pattern);
    }
}
