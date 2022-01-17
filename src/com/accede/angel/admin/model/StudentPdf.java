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
import javax.persistence.FetchType;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;

/**
 *
 * @author USER
 */
@Entity
public class StudentPdf implements Serializable {

    @Id
    @GeneratedValue
    private int id;

  
    private long courseid;
    private long studentid;
    private int PdfGalleryid;
      private String pdfdescription;
      private String pdfname;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date uploadedDate = new Date();
  @OneToOne(fetch = FetchType.EAGER)
    private UploadCoursePdfModel UploadCoursePdfModel;

    public Date getUploadedDate() {
        return uploadedDate;
    }

    public void setUploadedDate(Date uploadedDate) {
        this.uploadedDate = uploadedDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

  

    public String getPdfdescription() {
        return pdfdescription;
    }

    public void setPdfdescription(String pdfdescription) {
        this.pdfdescription = pdfdescription;
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

    public int getPdfGalleryid() {
        return PdfGalleryid;
    }

    public void setPdfGalleryid(int PdfGalleryid) {
        this.PdfGalleryid = PdfGalleryid;
    }

    public String getPdfname() {
        return pdfname;
    }

    public void setPdfname(String pdfname) {
        this.pdfname = pdfname;
    }

    public UploadCoursePdfModel getUploadCoursePdfModel() {
        return UploadCoursePdfModel;
    }

    public void setUploadCoursePdfModel(UploadCoursePdfModel UploadCoursePdfModel) {
        this.UploadCoursePdfModel = UploadCoursePdfModel;
    }

    
    
}
