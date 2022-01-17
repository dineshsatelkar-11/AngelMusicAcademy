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
public class RepairDetails implements java.io.Serializable {

    @Id
    @GeneratedValue
    private long AccountId;
    private String instrumentName;
    private String instrumentBrand;
    private String instrumentModel;
    private String instrumentRemark;
    private int instrumentRepairCost;
 
    public long getAccountId() {
        return AccountId;
    }

    public void setAccountId(long AccountId) {
        this.AccountId = AccountId;
    }

    public String getInstrumentName() {
        return instrumentName;
    }

    public void setInstrumentName(String instrumentName) {
        this.instrumentName = instrumentName;
    }

    public String getInstrumentBrand() {
        return instrumentBrand;
    }

    public void setInstrumentBrand(String instrumentBrand) {
        this.instrumentBrand = instrumentBrand;
    }

    public String getInstrumentModel() {
        return instrumentModel;
    }

    public void setInstrumentModel(String instrumentModel) {
        this.instrumentModel = instrumentModel;
    }

    public int getInstrumentRepairCost() {
        return instrumentRepairCost;
    }

    public void setInstrumentRepairCost(int instrumentRepairCost) {
        this.instrumentRepairCost = instrumentRepairCost;
    }

    public String getInstrumentRemark() {
        return instrumentRemark;
    }

    public void setInstrumentRemark(String instrumentRemark) {
        this.instrumentRemark = instrumentRemark;
    }

   
   
}
