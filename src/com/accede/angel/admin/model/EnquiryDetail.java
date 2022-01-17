/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.admin.model;

import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Temporal;

/**
 *
 * @author Accede
 */
@Entity

public class EnquiryDetail implements java.io.Serializable {

    @Id
    @GeneratedValue
    private int id;
    private String remark;
    private String counsellorName;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date followupDate;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date LastFollowupDate;

    public int getId() {
        return id;
    }

    public String getCounsellorName() {
        return counsellorName;
    }

    public void setCounsellorName(String counsellorName) {
        this.counsellorName = counsellorName;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Date getFollowupDate() {
        return followupDate;
    }

    public void setFollowupDate(Date followupDate) {
        this.followupDate = followupDate;
    }

    public Date getLastFollowupDate() {
        return LastFollowupDate;
    }

    public void setLastFollowupDate(Date LastFollowupDate) {
        this.LastFollowupDate = LastFollowupDate;
    }

}
