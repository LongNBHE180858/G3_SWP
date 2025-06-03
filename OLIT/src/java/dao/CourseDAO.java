/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import com.sun.jdi.connect.spi.Connection;
import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Course;

/**
 *
 * @author Long0
 */
public class CourseDAO {

    public static ArrayList<Course> getCourses() {
        DBContext db = DBContext.getInstance();
        ArrayList<Course> courses = new ArrayList<>();
        try {
            String sql = """
                     Select 
                         CourseID,
                         SubjectID,
                         CourseTitle,
                         CourseTag,
                         URLCourse,
                         CourseDetail,
                         CourseLevel,
                         FeatureFlag,
                         Status,
                         CourseraDuration,
                         FROM Course
                         """;
            PreparedStatement statement = db.getConnection().prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Course course = new Course(
                        rs.getInt("CourseID"),
                        rs.getInt("SubjectID"),
                        rs.getString("CourseTitle"),
                        rs.getString("CourseTag"),
                        rs.getString("URLCourse"),
                        rs.getString("CourseDetail"),
                        rs.getString("CourseLevel"),
                        rs.getString("FeatureFlag"),
                        rs.getInt("Status"),
                        rs.getInt("CourseraDuration")
                );
                courses.add(course);
            }
        } catch (Exception e) {
            return null;
        }
        return courses;
    }
    
    public Course getCourseById(int id) {
        DBContext db = DBContext.getInstance();
    String sql = "SELECT * FROM Course WHERE CourseID = ?";
    
            try {
                
     PreparedStatement ps = db.getConnection().prepareStatement(sql); 
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            Course course = new Course();
            course.setCourseID(rs.getInt("CourseID"));
            course.setCourseTitle(rs.getString("CourseTitle"));
            course.setCourseDetail(rs.getString("CourseDetail"));
            return course;
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return null;
}
}
