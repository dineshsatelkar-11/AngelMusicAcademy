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
 * @author asd
 */
@Entity
public class AccountHistory {
    
    
      @Id
    @GeneratedValue
    private long Id;
     private String bankName;
    private String transctionNo;
  
    private String paymentMode;
    private String paymentAgains;
    private int amount;
     @Temporal(TemporalType.TIMESTAMP)
    private Date paymentTime=new Date();
     @Temporal(TemporalType.DATE)
    private Date paymentDate=new Date();
 @OneToOne(fetch = FetchType.EAGER)
    private Admin adminOfBranch;
 @OneToOne(fetch = FetchType.EAGER)
    private ExternalAccount ExternalAccount;

    public long getId() {
        return Id;
    }

    public void setId(long Id) {
        this.Id = Id;
    }

    public String getBankName() {
        return bankName;
    }

    public void setBankName(String bankName) {
        this.bankName = bankName;
    }

    public String getTransctionNo() {
        return transctionNo;
    }

    public void setTransctionNo(String transctionNo) {
        this.transctionNo = transctionNo;
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

    public Admin getAdminOfBranch() {
        return adminOfBranch;
    }

    public void setAdminOfBranch(Admin adminOfBranch) {
        this.adminOfBranch = adminOfBranch;
    }

    public ExternalAccount getExternalAccount() {
        return ExternalAccount;
    }

    public void setExternalAccount(ExternalAccount ExternalAccount) {
        this.ExternalAccount = ExternalAccount;
    }
 
 
 

}
