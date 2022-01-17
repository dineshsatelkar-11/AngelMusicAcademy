/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.sell.model;

import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;

/**
 *
 * @author USER
 */
@Entity
public class PurchaseDetails {

    @Id
    @GeneratedValue
    private long PurchaseDetailId;
   
    private float Total;
    private long Quantity;
    private float PurchasePrice;
    private float cgstamount;
    private float sgstamount;
    private float igstamount;
   
    private float cgstper;
    private float sgstper;
    private float igstper;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date Purchase_Date;
     private float FinalAmount;

    @OneToOne(fetch = FetchType.EAGER)
    private ProductModel productModel;
    public float getFinalAmount() {
        return FinalAmount;
    }

    public void setFinalAmount(float FinalAmount) {
        this.FinalAmount = FinalAmount;
    }
   

    public Date getPurchase_Date() {
        return Purchase_Date;
    }

    public void setPurchase_Date(Date Purchase_Date) {
        this.Purchase_Date = Purchase_Date;
    }

    public float getTaxableAmount() {
        return taxableAmount;
    }

    public void setTaxableAmount(float taxableAmount) {
        this.taxableAmount = taxableAmount;
    }
    private float taxableAmount;

    public long getPurchaseDetailId() {
        return PurchaseDetailId;
    }

    public void setPurchaseDetailId(long PurchaseDetailId) {
        this.PurchaseDetailId = PurchaseDetailId;
    }

    
   

    public float getCgstamount() {
        return cgstamount;
    }

    public void setCgstamount(float cgstamount) {
        this.cgstamount = cgstamount;
    }

    public float getCgstper() {
        return cgstper;
    }

    public float getPurchasePrice() {
        return PurchasePrice;
    }

    public void setPurchasePrice(float PurchasePrice) {
        this.PurchasePrice = PurchasePrice;
    }

    public void setCgstper(float cgstper) {
        this.cgstper = cgstper;
    }

    public float getSgstper() {
        return sgstper;
    }

    public void setSgstper(float sgstper) {
        this.sgstper = sgstper;
    }

    public float getIgstper() {
        return igstper;
    }

    public void setIgstper(float igstper) {
        this.igstper = igstper;
    }

    public float getSgstamount() {
        return sgstamount;
    }

    public void setSgstamount(float sgstamount) {
        this.sgstamount = sgstamount;
    }

    public float getIgstamount() {
        return igstamount;
    }

    public void setIgstamount(float igstamount) {
        this.igstamount = igstamount;
    }

    public float getTotal() {
        return Total;
    }

    public void setTotal(float Total) {
        this.Total = Total;
    }

    public long getQuantity() {
        return Quantity;
    }

    public void setQuantity(long Quantity) {
        this.Quantity = Quantity;
    }

    public ProductModel getProductModel() {
        return productModel;
    }

    public void setProductModel(ProductModel productModel) {
        this.productModel = productModel;
    }

}
