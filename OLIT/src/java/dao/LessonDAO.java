/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.*;

public class LessonDAO {
    public List<Lesson> getLessonsByModuleId(int moduleId) {
        List<Lesson> list = new ArrayList<>();
        String sql = "SELECT * FROM Lesson WHERE ModuleID = ? ORDER BY [Order]";

        try {
            PreparedStatement ps = DBContext.getInstance().getConnection().prepareStatement(sql);
            ps.setInt(1, moduleId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Lesson lesson = new Lesson();
                lesson.setLessonID(rs.getInt("LessonID"));
                lesson.setModuleID(rs.getInt("ModuleID"));
                lesson.setLessonTitle(rs.getString("LessonTitle"));
                lesson.setLessonDetail(rs.getString("LessonDetails"));
                lesson.setStatus(rs.getBoolean("Status"));
                lesson.setURLLesson(rs.getString("URLLesson"));
                lesson.setOrder(rs.getInt("Order"));
                list.add(lesson);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
