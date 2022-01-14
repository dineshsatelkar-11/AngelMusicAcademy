/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.accede.angel.admin.model;

import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;

/**
 *
 * @author Admin
 */
@Entity
public class EmployeeDocuments implements Serializable {

    @Id
    @GeneratedValue
    private int id;
     @Temporal(javax.persistence.TemporalType.DATE)
    private Date UploadesDate=new Date();
    
    @Temporal(javax.persistence.TemporalType.TIME)
    private Date UploadesTime=new Date();
     private String Image = "Employee.jpg";
    private String imagepath;
    private String DocumentType;
    @OneToOne(fetch = FetchType.EAGER)
    private Employee Employee;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getUploadesDate() {
        return UploadesDate;
    }

    public void setUploadesDate(Date UploadesDate) {
        this.UploadesDate = UploadesDate;
    }

    public Date getUploadesTime() {
        return UploadesTime;
    }

    public void setUploadesTime(Date UploadesTime) {
        this.UploadesTime = UploadesTime;
    }

    public String getImage() {
        return Image;
    }

    public void setImage(String Image) {
        this.Image = Image;
    }

    public String getImagepath() {
        return imagepath;
    }

    public void setImagepath(String imagepath) {
        this.imagepath = imagepath;
    }

    public String getDocumentType() {
        return DocumentType;
    }

    public void setDocumentType(String DocumentType) {
        this.DocumentType = DocumentType;
    }

    public Employee getEmployee() {
        return Employee;
    }

    public void setEmployee(Employee Employee) {
        this.Employee = Employee;
    }
    
    
    
}
