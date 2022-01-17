/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.sell.model;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;

/**
 *
 * @author USER
 */
@Entity
public class PurchaseTemp {

    @Id
    @GeneratedValue
    private int id;
    private int product_id;

    private String productName;
  
    private float PurchasePrice;

    private float cgstamount;
    private float cgstper;
    private float sgstper;
    private float igstper;

    private float sgstamount;
    private float igstamount;
    private float Total;
    private float mrpprice;
    private long Quantity;
//    private long AvailableQuantity;
    private float FinalAmount;
   @OneToOne(fetch = FetchType.EAGER)
    private AddModel Model;
    @OneToOne(fetch = FetchType.EAGER)
    private Category category;
    @OneToOne(fetch = FetchType.EAGER)
    private ColorModel colorModel;
    @OneToOne(fetch = FetchType.EAGER)
    private Brand brand;
    @OneToOne(fetch = FetchType.EAGER)
    private SubCategory subCategory;
    public float getFinalAmount() {
        return FinalAmount;
    }

    public void setFinalAmount(float FinalAmount) {
        this.FinalAmount = FinalAmount;
    }

    public float getTaxableAmount() {
        return taxableAmount;
    }

    public void setTaxableAmount(float taxableAmount) {
        this.taxableAmount = taxableAmount;
    }
    private float taxableAmount;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

   

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public float getCgstamount() {
        return cgstamount;
    }

    public void setCgstamount(float cgstamount) {
        this.cgstamount = cgstamount;
    }

    public float getPurchasePrice() {
        return PurchasePrice;
    }

    public void setPurchasePrice(float PurchasePrice) {
        this.PurchasePrice = PurchasePrice;
    }

    public float getCgstper() {
        return cgstper;
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


    public float getMrpprice() {
        return mrpprice;
    }

    public void setMrpprice(float mrpprice) {
        this.mrpprice = mrpprice;
    }

    public AddModel getModel() {
        return Model;
    }

    public void setModel(AddModel Model) {
        this.Model = Model;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public ColorModel getColorModel() {
        return colorModel;
    }

    public void setColorModel(ColorModel colorModel) {
        this.colorModel = colorModel;
    }

    public Brand getBrand() {
        return brand;
    }

    public void setBrand(Brand brand) {
        this.brand = brand;
    }

    public SubCategory getSubCategory() {
        return subCategory;
    }

    public void setSubCategory(SubCategory subCategory) {
        this.subCategory = subCategory;
    }

    
}
