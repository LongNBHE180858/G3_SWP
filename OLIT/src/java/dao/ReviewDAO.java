package dao;

import java.sql.*;
import java.util.*;
import model.Review;
import dal.DBContext;

public class ReviewDAO extends DBContext {
    public List<Review> getReviewsByCourseId(int courseId) {
        List<Review> reviews = new ArrayList<>();
        String sql = "SELECT * FROM Review WHERE CourseID = ? AND Status = 1 ORDER BY CreatedAt DESC";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, courseId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Review review = new Review();
                    review.setReviewID(rs.getInt("ReviewID"));
                    review.setUserID(rs.getInt("UserID"));
                    review.setCourseID(rs.getInt("CourseID"));
                    review.setContent(rs.getString("Content"));
                    review.setStar(rs.getInt("Star"));
                    review.setCreatedAt(rs.getDate("CreatedAt"));
                    review.setStatus(rs.getBoolean("Status"));
                    reviews.add(review);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reviews;
    }
}