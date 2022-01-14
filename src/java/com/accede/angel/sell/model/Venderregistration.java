/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.accede.angel.sell.model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Temporal;
import org.hibernate.annotations.Type;

/**
 *
 * @author a2z
 */
@Entity
public class Venderregistration implements Serializable{
    @Id @GeneratedValue
    private long Id;
    //private String companyName;
    private String vendorname;
    private String Address;
    private String city;
    private String dist;
    private String state;
    private String pin;
    private String Email;
    private String gstnnumber;

    public float getBalanceAmount() {
        return BalanceAmount;
    }

    public void setBalanceAmount(float BalanceAmount) {
        this.BalanceAmount = BalanceAmount;
    }
    private float BalanceAmount;
      @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean Status=true;
     
    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }
       private String contactPersonName;
    private String companyPhone;
    //private String companyemail;
    private String contactPersonMob;

    public long getId() {
        return Id;
    }

    public boolean isStatus() {
        return Status;
    }

    public void setStatus(boolean Status) {
        this.Status = Status;
    }

    public void setId(long Id) {
        this.Id = Id;
    }

    

    public String getVendorname() {
        return vendorname;
    }

    public void setVendorname(String vendorname) {
        this.vendorname = vendorname;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getDist() {
        return dist;
    }

    public void setDist(String dist) {
        this.dist = dist;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getPin() {
        return pin;
    }

    public void setPin(String pin) {
        this.pin = pin;
    }

    

    public String getGstnnumber() {
        return gstnnumber;
    }

    public void setGstnnumber(String gstnnumber) {
        this.gstnnumber = gstnnumber;
    }

    public String getContactPersonName() {
        return contactPersonName;
    }

    public void setContactPersonName(String contactPersonName) {
        this.contactPersonName = contactPersonName;
    }

    public String getCompanyPhone() {
        return companyPhone;
    }

    public void setCompanyPhone(String companyPhone) {
        this.companyPhone = companyPhone;
    }

    

    public String getContactPersonMob() {
        return contactPersonMob;
    }

    public void setContactPersonMob(String contactPersonMob) {
        this.contactPersonMob = contactPersonMob;
    }

    
   
//     @Temporal(javax.persistence.TemporalType.DATE)
//    private Date Dob;
   
    
}
