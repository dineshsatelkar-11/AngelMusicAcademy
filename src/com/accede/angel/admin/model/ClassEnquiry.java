/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.accede.angel.admin.model;

import javax.persistence.GeneratedValue;
import java.io.Serializable;
import javax.persistence.CascadeType;
import javax.persistence.Id;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToOne;


/**
 *
 * @author accede
 */
@Entity
public class ClassEnquiry implements Serializable{
@Id @GeneratedValue
private int ClassEnquiryId;
private String FirstName;
private String MiddleName;
private String LastName;
private String Mobile;
private String Email;

@OneToOne(fetch = FetchType.EAGER)
    private Instrument InstrumentName;
private String Days;
private String BatchTiming;
 @OneToOne(fetch = FetchType.EAGER)
    private Admin adminOfBranch;

    public Admin getAdminOfBranch() {
        return adminOfBranch;
    }

    public void setAdminOfBranch(Admin adminOfBranch) {
        this.adminOfBranch = adminOfBranch;
    }
    public int getClassEnquiryId() {
        return ClassEnquiryId;
    }

    public void setClassEnquiryId(int ClassEnquiryId) {
        this.ClassEnquiryId = ClassEnquiryId;
    }

    public String getFirstName() {
        return FirstName;
    }

    public void setFirstName(String FirstName) {
        this.FirstName = FirstName;
    }

    public String getMiddleName() {
        return MiddleName;
    }

    public void setMiddleName(String MiddleName) {
        this.MiddleName = MiddleName;
    }

    public String getLastName() {
        return LastName;
    }

    public void setLastName(String LastName) {
        this.LastName = LastName;
    }

    public String getMobile() {
        return Mobile;
    }

    public void setMobile(String Mobile) {
        this.Mobile = Mobile;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public Instrument getInstrumentName() {
        return InstrumentName;
    }

    public void setInstrumentName(Instrument InstrumentName) {
        this.InstrumentName = InstrumentName;
    }

   

    public String getDays() {
        return Days;
    }

    public void setDays(String Days) {
        this.Days = Days;
    }

    public String getBatchTiming() {
        return BatchTiming;
    }

    public void setBatchTiming(String BatchTiming) {
        this.BatchTiming = BatchTiming;
    }

}
