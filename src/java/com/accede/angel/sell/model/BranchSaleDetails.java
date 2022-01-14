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
public class BranchSaleDetails {

    @Id
    @GeneratedValue
    private int id ;
    @OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.MERGE)
    private ProductModel product;
    private long productquantity;
    private String productname;
    
    
  
    private String Hsn="NA";
    private float PurchasePrice;
    private float UnitPrice=0.0f;
    private float Cgst=0.0f;
    private float Sgst=0.0f;
    private float Igst=0.0f;
    private float Discountper=0.0f;
    
     @Temporal(javax.persistence.TemporalType.DATE)
    private Date date=new Date();

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public ProductModel getProduct() {
        return product;
    }

    public void setProduct(ProductModel product) {
        this.product = product;
    }

    public long getProductquantity() {
        return productquantity;
    }

    public void setProductquantity(long productquantity) {
        this.productquantity = productquantity;
    }

    public String getProductname() {
        return productname;
    }

    public void setProductname(String productname) {
        this.productname = productname;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getHsn() {
        return Hsn;
    }

    public void setHsn(String Hsn) {
        this.Hsn = Hsn;
    }

    public float getPurchasePrice() {
        return PurchasePrice;
    }

    public void setPurchasePrice(float PurchasePrice) {
        this.PurchasePrice = PurchasePrice;
    }

    public float getUnitPrice() {
        return UnitPrice;
    }

    public void setUnitPrice(float UnitPrice) {
        this.UnitPrice = UnitPrice;
    }

    public float getCgst() {
        return Cgst;
    }

    public void setCgst(float Cgst) {
        this.Cgst = Cgst;
    }

    public float getSgst() {
        return Sgst;
    }

    public void setSgst(float Sgst) {
        this.Sgst = Sgst;
    }

    public float getIgst() {
        return Igst;
    }

    public void setIgst(float Igst) {
        this.Igst = Igst;
    }

    public float getDiscountper() {
        return Discountper;
    }

    public void setDiscountper(float Discountper) {
        this.Discountper = Discountper;
    }

   

}
