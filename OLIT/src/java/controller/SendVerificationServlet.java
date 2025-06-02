package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.Properties;
import jakarta.mail.*;
import jakarta.mail.internet.*;
import dal.DBContext;

@WebServlet("/SendVerificationServlet")
public class SendVerificationServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        
        String email = request.getParameter("email");

        if (email == null || email.isEmpty()) {
            request.setAttribute("message", "Vui lòng nhập email.");
            request.getRequestDispatcher("forgotPassword.jsp").forward(request, response);
            return;
        }

        if (!checkUserExists(email)) {
            request.setAttribute("message", "Email không tồn tại trong hệ thống.");
            request.getRequestDispatcher("forgotPassword.jsp").forward(request, response);
            return;
        }

        String code = String.valueOf((int)(Math.random() * 900000) + 100000); 

        sendVerificationEmail(email, code);

        HttpSession session = request.getSession();
        session.setAttribute("verificationCode", code);
        session.setAttribute("email", email);

        request.setAttribute("message", "Đã gửi mã xác thực đến email.");
        request.getRequestDispatcher("forgotPassword.jsp").forward(request, response);
    }

    private boolean checkUserExists(String email) {
        try (Connection conn = DBContext.getInstance().getConnection()) {
            PreparedStatement ps = conn.prepareStatement("SELECT 1 FROM Users WHERE email = ?");
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    private void sendVerificationEmail(String to, String code) {
        final String from = "doitingiaothuy18@gmail.com";
        final String pass = "Ahntuan06102004!"; 

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
            message.setSubject("Mã khôi phục mật khẩu");
            message.setText("Mã xác thực của bạn là: " + code);
            Transport.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}
