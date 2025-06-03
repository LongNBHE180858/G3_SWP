/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Account;
import dao.AccountDAO;

/**
 *
 * @author macbook
 */
@WebServlet(name="SignupServlet", urlPatterns={"/SignupServlet"})
public class SignupServlet extends HttpServlet {
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String fullName = request.getParameter("fullName");
        String gender = request.getParameter("gender");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String avatar = request.getParameter("avatar");
        String address = request.getParameter("address");
        String birthday = request.getParameter("birthday");

        if (AccountDAO.getAccountByMail(email) != null) {
            response.sendRedirect("userPages/signUp.jsp?status=fail");
            return;
        }

        Account newAccount = new Account();
        newAccount.setRoleID(3);
        newAccount.setFullName(fullName);
        newAccount.setGender(gender);
        newAccount.setEmail(email);
        newAccount.setPhoneNumber(phone);
        newAccount.setPassword(password);
        newAccount.setUrlAvatar(avatar);
        newAccount.setStatus("active");
        newAccount.setAddress(address);
        newAccount.setBirthday(birthday);

        boolean created = AccountDAO.insertAccount(newAccount);
        if (created) {
            response.sendRedirect("userPages/signUp.jsp?status=success");
        } else {
            System.out.println("1");
            response.sendRedirect("userPages/signUp.jsp?status=fail");
        }
    }
}
