/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.angel.musicacademy.model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author Accede
 */
@Entity
@Table(name = "repair")
public class Repair implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue
    private long repairId;
    private String counsellorName;
    private Date receivedDate = new Date();
    private String customerFirstName;
     private String customerMiddleName;
        private String customerLastName;
    private String problem;
    @Temporal(TemporalType.DATE)
   	private Date returnDate;
   
    public Date getReturnDate() {
		return returnDate;
	}

	public void setReturnDate(Date returnDate) {
		this.returnDate = returnDate;
	}
	private int quantity;
   

    public String getCustomerFirstName() {
        return customerFirstName;
    }

    public void setCustomerFirstName(String customerFirstName) {
        this.customerFirstName = customerFirstName;
    }
    private String customerMobileNo;
    private long repairingCost;
    private long advancePaid;
    private long discount;
    private long balanceAmount;
     private String customerAlternateNo;

    public long getRepairId() {
        return repairId;
    }

    public String getCustomerAlternateNo() {
        return customerAlternateNo;
    }

    public void setCustomerAlternateNo(String customerAlternateNo) {
        this.customerAlternateNo = customerAlternateNo;
    }

    public void setRepairId(long repairId) {
        this.repairId = repairId;
    }

    public String getCounsellorName() {
        return counsellorName;
    }

    public void setCounsellorName(String counsellorName) {
        this.counsellorName = counsellorName;
    }

    public String getCustomerMiddleName() {
        return customerMiddleName;
    }

    public void setCustomerMiddleName(String customerMiddleName) {
        this.customerMiddleName = customerMiddleName;
    }

    public String getCustomerLastName() {
        return customerLastName;
    }

    public String getCustomerMobileNo() {
        return customerMobileNo;
    }

    public void setCustomerMobileNo(String customerMobileNo) {
        this.customerMobileNo = customerMobileNo;
    }

    public void setCustomerLastName(String customerLastName) {
        this.customerLastName = customerLastName;
    }

    public Date getReceivedDate() {
        return receivedDate;
    }

    public void setReceivedDate(Date receivedDate) {
        this.receivedDate = receivedDate;
    }

   

    public String getProblem() {
        return problem;
    }

    public void setProblem(String problem) {
        this.problem = problem;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    

    public long getRepairingCost() {
        return repairingCost;
    }

    public void setRepairingCost(long repairingCost) {
        this.repairingCost = repairingCost;
    }

    public long getAdvancePaid() {
        return advancePaid;
    }

    public void setAdvancePaid(long advancePaid) {
        this.advancePaid = advancePaid;
    }

    public long getDiscount() {
        return discount;
    }

    public void setDiscount(long discount) {
        this.discount = discount;
    }

    public long getBalanceAmount() {
        return balanceAmount;
    }

    public void setBalanceAmount(long balanceAmount) {
        this.balanceAmount = balanceAmount;
    }

    public String getBilling() {
        return billing;
    }

    public void setBilling(String billing) {
        this.billing = billing;
    }

    public String getRepairNo() {
        return repairNo;
    }

    public void setRepairNo(String repairNo) {
        this.repairNo = repairNo;
    }

    public String getCustomerAddress() {
        return customerAddress;
    }

    public void setCustomerAddress(String customerAddress) {
        this.customerAddress = customerAddress;
    }

    public Instrument getInstrumentName() {
        return instrumentName;
    }

    public void setInstrumentName(Instrument instrumentName) {
        this.instrumentName = instrumentName;
    }
    private String billing;
     private String repairNo;

    private String customerAddress;
    @OneToOne(fetch = FetchType.EAGER)

    private Instrument instrumentName;

}
