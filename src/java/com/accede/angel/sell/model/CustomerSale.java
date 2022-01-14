/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.accede.angel.sell.model;

import com.accede.angel.admin.model.Admin;
import com.accede.angel.admin.model.CustomerAccount;
import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import org.hibernate.annotations.Type;

/**
 *
 * @author asd
 */
@Entity
public class CustomerSale {
    @Id @GeneratedValue
    private int id;
    private String customername;
    private String mobilenumber;
    private String cust_addre;
    private String amount_inword;
      @Temporal(javax.persistence.TemporalType.DATE)
    private Date date = new Date();
      
       @Temporal(javax.persistence.TemporalType.DATE)
    private Date nextPaymentDate = new Date();
       @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean CloseRequest = true;
    private float grandtotal;
    private float other_charges;
    private float discount_amount;
    
     private float Discount_Per;
    private float Advance_Amount;
    private float net_Advance_Amount;
    private float paidamt;
    private float balamt;
    
    
    private float grosstotal;
      @OneToOne(fetch = FetchType.EAGER)
    private CustomerAccount CustomerAccount;
    @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.MERGE)
    private List<CustomerSaleDetails> CustomerSaleDetails;
    @OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.MERGE)
    private Admin admin;
    private long productquanity;
      private String PaymentMode;

   

    private String chequeno = "NA";
    private String bankname = "NA";

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCustomername() {
        return customername;
    }

    public void setCustomername(String customername) {
        this.customername = customername;
    }

    public String getMobilenumber() {
        return mobilenumber;
    }

    public void setMobilenumber(String mobilenumber) {
        this.mobilenumber = mobilenumber;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public float getGrandtotal() {
        return grandtotal;
    }

    public void setGrandtotal(float grandtotal) {
        this.grandtotal = grandtotal;
    }

    public List<CustomerSaleDetails> getCustomerSaleDetails() {
        return CustomerSaleDetails;
    }

    public void setCustomerSaleDetails(List<CustomerSaleDetails> CustomerSaleDetails) {
        this.CustomerSaleDetails = CustomerSaleDetails;
    }

    public Admin getAdmin() {
        return admin;
    }

    public void setAdmin(Admin admin) {
        this.admin = admin;
    }

    public long getProductquanity() {
        return productquanity;
    }

    public void setProductquanity(long productquanity) {
        this.productquanity = productquanity;
    }

    public String getCust_addre() {
        return cust_addre;
    }

    public void setCust_addre(String cust_addre) {
        this.cust_addre = cust_addre;
    }

    public String getAmount_inword() {
        return amount_inword;
    }

    public void setAmount_inword(String amount_inword) {
        this.amount_inword = amount_inword;
    }

    public float getOther_charges() {
        return other_charges;
    }

    public void setOther_charges(float other_charges) {
        this.other_charges = other_charges;
    }

    public float getDiscount_amount() {
        return discount_amount;
    }

    public void setDiscount_amount(float discount_amount) {
        this.discount_amount = discount_amount;
    }

    public float getGrosstotal() {
        return grosstotal;
    }

    public void setGrosstotal(float grosstotal) {
        this.grosstotal = grosstotal;
    }

    public String getPaymentMode() {
        return PaymentMode;
    }

    public void setPaymentMode(String PaymentMode) {
        this.PaymentMode = PaymentMode;
    }

    public String getChequeno() {
        return chequeno;
    }

    public void setChequeno(String chequeno) {
        this.chequeno = chequeno;
    }

    public String getBankname() {
        return bankname;
    }

    public void setBankname(String bankname) {
        this.bankname = bankname;
    }

    public CustomerAccount getCustomerAccount() {
        return CustomerAccount;
    }

    public void setCustomerAccount(CustomerAccount CustomerAccount) {
        this.CustomerAccount = CustomerAccount;
    }

    public Date getNextPaymentDate() {
        return nextPaymentDate;
    }

    public void setNextPaymentDate(Date nextPaymentDate) {
        this.nextPaymentDate = nextPaymentDate;
    }

    public float getDiscount_Per() {
        return Discount_Per;
    }

    public void setDiscount_Per(float Discount_Per) {
        this.Discount_Per = Discount_Per;
    }

    public float getAdvance_Amount() {
        return Advance_Amount;
    }

    public void setAdvance_Amount(float Advance_Amount) {
        this.Advance_Amount = Advance_Amount;
    }

    public float getNet_Advance_Amount() {
        return net_Advance_Amount;
    }

    public void setNet_Advance_Amount(float net_Advance_Amount) {
        this.net_Advance_Amount = net_Advance_Amount;
    }

    public float getPaidamt() {
        return paidamt;
    }

    public void setPaidamt(float paidamt) {
        this.paidamt = paidamt;
    }

    public float getBalamt() {
        return balamt;
    }

    public void setBalamt(float balamt) {
        this.balamt = balamt;
    }

    public boolean isCloseRequest() {
        return CloseRequest;
    }

    public void setCloseRequest(boolean CloseRequest) {
        this.CloseRequest = CloseRequest;
    }
    
   
    
      
    
    
    
    
    
    
}
