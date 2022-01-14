/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.accede.angel.sell.model;

import com.accede.angel.admin.model.Admin;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;

/**
 *
 * @author Admin
 */
@Entity
public class BranchClassProduct {

    @Id
    @GeneratedValue
    private int id;
   private String productBarcode;

    private long productquantity;

    private int adminid;
    @OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.MERGE)
    private Admin admin;
    @OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.MERGE)
    private ProductModel product;
    private int productid;
 private long catid=0;
  private long subcatid=0;
  private int Modelid=0;
  private int colorModelid=0;
  private int brandid=0;
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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


    public Admin getAdmin() {
        return admin;
    }

    public void setAdmin(Admin admin) {
        this.admin = admin;
    }

    public int getProductid() {
        return productid;
    }

    public void setProductid(int productid) {
        this.productid = productid;
    }

    public ProductModel getProduct() {
        return product;
    }

    public void setProduct(ProductModel product) {
        this.product = product;
    }

    public int getAdminid() {
        return adminid;
    }

    public void setAdminid(int adminid) {
        this.adminid = adminid;
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
