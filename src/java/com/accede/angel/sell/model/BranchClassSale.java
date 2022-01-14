/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.accede.angel.sell.model;

import com.accede.angel.admin.model.Admin;
import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;

/**
 *
 * @author Admin
 */
@Entity
public class BranchClassSale {

    @Id
    @GeneratedValue
    private int id ;
    private int adminid;
    @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.MERGE)
    private List<BranchClassSellDetails> branchsaledetails;
    @OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.MERGE)
    private Admin admin;
   
    private long totalquantity;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date date = new Date();

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

  

    public long getTotalquantity() {
        return totalquantity;
    }

    public void setTotalquantity(long totalquantity) {
        this.totalquantity = totalquantity;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAdminid() {
        return adminid;
    }

    public void setAdminid(int adminid) {
        this.adminid = adminid;
    }

    public List<BranchClassSellDetails> getBranchsaledetails() {
        return branchsaledetails;
    }

    public void setBranchsaledetails(List<BranchClassSellDetails> branchsaledetails) {
        this.branchsaledetails = branchsaledetails;
    }

   
   

    public Admin getAdmin() {
        return admin;
    }

    public void setAdmin(Admin admin) {
        this.admin = admin;
    }

}
