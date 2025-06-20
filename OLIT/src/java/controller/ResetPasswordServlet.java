package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import dal.DBContext;
import dao.AccountDAO;
import java.util.ArrayList;
import model.Account;

/**
 *
 * @author macbook
 */
@WebServlet(name = "ResetPasswordServlet", urlPatterns = {"/ResetPasswordServlet"})
public class ResetPasswordServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        HttpSession session = request.getSession(false);

        if (action.equalsIgnoreCase("changePassword") && session != null) {
            String userEmail = (String) session.getAttribute("userEmail");
            String oldPassword = request.getParameter("oldPassword");
            String newPassword = request.getParameter("newPassword");
            String confirm = request.getParameter("confirmPassword");

            if (!AccountDAO.getAccountByMail(userEmail).getPassword().equals(oldPassword)) {
                request.setAttribute("error", "Incorrect password, please re-enter");
                request.getRequestDispatcher("userPages/ChangePassword.jsp?email=" + userEmail).forward(request, response);
                return;
            } else if (oldPassword.equals(newPassword)) {
                request.setAttribute("error", "New password must be different from old password");
                request.getRequestDispatcher("userPages/ChangePassword.jsp?email=" + userEmail).forward(request, response);
                return;
            } else if (!isStrongPassword(newPassword)) {
                request.setAttribute("error", "Password must be at least 8 characters long and include uppercase, lowercase, number, and special character.");
                request.getRequestDispatcher("userPages/ChangePassword.jsp?email=" + userEmail).forward(request, response);
                return;
            } else if (!newPassword.equals(confirm)) {
                request.setAttribute("error", "Passwords do not match.");
                request.getRequestDispatcher("userPages/ChangePassword.jsp?email=" + userEmail).forward(request, response);
                return;
            }
            boolean success = AccountDAO.updatePasswordAndActivate(userEmail, newPassword);
            if (success) {
                response.sendRedirect("userPages/userProfile.jsp");
            } else {
                request.setAttribute("error", "Failed to reset the password.");
                request.getRequestDispatcher("userPages/ChangePassword.jsp?email=" + userEmail).forward(request, response);
            }
        }

//        String email = request.getParameter("email");
//        String pass = request.getParameter("password");
//        String confirm = request.getParameter("confirmPassword");
//
//        if (!pass.equals(confirm)) {
//            request.setAttribute("error", "Passwords do not match.");
//            request.getRequestDispatcher("userPages/ResetPassword.jsp?email=" + email).forward(request, response);
//            return;
//        }
//
//        if (!isStrongPassword(pass)) {
//            request.setAttribute("error", "Password must be at least 8 characters long and include uppercase, lowercase, number, and special character.");
//            request.getRequestDispatcher("userPages/ResetPassword.jsp?email=" + email).forward(request, response);
//            return;
//        }
//
//        boolean success = AccountDAO.updatePasswordAndActivate(email, pass);
//        if (success) {
//            response.sendRedirect("userPages/login.jsp");
//        } else {
//            request.setAttribute("error", "Failed to reset the password.");
//            request.getRequestDispatcher("userPages/ResetPassword.jsp?email=" + email).forward(request, response);
//        }

    }

    private boolean isStrongPassword(String password) {
        String pattern = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$";
        return password != null && password.matches(pattern);
    }
}
