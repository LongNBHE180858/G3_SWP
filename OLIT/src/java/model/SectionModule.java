/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class SectionModule {
    private int moduleID;
    private int sectionID;
    private String moduleTitle;

    public SectionModule() {
    }

    public SectionModule(int moduleID, int sectionID, String moduleTitle) {
        this.moduleID = moduleID;
        this.sectionID = sectionID;
        this.moduleTitle = moduleTitle;
    }

    public int getModuleID() {
        return moduleID;
    }

    public void setModuleID(int moduleID) {
        this.moduleID = moduleID;
    }

    public int getSectionID() {
        return sectionID;
    }

    public void setSectionID(int sectionID) {
        this.sectionID = sectionID;
    }

    public String getModuleTitle() {
        return moduleTitle;
    }

    public void setModuleTitle(String moduleTitle) {
        this.moduleTitle = moduleTitle;
    }
    
    
}
