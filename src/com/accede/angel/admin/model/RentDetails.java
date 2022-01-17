/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.admin.model;

import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Temporal;

/**
 *
 * @author Accede
 */
@Entity
public class RentDetails implements java.io.Serializable {

    @Id
    @GeneratedValue
    private long AccountId;
    private String instrumentName;
    private int instrumentRentCost;
    private int totalamount;
    private int noofdays;

    public String getInstrumentName() {
        return instrumentName;
    }

    public void setInstrumentName(String instrumentName) {
        this.instrumentName = instrumentName;
    }

    public int getInstrumentRentCost() {
        return instrumentRentCost;
    }

    public void setInstrumentRentCost(int instrumentRentCost) {
        this.instrumentRentCost = instrumentRentCost;
    }

    public int getTotalamount() {
        return totalamount;
    }

    public void setTotalamount(int totalamount) {
        this.totalamount = totalamount;
    }

    public int getNoofdays() {
        return noofdays;
    }

    public void setNoofdays(int noofdays) {
        this.noofdays = noofdays;
    }
    
    

    public long getAccountId() {
        return AccountId;
    }

    public void setAccountId(long AccountId) {
        this.AccountId = AccountId;
    }

    @Override
    public String toString() {
        return "RentDetails{" + "instrumentName=" + instrumentName + '}';
    }

}
