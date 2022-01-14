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
@Table(name = "Rent")
public class Rent implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue
    private long Id;
   
   
   
    private String IdProofType;
    private String customerIdProof;
    private String paymode;

     @OneToOne(fetch = FetchType.EAGER)
    private CustomerAccount CustomerAccount;
    
   
    @OneToOne(fetch = FetchType.EAGER)
    private Admin adminOfBranch;
 


    private int totalamt=0;
    private int noOfDays=0;
    private int extraDays=0;
    private int securityDeposite=0;
    private int discper=0;
    private int other=0;
    private int discamt=0;
    private int FinalAmount=0;
   
    private int Paid_ByCust=0;
    private int Return_by_Shop=0;
  

    private String rentNo;
  private String amountinWord;
  
    @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.MERGE)
    private List<RentDetails> rentDetails;
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
    public boolean isDuedateSmsstatus() {
        return duedateSmsstatus;
    }

    public void setDuedateSmsstatus(boolean duedateSmsstatus) {
        this.duedateSmsstatus = duedateSmsstatus;
    }

    public int getNoOfDays() {
        return noOfDays;
    }

    public void setNoOfDays(int noOfDays) {
        this.noOfDays = noOfDays;
    }

    public String getRentNo() {
        return rentNo;
    }

  

    public int getSecurityDeposite() {
        return securityDeposite;
    }

    public void setSecurityDeposite(int securityDeposite) {
        this.securityDeposite = securityDeposite;
    }

    public void setRentNo(String rentNo) {
        this.rentNo = rentNo;
    }

    public List<RentDetails> getRentDetails() {
        return rentDetails;
    }

    public void setRentDetails(List<RentDetails> rentDetails) {
        this.rentDetails = rentDetails;
    }



    public boolean isCloseRequest() {
        return CloseRequest;
    }

    public void setCloseRequest(boolean CloseRequest) {
        this.CloseRequest = CloseRequest;
    }


    public String getIdProofType() {
        return IdProofType;
    }

    public void setIdProofType(String IdProofType) {
        this.IdProofType = IdProofType;
    }

    public String getCustomerIdProof() {
        return customerIdProof;
    }

    public void setCustomerIdProof(String customerIdProof) {
        this.customerIdProof = customerIdProof;
    }

    public Admin getAdminOfBranch() {
        return adminOfBranch;
    }

    public void setAdminOfBranch(Admin adminOfBranch) {
        this.adminOfBranch = adminOfBranch;
    }

    public Date getFromDate() {
        return fromDate;
    }

    public void setFromDate(Date fromDate) {
        this.fromDate = fromDate;
    }

   


    public long getId() {
        return Id;
    }

    public void setId(long Id) {
        this.Id = Id;
    }

    
   

    public Date getReceivedDate() {
        return receivedDate;
    }

    public void setReceivedDate(Date receivedDate) {
        this.receivedDate = receivedDate;
    }

   

    public Date getRequestClosedDate() {
        return requestClosedDate;
    }

    public void setRequestClosedDate(Date requestClosedDate) {
        this.requestClosedDate = requestClosedDate;
    }

    public Date getDuedateSmsdate() {
        return duedateSmsdate;
    }

    public void setDuedateSmsdate(Date duedateSmsdate) {
        this.duedateSmsdate = duedateSmsdate;
    }

    public CustomerAccount getCustomerAccount() {
        return CustomerAccount;
    }

    public void setCustomerAccount(CustomerAccount CustomerAccount) {
        this.CustomerAccount = CustomerAccount;
    }

    public String getPaymode() {
        return paymode;
    }

    public void setPaymode(String paymode) {
        this.paymode = paymode;
    }

    public int getTotalamt() {
        return totalamt;
    }

    public void setTotalamt(int totalamt) {
        this.totalamt = totalamt;
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

   

    public int getPaid_ByCust() {
        return Paid_ByCust;
    }

    public void setPaid_ByCust(int Paid_ByCust) {
        this.Paid_ByCust = Paid_ByCust;
    }

    public int getReturn_by_Shop() {
        return Return_by_Shop;
    }

    public void setReturn_by_Shop(int Return_by_Shop) {
        this.Return_by_Shop = Return_by_Shop;
    }

    public String getAmountinWord() {
        return amountinWord;
    }

    public void setAmountinWord(String amountinWord) {
        this.amountinWord = amountinWord;
    }

    public int getOther() {
        return other;
    }

    public void setOther(int other) {
        this.other = other;
    }

    @Override
    public String toString() {
        return "Rent{" + "Id=" + Id + ", IdProofType=" + IdProofType + ", customerIdProof=" + customerIdProof + ", paymode=" + paymode + ", CustomerAccount=" + CustomerAccount + ", adminOfBranch=" + adminOfBranch + ", totalamt=" + totalamt + ", noOfDays=" + noOfDays + ", extraDays=" + extraDays + ", securityDeposite=" + securityDeposite + ", discper=" + discper + ", other=" + other + ", discamt=" + discamt + ", FinalAmount=" + FinalAmount + ", Paid_ByCust=" + Paid_ByCust + ", Return_by_Shop=" + Return_by_Shop + ", rentNo=" + rentNo + ", amountinWord=" + amountinWord + ", rentDetails=" + rentDetails + ", CloseRequest=" + CloseRequest + ", duedateSmsstatus=" + duedateSmsstatus + ", duedateSmsdate=" + duedateSmsdate + ", receivedDate=" + receivedDate + ", fromDate=" + fromDate + ", requestClosedDate=" + requestClosedDate + '}';
    }

   
}
