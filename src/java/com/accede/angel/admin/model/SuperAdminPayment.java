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
 * @author Admin
 */
@Entity
public class SuperAdminPayment {
    @Id
    @GeneratedValue
    private long Id;
    
    private String paymentType;
    private String paymentMode;
    private String paymentAgainsType;
    private String paymentAgains;
    private String Description;
    private int amount;
    
     @Temporal(TemporalType.TIMESTAMP)
    private Date paymentTime=new Date();
     @Temporal(TemporalType.DATE)
    private Date paymentDate=new Date();

    public long getId() {
        return Id;
    }

    public void setId(long Id) {
        this.Id = Id;
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

    public String getPaymentAgainsType() {
        return paymentAgainsType;
    }

    public void setPaymentAgainsType(String paymentAgainsType) {
        this.paymentAgainsType = paymentAgainsType;
    }

    public String getPaymentAgains() {
        return paymentAgains;
    }

    public void setPaymentAgains(String paymentAgains) {
        this.paymentAgains = paymentAgains;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
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
     
     
     
}
