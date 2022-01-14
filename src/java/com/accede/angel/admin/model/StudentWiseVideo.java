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
import java.util.Date;
import javax.persistence.Temporal;

/**
 *
 * @author USER
 */
@Entity
public class StudentWiseVideo implements Serializable {

    @Id
    @GeneratedValue
    private int id;

   
    private long courseid;
    private long studentid;
    private String videoPath;
    private String videoName;
    private String CourseName;
    private String videodescription;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date dateofvideo;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date uploadedDate = new Date();

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

  

    public long getCourseid() {
        return courseid;
    }

    public void setCourseid(long courseid) {
        this.courseid = courseid;
    }

    public long getStudentid() {
        return studentid;
    }

    public void setStudentid(long studentid) {
        this.studentid = studentid;
    }

    public String getVideoPath() {
        return videoPath;
    }

    public void setVideoPath(String videoPath) {
        this.videoPath = videoPath;
    }

    public String getVideoName() {
        return videoName;
    }

    public void setVideoName(String videoName) {
        this.videoName = videoName;
    }

    public String getVideodescription() {
        return videodescription;
    }

    public void setVideodescription(String videodescription) {
        this.videodescription = videodescription;
    }

    public Date getDateofvideo() {
        return dateofvideo;
    }

    public void setDateofvideo(Date dateofvideo) {
        this.dateofvideo = dateofvideo;
    }

    public Date getUploadedDate() {
        return uploadedDate;
    }

    public void setUploadedDate(Date uploadedDate) {
        this.uploadedDate = uploadedDate;
    }

    public String getCourseName() {
        return CourseName;
    }

    public void setCourseName(String CourseName) {
        this.CourseName = CourseName;
    }

}
