/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.admin.model;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import org.hibernate.annotations.Type;

/**
 *
 * @author Admin
 */
@Entity
public class PackageCourse implements java.io.Serializable{

    @Id
    @GeneratedValue
    private int Id;
    private String packagename;
    private String description;

    private int noofdays;
    private int noofcourse;
    private int noofBatchTimes;
    private int paymentMode;
    private int courseDuration;
    private int fee;
    @OneToOne(fetch = FetchType.EAGER)
    private Admin adminOfBranch;
 @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean Status = true;
    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public String getPackagename() {
        return packagename;
    }

    public void setPackagename(String packagename) {
        this.packagename = packagename;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getNoofdays() {
        return noofdays;
    }

    public void setNoofdays(int noofdays) {
        this.noofdays = noofdays;
    }

    public int getNoofcourse() {
        return noofcourse;
    }

    public void setNoofcourse(int noofcourse) {
        this.noofcourse = noofcourse;
    }

    public int getPaymentMode() {
        return paymentMode;
    }

    public void setPaymentMode(int paymentMode) {
        this.paymentMode = paymentMode;
    }

    public int getCourseDuration() {
        return courseDuration;
    }

    public void setCourseDuration(int courseDuration) {
        this.courseDuration = courseDuration;
    }

    public Admin getAdminOfBranch() {
        return adminOfBranch;
    }

    public void setAdminOfBranch(Admin adminOfBranch) {
        this.adminOfBranch = adminOfBranch;
    }

    public boolean isStatus() {
        return Status;
    }

    public void setStatus(boolean Status) {
        this.Status = Status;
    }

    public int getFee() {
        return fee;
    }

    public void setFee(int fee) {
        this.fee = fee;
    }

    public int getNoofBatchTimes() {
        return noofBatchTimes;
    }

    public void setNoofBatchTimes(int noofBatchTimes) {
        this.noofBatchTimes = noofBatchTimes;
    }

    @Override
    public String toString() {
        return "Package{" + "Id=" + Id + ", packagename=" + packagename + ", description=" + description + ", noofdays=" + noofdays + ", noofcourse=" + noofcourse + ", paymentMode=" + paymentMode + ", courseDuration=" + courseDuration + ", adminOfBranch=" + adminOfBranch + '}';
    }
    
    
    
}
