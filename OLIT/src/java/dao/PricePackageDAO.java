package dao;

import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.*;

public class PricePackageDAO extends DBContext {
    
    public List<PricePackage> getPricePackagesByCourseId(int courseId) {
        List<PricePackage> list = new ArrayList<>();
        String sql = "SELECT * FROM PricePackage WHERE CourseID = ? AND Status = 1";
        
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, courseId);
            
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    PricePackage p = new PricePackage();
                    p.setPackageID(rs.getInt("PackageID"));
                    p.setCourseID(rs.getInt("CourseID"));
                    p.setName(rs.getString("Name"));
                    p.setAccessDuration(rs.getInt("AccessDuration"));
                    p.setListPrice(rs.getInt("ListPrice"));
                    p.setSalePrice(rs.getInt("SalePrice"));
                    p.setStatus(rs.getInt("Status"));
                    p.setDescription(rs.getString("Description"));
                    list.add(p);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}