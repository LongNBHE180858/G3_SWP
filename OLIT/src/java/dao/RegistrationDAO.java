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
