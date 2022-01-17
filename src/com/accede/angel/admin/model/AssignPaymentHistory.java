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
public class AssignPaymentHistory {
        @Id
    @GeneratedValue
    private int Id;
 @Temporal(javax.persistence.TemporalType.DATE)
    private Date dateupload=new Date();
  @OneToOne(fetch = FetchType.EAGER)  
 private Admin admin;
    private String Course;
    private int Amount;

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public Date getDateupload() {
        return dateupload;
    }

    public void setDateupload(Date dateupload) {
        this.dateupload = dateupload;
    }

    public Admin getAdmin() {
        return admin;
    }

    public void setAdmin(Admin admin) {
        this.admin = admin;
    }

    public String getCourse() {
        return Course;
    }

    public void setCourse(String Course) {
        this.Course = Course;
    }

    public int getAmount() {
        return Amount;
    }

    public void setAmount(int Amount) {
        this.Amount = Amount;
    }
 
 
 
}
