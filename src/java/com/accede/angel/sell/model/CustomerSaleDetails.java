/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.accede.angel.sell.model;

import java.util.Date;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;

/**
 *
 * @author asd
 */
@Entity
public class CustomerSaleDetails {
    @Id @GeneratedValue
     private int id;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date date = new Date();
  
    private long productquantity;
   
  
  
   
    private float gross_amount;
//    private float gst_percenatge;
//    private float gstamount;
   
    private float PurchasePrice;
    private float mrpprice;
  
  
  
     @OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.MERGE)
    private ProductModel product;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

  
    public long getProductquantity() {
        return productquantity;
    }

    public void setProductquantity(long productquantity) {
        this.productquantity = productquantity;
    }

  


    public float getPurchasePrice() {
        return PurchasePrice;
    }

    public void setPurchasePrice(float PurchasePrice) {
        this.PurchasePrice = PurchasePrice;
    }

    public float getMrpprice() {
        return mrpprice;
    }

    public void setMrpprice(float mrpprice) {
        this.mrpprice = mrpprice;
    }

    
    public ProductModel getProduct() {
        return product;
    }

    public void setProduct(ProductModel product) {
        this.product = product;
    }

    public float getGross_amount() {
        return gross_amount;
    }

    public void setGross_amount(float gross_amount) {
        this.gross_amount = gross_amount;
    }
//
//    public float getGst_percenatge() {
//        return gst_percenatge;
//    }
//
//    public void setGst_percenatge(float gst_percenatge) {
//        this.gst_percenatge = gst_percenatge;
//    }
//
//    public float getGstamount() {
//        return gstamount;
//    }
//
//    public void setGstamount(float gstamount) {
//        this.gstamount = gstamount;
//    }
//
//   
    
    
    
}
