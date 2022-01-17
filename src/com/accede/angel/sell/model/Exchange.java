/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.accede.angel.sell.model;
import com.accede.angel.admin.model.CustomerAccount;
import java.io.Serializable;
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
public class Exchange implements Serializable {
    @Id @GeneratedValue
    private int id;
   
      @Temporal(javax.persistence.TemporalType.DATE)
    private Date purchaseDate = new Date();
      
       @Temporal(javax.persistence.TemporalType.DATE)
    private Date exchangeDate = new Date();
       
    private long productquantity;
    private float gross_amount;
    private float PurchasePrice;
    private float mrpprice;    
    
    @OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.MERGE)
    private CustomerSale CustomerSale;
    
    @OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.MERGE)
    private CustomerSale CustomerPurchaseProduct;
    
    @OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.MERGE)
    private CustomerSaleDetails CustomerSaleDetails; 
    
     @OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.MERGE)
    private ProductModel product; 
    
     @OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.MERGE)
    private CustomerAccount CustomerAccount;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getPurchaseDate() {
        return purchaseDate;
    }

    public void setPurchaseDate(Date purchaseDate) {
        this.purchaseDate = purchaseDate;
    }

    public Date getExchangeDate() {
        return exchangeDate;
    }

    public void setExchangeDate(Date exchangeDate) {
        this.exchangeDate = exchangeDate;
    }

    public long getProductquantity() {
        return productquantity;
    }

    public void setProductquantity(long productquantity) {
        this.productquantity = productquantity;
    }

    public float getGross_amount() {
        return gross_amount;
    }

    public void setGross_amount(float gross_amount) {
        this.gross_amount = gross_amount;
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

    public CustomerAccount getCustomerAccount() {
        return CustomerAccount;
    }

    public void setCustomerAccount(CustomerAccount CustomerAccount) {
        this.CustomerAccount = CustomerAccount;
    }

    public CustomerSale getCustomerSale() {
        return CustomerSale;
    }

    public void setCustomerSale(CustomerSale CustomerSale) {
        this.CustomerSale = CustomerSale;
    }

    public CustomerSaleDetails getCustomerSaleDetails() {
        return CustomerSaleDetails;
    }

    public void setCustomerSaleDetails(CustomerSaleDetails CustomerSaleDetails) {
        this.CustomerSaleDetails = CustomerSaleDetails;
    }

    public CustomerSale getCustomerPurchaseProduct() {
        return CustomerPurchaseProduct;
    }

    public void setCustomerPurchaseProduct(CustomerSale CustomerPurchaseProduct) {
        this.CustomerPurchaseProduct = CustomerPurchaseProduct;
    }
    
    
     
     
     
     
   

   
    
      
    
    
    
    
    
    
}
