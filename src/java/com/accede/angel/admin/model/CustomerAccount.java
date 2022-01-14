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
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author Admin
 */
@Entity
@Table(name = "CustomerAccount")
public class CustomerAccount {
      @Id
    @GeneratedValue
    private int Id;
  
   
    private String Name;
   
     private String MobileNo;
     private String Email;
     private String Address;
       private String Image = "Student.jpg";
      @OneToOne(fetch = FetchType.EAGER)
    private Admin adminOfBranch;
     private float AccountBalance;
     private float AdvanceAmount;
  private String IdProofType="NA";
    private String customerIdProof="NA";
    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

  

   

   
    

    public String getMobileNo() {
        return MobileNo;
    }

    public void setMobileNo(String MobileNo) {
        this.MobileNo = MobileNo;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public float getAccountBalance() {
        return AccountBalance;
    }

    public void setAccountBalance(float AccountBalance) {
        this.AccountBalance = AccountBalance;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public Admin getAdminOfBranch() {
        return adminOfBranch;
    }

    public void setAdminOfBranch(Admin adminOfBranch) {
        this.adminOfBranch = adminOfBranch;
    }

    public String getImage() {
        return Image;
    }

    public void setImage(String Image) {
        this.Image = Image;
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

    public float getAdvanceAmount() {
        return AdvanceAmount;
    }

    public void setAdvanceAmount(float AdvanceAmount) {
        this.AdvanceAmount = AdvanceAmount;
    }

    @Override
    public String toString() {
        return "CustomerAccount{" + "Id=" + Id + ", Name=" + Name + ", MobileNo=" + MobileNo + ", Email=" + Email + ", Address=" + Address + ", adminOfBranch=" + adminOfBranch + ", AccountBalance=" + AccountBalance + '}';
    }

   

   

    
     
     
     
}
