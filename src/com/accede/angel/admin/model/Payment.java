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
import javax.persistence.TemporalType;

/**
 *
 * @author Accede
 */
@Entity
public class Payment implements java.io.Serializable {
     private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue
    private long Id;
    
    private String paymentType;
    private String paymentMode;
    private String paymentAgains;
    private String Description;
    private int amount;
      @OneToOne(fetch = FetchType.EAGER)
    private CustomerAccount CustomerAccount;
     @Temporal(TemporalType.TIMESTAMP)
    private Date paymentTime=new Date();
     @Temporal(TemporalType.DATE)
    private Date paymentDate=new Date();
 @OneToOne(fetch = FetchType.EAGER)
    private Admin adminOfBranch;

    public Admin getAdminOfBranch() {
        return adminOfBranch;
    }

    public void setAdminOfBranch(Admin adminOfBranch) {
        this.adminOfBranch = adminOfBranch;
    }
 
 
    public long getId() {
        return Id;
    }

    public void setId(long Id) {
        this.Id = Id;
    }

   


    public Date getPaymentTime() {
        return paymentTime;
    }

    public void setPaymentTime(Date paymentTime) {
        this.paymentTime = paymentTime;
    }

    public Date getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Date paymentDate) {
        this.paymentDate = paymentDate;
    }

    public String getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
    }

    public String getPaymentMode() {
        return paymentMode;
    }

    public void setPaymentMode(String paymentMode) {
        this.paymentMode = paymentMode;
    }

    public String getPaymentAgains() {
        return paymentAgains;
    }

    public void setPaymentAgains(String paymentAgains) {
        this.paymentAgains = paymentAgains;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public CustomerAccount getCustomerAccount() {
        return CustomerAccount;
    }

    public void setCustomerAccount(CustomerAccount CustomerAccount) {
        this.CustomerAccount = CustomerAccount;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

   
     
     
}
