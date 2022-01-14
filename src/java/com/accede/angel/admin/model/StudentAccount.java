/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.admin.model;

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
 * @author Accede
 */
@Entity

public class StudentAccount implements Serializable {

    @Id
    @GeneratedValue
    private long AccountId;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date paymentDate = new Date();
    private String PaymentMode;
    private String FeeType;

    private String amountinWord;

    private int previousBalance=0;

    private int packageFee;
    private int discper;
    private int disamount;
    private int finalamount;
    private int paid;
    private int totalremfee;

    private String CourseName;
    private String Days;
    private String Batches;
    @OneToOne(fetch = FetchType.EAGER)
    private CustomerAccount CustomerAccount;
    private String packagename;
    private String description;

    private int noofdays;
    private int noofcourse;
    private int noofBatchTimes;
   
    private int courseDuration;
  

    @Temporal(javax.persistence.TemporalType.DATE)
    private Date nextPaymentDate;

    public int getPreviousBalance() {
        return previousBalance;
    }

    public void setPreviousBalance(int previousBalance) {
        this.previousBalance = previousBalance;
    }

    public long getAccountId() {
        return AccountId;
    }

  
    public int getDiscper() {
        return discper;
    }

    public void setDiscper(int discper) {
        this.discper = discper;
    }

    public int getDisamount() {
        return disamount;
    }

    public void setDisamount(int disamount) {
        this.disamount = disamount;
    }

    public int getFinalamount() {
        return finalamount;
    }

    public void setFinalamount(int finalamount) {
        this.finalamount = finalamount;
    }

   

    public int getTotalremfee() {
        return totalremfee;
    }

    public void setTotalremfee(int totalremfee) {
        this.totalremfee = totalremfee;
    }

    public void setAccountId(long AccountId) {
        this.AccountId = AccountId;
    }

    public Date getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Date paymentDate) {
        this.paymentDate = paymentDate;
    }

    public String getPaymentMode() {
        return PaymentMode;
    }

    public void setPaymentMode(String PaymentMode) {
        this.PaymentMode = PaymentMode;
    }

    public String getAmountinWord() {
        return amountinWord;
    }

    public void setAmountinWord(String amountinWord) {
        this.amountinWord = amountinWord;
    }

    public String getCourseName() {
        return CourseName;
    }

    public void setCourseName(String CourseName) {
        this.CourseName = CourseName;
    }

    public String getDays() {
        return Days;
    }

    public void setDays(String Days) {
        this.Days = Days;
    }

    public String getBatches() {
        return Batches;
    }

    public void setBatches(String Batches) {
        this.Batches = Batches;
    }

    public CustomerAccount getCustomerAccount() {
        return CustomerAccount;
    }

    public void setCustomerAccount(CustomerAccount CustomerAccount) {
        this.CustomerAccount = CustomerAccount;
    }

    public Date getNextPaymentDate() {
        return nextPaymentDate;
    }

    public void setNextPaymentDate(Date nextPaymentDate) {
        this.nextPaymentDate = nextPaymentDate;
    }

    public String getPackagename() {
        return packagename;
    }

    public void setPackagename(String packagename) {
        this.packagename = packagename;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getNoofdays() {
        return noofdays;
    }

    public void setNoofdays(int noofdays) {
        this.noofdays = noofdays;
    }

    public int getNoofcourse() {
        return noofcourse;
    }

    public void setNoofcourse(int noofcourse) {
        this.noofcourse = noofcourse;
    }

    public int getNoofBatchTimes() {
        return noofBatchTimes;
    }

    public void setNoofBatchTimes(int noofBatchTimes) {
        this.noofBatchTimes = noofBatchTimes;
    }

   
  

    public int getCourseDuration() {
        return courseDuration;
    }

    public void setCourseDuration(int courseDuration) {
        this.courseDuration = courseDuration;
    }

    public int getPackageFee() {
        return packageFee;
    }

    public void setPackageFee(int packageFee) {
        this.packageFee = packageFee;
    }

    public int getPaid() {
        return paid;
    }

    public void setPaid(int paid) {
        this.paid = paid;
    }

    public String getFeeType() {
        return FeeType;
    }

    public void setFeeType(String FeeType) {
        this.FeeType = FeeType;
    }

    @Override
    public String toString() {
        return "StudentAccount{" + "AccountId=" + AccountId + ", paymentDate=" + paymentDate + ", PaymentMode=" + PaymentMode + ", FeeType=" + FeeType + ", amountinWord=" + amountinWord + ", previousBalance=" + previousBalance + ", packageFee=" + packageFee + ", discper=" + discper + ", disamount=" + disamount + ", finalamount=" + finalamount + ", paid=" + paid + ", totalremfee=" + totalremfee + ", CourseName=" + CourseName + ", Days=" + Days + ", Batches=" + Batches + ", CustomerAccount=" + CustomerAccount + ", packagename=" + packagename + ", description=" + description + ", noofdays=" + noofdays + ", noofcourse=" + noofcourse + ", noofBatchTimes=" + noofBatchTimes + ", courseDuration=" + courseDuration + ", nextPaymentDate=" + nextPaymentDate + '}';
    }

   
    
    

}
