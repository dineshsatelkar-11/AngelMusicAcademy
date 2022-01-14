/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.accede.angel.admin.model;

import java.io.Serializable;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Entity;

/**
 *
 * @author admin
 */
@Entity
public class UploadCoursePdfModel implements Serializable {
  
    
      @Id
    @GeneratedValue
    private int Id;
     private String course;
     private String courseName;
    private String nameofpdf;
    private String pdflink;

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public String getCourse() {
        return course;
    }

    public void setCourse(String course) {
        this.course = course;
    }

    public String getNameofpdf() {
        return nameofpdf;
    }

    public void setNameofpdf(String nameofpdf) {
        this.nameofpdf = nameofpdf;
    }

    public String getPdflink() {
        return pdflink;
    }

    public void setPdflink(String pdflink) {
        this.pdflink = pdflink;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }
    
    
    
    
    

 

}

