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

/**
 *
 * @author Admin
 */
@Entity
public class StudentVanishHistory implements java.io.Serializable {

    @Id
    @GeneratedValue
       private int id;
       private int balanceamount;
       private int deductionamount;
       private String Status;
    @OneToOne(fetch = FetchType.EAGER)
    private Admin adminOfBranch;
    @OneToOne(fetch = FetchType.EAGER)
    private CustomerAccount CustomerAccount;
    @OneToOne(fetch = FetchType.EAGER)
    private Admission Admission;
       @Temporal(javax.persistence.TemporalType.DATE)
    private Date fromDate=new Date();

    @Temporal(javax.persistence.TemporalType.DATE)
    private Date tillDate=new Date();

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getBalanceamount() {
        return balanceamount;
    }

    public void setBalanceamount(int balanceamount) {
        this.balanceamount = balanceamount;
    }

    public int getDeductionamount() {
        return deductionamount;
    }

    public void setDeductionamount(int deductionamount) {
        this.deductionamount = deductionamount;
    }

    public Admin getAdminOfBranch() {
        return adminOfBranch;
    }

    public void setAdminOfBranch(Admin adminOfBranch) {
        this.adminOfBranch = adminOfBranch;
    }

    public CustomerAccount getCustomerAccount() {
        return CustomerAccount;
    }

    public void setCustomerAccount(CustomerAccount CustomerAccount) {
        this.CustomerAccount = CustomerAccount;
    }

    public Admission getAdmission() {
        return Admission;
    }

    public void setAdmission(Admission Admission) {
        this.Admission = Admission;
    }

    public Date getFromDate() {
        return fromDate;
    }

    public void setFromDate(Date fromDate) {
        this.fromDate = fromDate;
    }

    public Date getTillDate() {
        return tillDate;
    }

    public void setTillDate(Date tillDate) {
        this.tillDate = tillDate;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String Status) {
        this.Status = Status;
    }
    
    
}
