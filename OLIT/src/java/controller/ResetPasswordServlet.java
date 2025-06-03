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
   
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        if (newPassword.equals(confirmPassword) && AccountDAO.changePasswordByEmail(newPassword, email))   
            response.sendRedirect("userPages/login.jsp");
        else {
            response.sendRedirect("userPages/ResetPassword.jsp?status=fail");
        }
    }
}
