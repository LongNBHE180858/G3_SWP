/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class CourseSection {
    private int sectionID;
    private int courseID;
    private int sectionTitle;

    public CourseSection() {
    }

    public CourseSection(int sectionID, int courseID, int sectionTitle) {
        this.sectionID = sectionID;
        this.courseID = courseID;
        this.sectionTitle = sectionTitle;
    }

    public int getSectionID() {
        return sectionID;
    }

    public void setSectionID(int sectionID) {
        this.sectionID = sectionID;
    }

    public int getCourseID() {
        return courseID;
    }

    public void setCourseID(int courseID) {
        this.courseID = courseID;
    }

    public int getSectionTitle() {
        return sectionTitle;
    }

    public void setSectionTitle(int sectionTitle) {
        this.sectionTitle = sectionTitle;
    }
    
    
}
