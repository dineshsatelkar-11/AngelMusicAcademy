/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.sell.model;

import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;

/**
 *
 * @author USER
 */
@Entity
public class PurchaseProduct {
    @Id
    @GeneratedValue
     private long PurchaseID;
    private String invoiceID;
    private String GSTType;
    private String paymentmode;

    public String getGSTType() {
        return GSTType;
    }

    public void setGSTType(String GSTType) {
        this.GSTType = GSTType;
    }
    @ManyToOne()
    @JoinColumn(name = "vendorid")
    private Venderregistration vendorid;
    @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.MERGE)
    private List<PurchaseDetails> purchaseDetails;
    private float grandTotal;
    private float gstpercenatge;
    private float othercharges;
    private float discountamount;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date Purchase_Date;

   
    private float grandsgst;
    private float grandcgst;

    public long getPurchaseID() {
        return PurchaseID;
    }

    public void setPurchaseID(long PurchaseID) {
        this.PurchaseID = PurchaseID;
    }

    public String getInvoiceID() {
        return invoiceID;
    }

    public void setInvoiceID(String invoiceID) {
        this.invoiceID = invoiceID;
    }

    public Venderregistration getVendorid() {
        return vendorid;
    }

    public void setVendorid(Venderregistration vendorid) {
        this.vendorid = vendorid;
    }

    public List<PurchaseDetails> getPurchaseDetails() {
        return purchaseDetails;
    }

    public void setPurchaseDetails(List<PurchaseDetails> purchaseDetails) {
        this.purchaseDetails = purchaseDetails;
    }

    public float getGrandTotal() {
        return grandTotal;
    }

    public void setGrandTotal(float grandTotal) {
        this.grandTotal = grandTotal;
    }

    public Date getPurchase_Date() {
        return Purchase_Date;
    }

    public void setPurchase_Date(Date Purchase_Date) {
        this.Purchase_Date = Purchase_Date;
    }

    public float getGrandsgst() {
        return grandsgst;
    }

    public void setGrandsgst(float grandsgst) {
        this.grandsgst = grandsgst;
    }

    public float getGrandcgst() {
        return grandcgst;
    }

    public void setGrandcgst(float grandcgst) {
        this.grandcgst = grandcgst;
    }

    public float getGrandigst() {
        return grandigst;
    }

    public void setGrandigst(float grandigst) {
        this.grandigst = grandigst;
    }

    public float getGrandtotalquantity() {
        return grandtotalquantity;
    }

    public void setGrandtotalquantity(float grandtotalquantity) {
        this.grandtotalquantity = grandtotalquantity;
    }

    public String getGrandTotalinword() {
        return grandTotalinword;
    }

    public void setGrandTotalinword(String grandTotalinword) {
        this.grandTotalinword = grandTotalinword;
    }
    private float grandigst;
   
    private float grandtotalquantity;
    private String grandTotalinword;
    private float grandTotalGst;

    public float getGrandTotalGst() {
        return grandTotalGst;
    }

    public void setGrandTotalGst(float grandTotalGst) {
        this.grandTotalGst = grandTotalGst;
    }

    public float getGstpercenatge() {
        return gstpercenatge;
    }

    public void setGstpercenatge(float gstpercenatge) {
        this.gstpercenatge = gstpercenatge;
    }

    public float getOthercharges() {
        return othercharges;
    }

    public void setOthercharges(float othercharges) {
        this.othercharges = othercharges;
    }

    public float getDiscountamount() {
        return discountamount;
    }

    public void setDiscountamount(float discountamount) {
        this.discountamount = discountamount;
    }

    public String getPaymentmode() {
        return paymentmode;
    }

    public void setPaymentmode(String paymentmode) {
        this.paymentmode = paymentmode;
    }
   
     
    
}
