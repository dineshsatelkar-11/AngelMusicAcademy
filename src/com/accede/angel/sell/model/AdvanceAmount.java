/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.sell.model;

import com.accede.angel.admin.model.CustomerAccount;
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
public class AdvanceAmount {

    @Id
    @GeneratedValue

    private int id;
    private int amount;
    private String reason;
    @OneToOne(fetch = FetchType.EAGER)
    private CustomerAccount CustomerAccount;
    @Temporal(TemporalType.TIMESTAMP)
    private Date paymentTime = new Date();
    @Temporal(TemporalType.DATE)
    private Date paymentDate = new Date();
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date DueDate;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public CustomerAccount getCustomerAccount() {
        return CustomerAccount;
    }

    public void setCustomerAccount(CustomerAccount CustomerAccount) {
        this.CustomerAccount = CustomerAccount;
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

    public Date getDueDate() {
        return DueDate;
    }

    public void setDueDate(Date DueDate) {
        this.DueDate = DueDate;
    }

    
    
    
}
