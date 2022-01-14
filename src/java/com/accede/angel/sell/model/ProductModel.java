/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.sell.model;

import com.accede.angel.admin.model.Branch;
import java.io.Serializable;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import org.hibernate.annotations.Type;

/**
 *
 * @author Accede
 */
@Entity
public class ProductModel implements Serializable {

    @Id
    @GeneratedValue
    private int id;
    private String productname="NA";
    private String productBarcode="NA";
    private String Discription="NA";

    private long productquantity=0;
    private String Hsn="NA";
    private float PurchasePrice;
    private float UnitPrice=0.0f;
    private float Cgst=0.0f;
    private float Sgst=0.0f;
    private float Igst=0.0f;
    private float Discountper=0.0f;

    @OneToOne(fetch = FetchType.EAGER)
    private Barcode barcode;
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
 private long catid=0;
  private long subcatid=0;
  private int Modelid=0;
  private int colorModelid=0;
  private int brandid=0;
    private boolean Status = true;

    public int getId() {
        return id;
    }

    public String getDiscription() {
        return Discription;
    }

    public void setDiscription(String Discription) {
        this.Discription = Discription;
    }

    public void setId(int id) {
        this.id = id;
    }

    public float getDiscountper() {
        return Discountper;
    }

    public void setDiscountper(float Discountper) {
        this.Discountper = Discountper;
    }

    public String getProductname() {
        return productname;
    }

    public void setProductname(String productname) {
        this.productname = productname;
    }

    public String getProductBarcode() {
        return productBarcode;
    }

    public void setProductBarcode(String productBarcode) {
        this.productBarcode = productBarcode;
    }

    public long getProductquantity() {
        return productquantity;
    }

    public void setProductquantity(long productquantity) {
        this.productquantity = productquantity;
    }

    public String getHsn() {
        return Hsn;
    }

    public void setHsn(String Hsn) {
        this.Hsn = Hsn;
    }

    public float getUnitPrice() {
        return UnitPrice;
    }

    public void setUnitPrice(float UnitPrice) {
        this.UnitPrice = UnitPrice;
    }

    public float getPurchasePrice() {
        return PurchasePrice;
    }

    public void setPurchasePrice(float PurchasePrice) {
        this.PurchasePrice = PurchasePrice;
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

    public boolean isStatus() {
        return Status;
    }

    public void setStatus(boolean Status) {
        this.Status = Status;
    }

//      @OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.MERGE)
//    private CategoryModel category;
//    
    public Barcode getBarcode() {
        return barcode;
    }

    public void setBarcode(Barcode barcode) {
        this.barcode = barcode;
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

    public long getCatid() {
        return catid;
    }

    public void setCatid(long catid) {
        this.catid = catid;
    }

    public long getSubcatid() {
        return subcatid;
    }

    public void setSubcatid(long subcatid) {
        this.subcatid = subcatid;
    }

    public int getModelid() {
        return Modelid;
    }

    public void setModelid(int Modelid) {
        this.Modelid = Modelid;
    }

    public int getColorModelid() {
        return colorModelid;
    }

    public void setColorModelid(int colorModelid) {
        this.colorModelid = colorModelid;
    }

    public int getBrandid() {
        return brandid;
    }

    public void setBrandid(int brandid) {
        this.brandid = brandid;
    }
    
    
}
