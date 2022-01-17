package com.accede.angel.admin.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "product")
public class Product implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue
    private int productId;
    private String productName;
//	 @ManyToOne(cascade = CascadeType.ALL,fetch = FetchType.EAGER)
//     @JoinColumn(name = "productName")
//     private Instrument productName;

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    @OneToOne(fetch = FetchType.EAGER)

    private Instrument instrumentName;

    public Instrument getInstrumentName() {
        return instrumentName;
    }

    public void setInstrumentName(Instrument instrumentName) {
        this.instrumentName = instrumentName;
    }
    @ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    private InstrumentSubcategory instrumentSubcategory;
    private String modelNo;
    private String brand;
    private String color;
      private String HSN_Code;
    private float unitPrice;
    private float transportCharge;
    private float sellPrice;
    private float cgst;
    private float sgst;
    private float igst;
    private int quentity = 0;
    private Date productAddedDate = new Date();

    public String getHSN_Code() {
        return HSN_Code;
    }

    public void setHSN_Code(String HSN_Code) {
        this.HSN_Code = HSN_Code;
    }

    public float getCgst() {
        return cgst;
    }

    public void setCgst(float cgst) {
        this.cgst = cgst;
    }

    public float getSgst() {
        return sgst;
    }

    public void setSgst(float sgst) {
        this.sgst = sgst;
    }

    public float getIgst() {
        return igst;
    }

    public void setIgst(float igst) {
        this.igst = igst;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public InstrumentSubcategory getInstrumentSubcategory() {
        return instrumentSubcategory;
    }

    public void setInstrumentSubcategory(InstrumentSubcategory instrumentSubcategory) {
        this.instrumentSubcategory = instrumentSubcategory;
    }

    public String getModelNo() {
        return modelNo;
    }

    public void setModelNo(String modelNo) {
        this.modelNo = modelNo;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public float getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(float unitPrice) {
        this.unitPrice = unitPrice;
    }

    public float getTransportCharge() {
        return transportCharge;
    }

    public void setTransportCharge(float transportCharge) {
        this.transportCharge = transportCharge;
    }

    public float getSellPrice() {
        return sellPrice;
    }

    public void setSellPrice(float sellPrice) {
        this.sellPrice = sellPrice;
    }

    public int getQuentity() {
        return quentity;
    }

    public void setQuentity(int quentity) {
        this.quentity = quentity;
    }

    public Date getProductAddedDate() {
        return productAddedDate;
    }

    public void setProductAddedDate(Date productAddedDate) {
        this.productAddedDate = productAddedDate;
    }

    public static long getSerialversionuid() {
        return serialVersionUID;
    }
}
