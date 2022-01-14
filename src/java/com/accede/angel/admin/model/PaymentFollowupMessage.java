/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.admin.model;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;

/**
 *
 * @author Admin
 */

@Entity
public class PaymentFollowupMessage implements java.io.Serializable {
   

 

    @Id
    @GeneratedValue
    private int id;
  
    private String Description;
    @OneToOne(fetch = FetchType.EAGER)
    private PaymentFollowup PaymentFollowup;
  @Temporal(javax.persistence.TemporalType.DATE)
    private Date followupdate=new Date();
    public Date getFollowupdate() {
        return followupdate;
    }

    public void setFollowupdate(Date followupdate) {
        this.followupdate = followupdate;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public PaymentFollowup getPaymentFollowup() {
        return PaymentFollowup;
    }

    public void setPaymentFollowup(PaymentFollowup PaymentFollowup) {
        this.PaymentFollowup = PaymentFollowup;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

}
