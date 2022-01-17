/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.accede.angel.admin.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

/**
 *
 * @author accede
 */
@Entity
@Table(name="sell")
public class Sell implements Serializable{
 
    private static long serialVersionUID = 1L;
	
	@Id @GeneratedValue
        private long sellId;
        private String counsellorName;
        private Date sellDate = new Date();
        private String customerFirstName;
        private String customerMiddleName;
        private String customerLastName;
        private String customerAddress;
      
       
        private String customerMobileNo;
        private String customerAlternateNo;
        private String sellNo;
        
        
   	  
   	   
   	    private float sellPrice;
   	    private float discount;
   	    private float totalPrice;
        private int quentity=0;
        
        @ManyToOne(cascade = CascadeType.ALL,fetch = FetchType.EAGER)
        @JoinColumn(name = "productId")
        private Product productId;
     @OneToOne(fetch = FetchType.EAGER)
    private Admin adminOfBranch;

    public Admin getAdminOfBranch() {
        return adminOfBranch;
    }

    public void setAdminOfBranch(Admin adminOfBranch) {
        this.adminOfBranch = adminOfBranch;
    }

 
       

    public static long getSerialVersionUID() {
			return serialVersionUID;
		}

		public static void setSerialVersionUID(long serialVersionUID) {
			Sell.serialVersionUID = serialVersionUID;
		}

		public Product getProductId() {
			return productId;
		}

		public void setProductId(Product productId) {
			this.productId = productId;
		}

	public long getSellId() {
        return sellId;
    }

    public void setSellId(long sellId) {
        this.sellId = sellId;
    }

    public String getCounsellorName() {
        return counsellorName;
    }

    public void setCounsellorName(String counsellorName) {
        this.counsellorName = counsellorName;
    }

    public Date getSellDate() {
        return sellDate;
    }

    public void setSellDate(Date sellDate) {
        this.sellDate = sellDate;
    }

    public String getCustomerFirstName() {
        return customerFirstName;
    }

    public void setCustomerFirstName(String customerFirstName) {
        this.customerFirstName = customerFirstName;
    }

    public String getCustomerMiddleName() {
        return customerMiddleName;
    }

    public void setCustomerMiddleName(String customerMiddleName) {
        this.customerMiddleName = customerMiddleName;
    }

    public String getCustomerLastName() {
        return customerLastName;
    }

    public void setCustomerLastName(String customerLastName) {
        this.customerLastName = customerLastName;
    }

    public String getCustomerAddress() {
        return customerAddress;
    }

    public void setCustomerAddress(String customerAddress) {
        this.customerAddress = customerAddress;
    }

   
   
   

    public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public static void setSerialversionuid(long serialversionuid) {
		serialVersionUID = serialversionuid;
	}

	public float getSellPrice() {
		return sellPrice;
	}

	public void setSellPrice(float sellPrice) {
		this.sellPrice = sellPrice;
	}

	public float getDiscount() {
		return discount;
	}

	public void setDiscount(float discount) {
		this.discount = discount;
	}

	public float getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(float totalPrice) {
		this.totalPrice = totalPrice;
	}

	public int getQuentity() {
		return quentity;
	}

	public void setQuentity(int quentity) {
		this.quentity = quentity;
	}

	public String getCustomerMobileNo() {
        return customerMobileNo;
    }

    public void setCustomerMobileNo(String customerMobileNo) {
        this.customerMobileNo = customerMobileNo;
    }

    public String getCustomerAlternateNo() {
        return customerAlternateNo;
    }

    public void setCustomerAlternateNo(String customerAlternateNo) {
        this.customerAlternateNo = customerAlternateNo;
    }
       

    public String getSellNo() {
        return sellNo;
    }

    public void setSellNo(String sellNo) {
        this.sellNo = sellNo;
    }
        
}