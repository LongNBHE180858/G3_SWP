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
import java.util.Properties;
import jakarta.mail.*;
import dao.AccountDAO;
import jakarta.mail.internet.*;

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

        if (!email.matches("^\\S+@\\S+\\.\\S+$") || AccountDAO.getAccountByMail(email) != null) {
            response.sendRedirect("userPages/signUp.jsp?status=emailExists");
            return;
        }
        
        if (phone.length() != 10) {
            response.sendRedirect("userPages/signUp.jsp?status=lengthPhone");
            return;
        }

        if (AccountDAO.getAccountByPhone(phone) != null) {
            response.sendRedirect("userPages/signUp.jsp?status=phoneExists");
            return;
        }

        // Gửi link xác nhận
        String link = "http://localhost:8080/OLIT/userPages/ResetPassword.jsp?email=" + email;

        sendVerificationEmail(email, link);

        // Tạo account tạm (chưa có password)
        Account newAccount = new Account();
        newAccount.setFullName(fullName);
        newAccount.setGender(gender);
        newAccount.setEmail(email);
        newAccount.setPhoneNumber(phone);
        newAccount.setRoleID(3);
        newAccount.setStatus("active");
        newAccount.setPassword("0");
        AccountDAO.insertAccount(newAccount);

        response.sendRedirect("userPages/signUp.jsp?status=success");
    }

    private void sendVerificationEmail(String to, String link) {
        final String from = "doitingiaothuy18@gmail.com";
        final String pass = "ivgb rcbi egml nrve";

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, pass);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject("Xác nhận đăng ký tài khoản");
            message.setText("Click vào link để thiết lập mật khẩu:\n" + link);
            Transport.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
