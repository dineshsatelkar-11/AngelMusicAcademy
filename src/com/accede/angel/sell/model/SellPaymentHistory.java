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

/**
 *
 * @author Admin
 */
@Entity
public class SellPaymentHistory {

    @Id
    @GeneratedValue
    private int id;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date date = new Date();
    private float paidamt;
    @OneToOne(fetch = FetchType.EAGER)
    private CustomerAccount CustomerAccount;
    @OneToOne(fetch = FetchType.EAGER)
    private CustomerSale CustomerSale;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public float getPaidamt() {
        return paidamt;
    }

    public void setPaidamt(float paidamt) {
        this.paidamt = paidamt;
    }

    public CustomerAccount getCustomerAccount() {
        return CustomerAccount;
    }

    public void setCustomerAccount(CustomerAccount CustomerAccount) {
        this.CustomerAccount = CustomerAccount;
    }

    public CustomerSale getCustomerSale() {
        return CustomerSale;
    }

    public void setCustomerSale(CustomerSale CustomerSale) {
        this.CustomerSale = CustomerSale;
    }

    
    
    
    
}
