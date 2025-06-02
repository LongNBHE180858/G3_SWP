/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.Properties;
import jakarta.mail.*;
import dao.AccountDAO;
import jakarta.mail.internet.*;
import dal.DBContext;
import model.Account;

/**
 *
 * @author macbook
 */
@WebServlet(name="SendVerificationServlet", urlPatterns={"/SendVerificationServlet"})
public class SendVerificationServlet extends HttpServlet {
   
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");

        AccountDAO dao = new AccountDAO();
        Account acc = AccountDAO.getAccountByMail(email);
        if (acc != null) {
            String resetLink = "http://localhost:8080/OLIT/userPages/ResetPassword.jsp?email=" + email;

            sendVerificationEmail(email, resetLink); 
        }
        else 
            response.sendRedirect("userPages/forgotPassword.jsp");
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
            message.setSubject("Reset your password");
            message.setText("Click this link to reset your password:\n" + link);
            Transport.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
