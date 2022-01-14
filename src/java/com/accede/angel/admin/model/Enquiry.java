/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.admin.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import org.hibernate.annotations.Type;

/**
 *
 * @author Accede
 */
@Entity

public class Enquiry implements java.io.Serializable {

    @Id
    @GeneratedValue
    private int id;
    private String name;
    private String mobile;
    private String email;
    private String EnquiryType;
    private String Reference;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date followupDate;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date EnquiryDate;
    private String custRequirement;
    private String offerGivenByShop;
  @OneToOne(fetch = FetchType.EAGER)
    private CustomerAccount CustomerAccount;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean remove = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean deleteEnquiry = true;
    @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.MERGE)
    private List<EnquiryDetail> enquiryDetail;
    @OneToOne(fetch = FetchType.EAGER)
    private Admin adminOfBranch;

    public boolean isDeleteEnquiry() {
        return deleteEnquiry;
    }

    public void setDeleteEnquiry(boolean deleteEnquiry) {
        this.deleteEnquiry = deleteEnquiry;
    }

  

    public List<EnquiryDetail> getEnquiryDetail() {
        return enquiryDetail;
    }

    public void setEnquiryDetail(List<EnquiryDetail> enquiryDetail) {
        this.enquiryDetail = enquiryDetail;
    }

    public Date getEnquiryDate() {
        return EnquiryDate;
    }

    public Admin getAdminOfBranch() {
        return adminOfBranch;
    }

    public void setAdminOfBranch(Admin adminOfBranch) {
        this.adminOfBranch = adminOfBranch;
    }

    public void setEnquiryDate(Date EnquiryDate) {
        this.EnquiryDate = EnquiryDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEnquiryType() {
        return EnquiryType;
    }

    public void setEnquiryType(String EnquiryType) {
        this.EnquiryType = EnquiryType;
    }

    public Date getFollowupDate() {
        return followupDate;
    }

    public void setFollowupDate(Date followupDate) {
        this.followupDate = followupDate;
    }

    public String getCustRequirement() {
        return custRequirement;
    }

    public void setCustRequirement(String custRequirement) {
        this.custRequirement = custRequirement;
    }

    public String getOfferGivenByShop() {
        return offerGivenByShop;
    }

    public void setOfferGivenByShop(String offerGivenByShop) {
        this.offerGivenByShop = offerGivenByShop;
    }

    public boolean isRemove() {
        return remove;
    }

    public void setRemove(boolean remove) {
        this.remove = remove;
    }

    public CustomerAccount getCustomerAccount() {
        return CustomerAccount;
    }

    public void setCustomerAccount(CustomerAccount CustomerAccount) {
        this.CustomerAccount = CustomerAccount;
    }

    public String getReference() {
        return Reference;
    }

    public void setReference(String Reference) {
        this.Reference = Reference;
    }

    
}
