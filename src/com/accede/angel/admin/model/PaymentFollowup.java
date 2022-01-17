/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.admin.model;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import org.hibernate.annotations.Type;

/**
 *
 * @author Admin
 */
@Entity
public class PaymentFollowup implements java.io.Serializable {

    @Id
    @GeneratedValue
    private int id;
    @OneToOne(fetch = FetchType.EAGER)
    private CustomerAccount CustomerAccount;
    private String typeofoffollowup;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date requestDate;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date nextfollowupdate;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date requestClosedDate;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean requeststatus = true;
      @OneToOne(fetch = FetchType.EAGER)
    private Admin adminOfBranch;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public CustomerAccount getCustomerAccount() {
        return CustomerAccount;
    }

    public void setCustomerAccount(CustomerAccount CustomerAccount) {
        this.CustomerAccount = CustomerAccount;
    }

    public Date getRequestDate() {
        return requestDate;
    }

    public void setRequestDate(Date requestDate) {
        this.requestDate = requestDate;
    }

    public Date getRequestClosedDate() {
        return requestClosedDate;
    }

    public void setRequestClosedDate(Date requestClosedDate) {
        this.requestClosedDate = requestClosedDate;
    }

    public boolean isRequeststatus() {
        return requeststatus;
    }

    public void setRequeststatus(boolean requeststatus) {
        this.requeststatus = requeststatus;
    }

   

    public Date getNextfollowupdate() {
        return nextfollowupdate;
    }

    public void setNextfollowupdate(Date nextfollowupdate) {
        this.nextfollowupdate = nextfollowupdate;
    }

    public Admin getAdminOfBranch() {
        return adminOfBranch;
    }

    public void setAdminOfBranch(Admin adminOfBranch) {
        this.adminOfBranch = adminOfBranch;
    }

    public String getTypeofoffollowup() {
        return typeofoffollowup;
    }

    public void setTypeofoffollowup(String typeofoffollowup) {
        this.typeofoffollowup = typeofoffollowup;
    }

    @Override
    public String toString() {
        return "PaymentFollowup{" + "id=" + id + ", CustomerAccount=" + CustomerAccount + ", requestDate=" + requestDate + ", nextfollowupdate=" + nextfollowupdate + ", requestClosedDate=" + requestClosedDate + ", requeststatus=" + requeststatus + ", adminOfBranch=" + adminOfBranch + '}';
    }

   
    
    
}
