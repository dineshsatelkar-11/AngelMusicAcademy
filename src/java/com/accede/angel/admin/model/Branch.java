package com.accede.angel.admin.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import javax.persistence.OneToOne;
import javax.persistence.Temporal;

@Entity

public class Branch implements Serializable {

    @Id
    @GeneratedValue
    private int branchId;
    private String branchName;
    private String branchAddress;
    private String branchAddress1;
    private String branchAddress2;
    private String adminEmail;
    private String adminName;
    private String adminMobileNo;
    private String adminPassword;
    private String gstNo="NA";

   
    private String receptionPassword;

    @Temporal(javax.persistence.TemporalType.DATE)
    private Date branchRegisteredDate;

    public Date getBranchRegisteredDate() {
        return branchRegisteredDate;
    }

    public String getBranchAddress1() {
        return branchAddress1;
    }

    public void setBranchAddress1(String branchAddress1) {
        this.branchAddress1 = branchAddress1;
    }

    public String getBranchAddress2() {
        return branchAddress2;
    }

    public void setBranchAddress2(String branchAddress2) {
        this.branchAddress2 = branchAddress2;
    }

    public void setBranchRegisteredDate(Date branchRegisteredDate) {
        this.branchRegisteredDate = branchRegisteredDate;
    }

    public int getBranchId() {
        return branchId;
    }

    public void setBranchId(int branchId) {
        this.branchId = branchId;
    }

    public String getBranchName() {
        return branchName;
    }

    public void setBranchName(String branchName) {
        this.branchName = branchName.toUpperCase();
    }

    public String getBranchAddress() {
        return branchAddress;
    }

    public void setBranchAddress(String branchAddress) {
        this.branchAddress = branchAddress;
    }

    public String getAdminEmail() {
        return adminEmail;
    }

    public void setAdminEmail(String adminEmail) {
        this.adminEmail = adminEmail;
    }

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }

    public String getAdminMobileNo() {
        return adminMobileNo;
    }

    public void setAdminMobileNo(String adminMobileNo) {
        this.adminMobileNo = adminMobileNo;
    }

    public String getAdminPassword() {
        return adminPassword;
    }

    public void setAdminPassword(String adminPassword) {
        this.adminPassword = adminPassword;
    }

    public String getReceptionPassword() {
        return receptionPassword;
    }

    public void setReceptionPassword(String receptionPassword) {
        this.receptionPassword = receptionPassword;
    }
     public String getGstNo() {
        return gstNo;
    }

    public void setGstNo(String gstNo) {
        this.gstNo = gstNo;
    }

}
