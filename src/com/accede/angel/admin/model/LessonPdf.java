/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.accede.angel.admin.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import java.io.Serializable;
import javax.persistence.FetchType;
import javax.persistence.OneToOne;

/**
 *
 * @author Accede
 */

@Entity
public class LessonPdf implements Serializable {
   

    @Id
    @GeneratedValue
    private int lessonid;
    private int lessonno;
     @OneToOne(fetch = FetchType.EAGER)
    private Course course;
    private long courseid;
    private String pdfpath;
    private String pdfname;

    public int getLessonid() {
        return lessonid;
    }

    public void setLessonid(int lessonid) {
        this.lessonid = lessonid;
    }

    public long getCourseid() {
        return courseid;
    }

    public void setCourseid(long courseid) {
        this.courseid = courseid;
    }

    public String getPdfpath() {
        return pdfpath;
    }

    public void setPdfpath(String pdfpath) {
        this.pdfpath = pdfpath;
    }

    public String getPdfname() {
        return pdfname;
    }

    public void setPdfname(String pdfname) {
        this.pdfname = pdfname;
    }

    public int getLessonno() {
        return lessonno;
    }

    public void setLessonno(int lessonno) {
        this.lessonno = lessonno;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }
    
    
    
}
