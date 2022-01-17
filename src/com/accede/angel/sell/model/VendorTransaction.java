/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.sell.model;

import com.accede.angel.sell.model.Venderregistration;
import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import javax.persistence.OneToOne;
import javax.persistence.Temporal;

/**
 *
 * @author USER
 */
@Entity
public class VendorTransaction implements Serializable {

    @Id
    @GeneratedValue
    private long id;
    
    @OneToOne(fetch = FetchType.EAGER)
    private Venderregistration vendorid;
    private float TransactionAmount;

    private String Reason;
    private long Vendor_Id;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date Transaction_Date;

    public Date getTransaction_Date() {
        return Transaction_Date;
    }

    public void setTransaction_Date(Date Transaction_Date) {
        this.Transaction_Date = Transaction_Date;
    }

    public void setVendor_Id(int Vendor_Id) {
        this.Vendor_Id = Vendor_Id;
    }

    public long getVendor_Id() {
        return Vendor_Id;
    }

    public void setVendor_Id(long Vendor_Id) {
        this.Vendor_Id = Vendor_Id;
    }

    public String getTransactionType() {
        return TransactionType;
    }

    public void setTransactionType(String TransactionType) {
        this.TransactionType = TransactionType;
    }

    private String TransactionType;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Venderregistration getVendorid() {
        return vendorid;
    }

    public void setVendorid(Venderregistration vendorid) {
        this.vendorid = vendorid;
    }

    public float getTransactionAmount() {
        return TransactionAmount;
    }

    public void setTransactionAmount(float TransactionAmount) {
        this.TransactionAmount = TransactionAmount;
    }

    public String getReason() {
        return Reason;
    }

    public void setReason(String Reason) {
        this.Reason = Reason;
    }

}
