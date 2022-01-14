/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.admin.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.hibernate.annotations.Type;

/**
 *
 * @author Accede
 */
@Entity
@Table(name = "Repair")
public class Repair implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue
    private long repairId;
  
  
    private String paymode;

     @OneToOne(fetch = FetchType.EAGER)
    private CustomerAccount CustomerAccount;
    
   
    @OneToOne(fetch = FetchType.EAGER)
    private Admin adminOfBranch;
 


    private int totalamt=0;
    private int noOfDays=0;
    private int extraDays=0;
    private int Paid=0;
    private int discper=0;
    private int other=0;
    private int discamt=0;
    private int FinalAmount=0;
   
    private int Bal=0;
 
  

    private String repairNo;
  private String amountinWord;
  
    @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.MERGE)
    private List<RepairDetails> repairDetails;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean CloseRequest = true;
  @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean duedateSmsstatus = true;
  @Temporal(javax.persistence.TemporalType.DATE)
    private Date duedateSmsdate =new Date();
      @Temporal(TemporalType.TIMESTAMP)
    private Date receivedDate;
     @Temporal(TemporalType.TIMESTAMP)
      private Date fromDate=new Date();
     @Temporal(TemporalType.DATE)
    private Date requestClosedDate=new Date();

    public long getRepairId() {
        return repairId;
    }

    public void setRepairId(long repairId) {
        this.repairId = repairId;
    }

    public String getPaymode() {
        return paymode;
    }

    public void setPaymode(String paymode) {
        this.paymode = paymode;
    }

    public CustomerAccount getCustomerAccount() {
        return CustomerAccount;
    }

    public void setCustomerAccount(CustomerAccount CustomerAccount) {
        this.CustomerAccount = CustomerAccount;
    }

    public Admin getAdminOfBranch() {
        return adminOfBranch;
    }

    public void setAdminOfBranch(Admin adminOfBranch) {
        this.adminOfBranch = adminOfBranch;
    }

    public int getTotalamt() {
        return totalamt;
    }

    public void setTotalamt(int totalamt) {
        this.totalamt = totalamt;
    }

    public int getNoOfDays() {
        return noOfDays;
    }

    public void setNoOfDays(int noOfDays) {
        this.noOfDays = noOfDays;
    }

    public int getExtraDays() {
        return extraDays;
    }

    public void setExtraDays(int extraDays) {
        this.extraDays = extraDays;
    }

 

    public int getDiscper() {
        return discper;
    }

    public void setDiscper(int discper) {
        this.discper = discper;
    }

    public int getOther() {
        return other;
    }

    public void setOther(int other) {
        this.other = other;
    }

    public int getDiscamt() {
        return discamt;
    }

    public void setDiscamt(int discamt) {
        this.discamt = discamt;
    }

    public int getFinalAmount() {
        return FinalAmount;
    }

    public void setFinalAmount(int FinalAmount) {
        this.FinalAmount = FinalAmount;
    }

   

    public String getRepairNo() {
        return repairNo;
    }

    public void setRepairNo(String repairNo) {
        this.repairNo = repairNo;
    }

    public String getAmountinWord() {
        return amountinWord;
    }

    public void setAmountinWord(String amountinWord) {
        this.amountinWord = amountinWord;
    }

    public List<RepairDetails> getRepairDetails() {
        return repairDetails;
    }

    public void setRepairDetails(List<RepairDetails> repairDetails) {
        this.repairDetails = repairDetails;
    }

    public boolean isCloseRequest() {
        return CloseRequest;
    }

    public void setCloseRequest(boolean CloseRequest) {
        this.CloseRequest = CloseRequest;
    }

    public boolean isDuedateSmsstatus() {
        return duedateSmsstatus;
    }

    public void setDuedateSmsstatus(boolean duedateSmsstatus) {
        this.duedateSmsstatus = duedateSmsstatus;
    }

    public Date getDuedateSmsdate() {
        return duedateSmsdate;
    }

    public void setDuedateSmsdate(Date duedateSmsdate) {
        this.duedateSmsdate = duedateSmsdate;
    }

    public Date getReceivedDate() {
        return receivedDate;
    }

    public void setReceivedDate(Date receivedDate) {
        this.receivedDate = receivedDate;
    }

    public Date getFromDate() {
        return fromDate;
    }

    public void setFromDate(Date fromDate) {
        this.fromDate = fromDate;
    }

    public Date getRequestClosedDate() {
        return requestClosedDate;
    }

    public void setRequestClosedDate(Date requestClosedDate) {
        this.requestClosedDate = requestClosedDate;
    }

    public int getPaid() {
        return Paid;
    }

    public void setPaid(int Paid) {
        this.Paid = Paid;
    }

    public int getBal() {
        return Bal;
    }

    public void setBal(int Bal) {
        this.Bal = Bal;
    }

    @Override
    public String toString() {
        return "Repair{" + "repairId=" + repairId + ", paymode=" + paymode + ", CustomerAccount=" + CustomerAccount + ", adminOfBranch=" + adminOfBranch + ", totalamt=" + totalamt + ", noOfDays=" + noOfDays + ", extraDays=" + extraDays + ", Paid=" + Paid + ", discper=" + discper + ", other=" + other + ", discamt=" + discamt + ", FinalAmount=" + FinalAmount + ", Bal=" + Bal + ", repairNo=" + repairNo + ", amountinWord=" + amountinWord + ", repairDetails=" + repairDetails + ", CloseRequest=" + CloseRequest + ", duedateSmsstatus=" + duedateSmsstatus + ", duedateSmsdate=" + duedateSmsdate + ", receivedDate=" + receivedDate + ", fromDate=" + fromDate + ", requestClosedDate=" + requestClosedDate + '}';
    }
  
    

}
