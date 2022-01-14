/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.accede.angel.sell.model;

import com.accede.angel.admin.model.Admin;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;

/**
 *
 * @author Admin
 */
@Entity
public class BranchClassTransfer {
    
    
    @Id
    @GeneratedValue
    private int id ;
    private int adminid;
    private int toadminid;
  
    @OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.MERGE)
    private Admin admin;
    @OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.MERGE)
    private Admin toadmin;
   
   
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date date = new Date();

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
    
   
    
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAdminid() {
        return adminid;
    }

    public void setAdminid(int adminid) {
        this.adminid = adminid;
    }

    public int getToadminid() {
        return toadminid;
    }

    public void setToadminid(int toadminid) {
        this.toadminid = toadminid;
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

  

    public Admin getAdmin() {
        return admin;
    }

    public void setAdmin(Admin admin) {
        this.admin = admin;
    }

    public Admin getToadmin() {
        return toadmin;
    }

    public void setToadmin(Admin toadmin) {
        this.toadmin = toadmin;
    }

 

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 29 * hash + this.id;
        hash = 29 * hash + this.adminid;
        hash = 29 * hash + this.toadminid;
        hash = 29 * hash + Objects.hashCode(this.admin);
        hash = 29 * hash + Objects.hashCode(this.toadmin);
        hash = 29 * hash + Objects.hashCode(this.date);
        hash = 29 * hash + Objects.hashCode(this.product);
        hash = 29 * hash + (int) (this.productquantity ^ (this.productquantity >>> 32));
        hash = 29 * hash + Objects.hashCode(this.productname);
        hash = 29 * hash + Objects.hashCode(this.Hsn);
        hash = 29 * hash + Float.floatToIntBits(this.PurchasePrice);
        hash = 29 * hash + Float.floatToIntBits(this.UnitPrice);
        hash = 29 * hash + Float.floatToIntBits(this.Cgst);
        hash = 29 * hash + Float.floatToIntBits(this.Sgst);
        hash = 29 * hash + Float.floatToIntBits(this.Igst);
        hash = 29 * hash + Float.floatToIntBits(this.Discountper);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final BranchClassTransfer other = (BranchClassTransfer) obj;
        if (this.id != other.id) {
            return false;
        }
        if (this.adminid != other.adminid) {
            return false;
        }
        if (this.toadminid != other.toadminid) {
            return false;
        }
        if (!Objects.equals(this.admin, other.admin)) {
            return false;
        }
        if (!Objects.equals(this.toadmin, other.toadmin)) {
            return false;
        }
        if (!Objects.equals(this.date, other.date)) {
            return false;
        }
        if (!Objects.equals(this.product, other.product)) {
            return false;
        }
        if (this.productquantity != other.productquantity) {
            return false;
        }
        if (!Objects.equals(this.productname, other.productname)) {
            return false;
        }
        if (!Objects.equals(this.Hsn, other.Hsn)) {
            return false;
        }
        if (Float.floatToIntBits(this.PurchasePrice) != Float.floatToIntBits(other.PurchasePrice)) {
            return false;
        }
        if (Float.floatToIntBits(this.UnitPrice) != Float.floatToIntBits(other.UnitPrice)) {
            return false;
        }
        if (Float.floatToIntBits(this.Cgst) != Float.floatToIntBits(other.Cgst)) {
            return false;
        }
        if (Float.floatToIntBits(this.Sgst) != Float.floatToIntBits(other.Sgst)) {
            return false;
        }
        if (Float.floatToIntBits(this.Igst) != Float.floatToIntBits(other.Igst)) {
            return false;
        }
        if (Float.floatToIntBits(this.Discountper) != Float.floatToIntBits(other.Discountper)) {
            return false;
        }
        return true;
    }
    
    
    
}
