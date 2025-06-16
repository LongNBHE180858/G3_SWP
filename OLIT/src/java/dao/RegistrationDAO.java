package dao;

import model.Registration;
import model.Course;
import model.Account;
import model.PricePackage;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import dal.DBContext;

public class RegistrationDAO extends DBContext {
    public boolean registerCourse(Registration registration) {
    // Tìm ID trống trước
    int availableId = findAvailableRegistrationId();
    if (availableId == -1) {
        return false; // Không tìm thấy ID trống
    }

    String sql = "INSERT INTO Registration (RegistrationID, UserID, CourseID, PackageID, Status, ValidFrom, ValidTo) "
               + "VALUES (?, ?, ?, ?, 'Pending', GETDATE(), DATEADD(MONTH, ?, GETDATE()))";
    
    try (PreparedStatement ps = connection.prepareStatement(sql)) {
        ps.setInt(1, availableId);
        ps.setInt(2, registration.getUserID());
        ps.setInt(3, registration.getCourseID());
        ps.setInt(4, registration.getPackageID());
        
        PricePackage pkg = new PricePackageDAO().getPackageById(registration.getPackageID());
        ps.setInt(5, pkg.getAccessDuration());
        
        return ps.executeUpdate() > 0;
    } catch (Exception e) {
        e.printStackTrace();
        return false;
    }
    }

    private int findAvailableRegistrationId() {
        String sql = "SELECT TOP 1 t1.RegistrationID + 1 " +
                     "FROM Registration t1 " +
                     "WHERE NOT EXISTS (SELECT 1 FROM Registration t2 WHERE t2.RegistrationID = t1.RegistrationID + 1) " +
                     "UNION " +
                     "SELECT 1 WHERE NOT EXISTS (SELECT 1 FROM Registration WHERE RegistrationID = 1) " +
                     "ORDER BY 1";

        try (PreparedStatement ps = connection.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }
    
    public List<Registration> getRegistrationsByUserID(int userID) {
        Connection conn = DBContext.getInstance().getConnection();
    List<Registration> list = new ArrayList<>();

    String sql = "SELECT r.RegistrationID, r.UserID, r.CourseID, r.PackageID, r.ApprovedBy, " +
                 "r.Status, r.ValidFrom, r.ValidTo, " +
                 "c.CourseTitle, " +
                 "pp.Name AS PackageName, pp.SalePrice " +
                 "FROM Registration r " +
                 "JOIN Course c ON r.CourseID = c.courseID " +
                 "JOIN PricePackage pp ON r.PackageID = pp.PackageID " +
                 "WHERE r.UserID = ?";

    try (PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setInt(1, userID);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            Registration r = new Registration();
            r.setRegistrationID(rs.getInt("RegistrationID"));
            r.setUserID(rs.getInt("UserID"));
            r.setCourseID(rs.getInt("CourseID"));
            r.setPackageID(rs.getInt("PackageID"));
            r.setApprovedBy(rs.getInt("ApprovedBy"));
            r.setStatus(rs.getString("Status"));
            r.setValidFrom(rs.getString("ValidFrom"));
            r.setValidTo(rs.getString("ValidTo"));

            Course course = new Course();
            course.setCourseTitle(rs.getString("courseTitle"));
            r.setCourse(course);

            PricePackage pp = new PricePackage();
            pp.setName(rs.getString("PackageName"));
            pp.setSalePrice(rs.getInt("SalePrice"));
            r.setPricePackage(pp);

            list.add(r);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return list;
}
}
