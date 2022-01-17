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
 * @author asd
 */
@Entity
public class TempSaleforBranch {
    
    @Id
    @GeneratedValue
    
    
    private int id=0;
    private String productname;
    private String productBarcode;
    private long productquantity;
    private long availableproductquantity;
     @OneToOne(fetch = FetchType.EAGER)
    private ProductModel productModel; 
    private int productid;

    public int getId() {
        return id;
    }

    public int getProductid() {
        return productid;
    }

    public void setProductid(int productid) {
        this.productid = productid;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getProductname() {
        return productname;
    }

    public void setProductname(String productname) {
        this.productname = productname;
    }

    public long getProductquantity() {
        return productquantity;
    }

    public void setProductquantity(long productquantity) {
        this.productquantity = productquantity;
    }

    public String getProductBarcode() {
        return productBarcode;
    }

    public void setProductBarcode(String productBarcode) {
        this.productBarcode = productBarcode;
    }

    public long getAvailableproductquantity() {
        return availableproductquantity;
    }

    public void setAvailableproductquantity(long availableproductquantity) {
        this.availableproductquantity = availableproductquantity;
    }

    public ProductModel getProductModel() {
        return productModel;
    }

    public void setProductModel(ProductModel productModel) {
        this.productModel = productModel;
    }
    
    
    
}
