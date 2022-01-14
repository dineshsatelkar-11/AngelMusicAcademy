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
 * @author asd
 */
@Entity
public class TempCustomerSell {

    @Id
    @GeneratedValue

    private int id;

   
    private String productBarcode;
    private long productquantity;
   

  
    private float total;
 @OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.MERGE)
    private BranchProduct branchProduct;
  


    public int getId() {
        return id;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
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

    

    public BranchProduct getBranchProduct() {
        return branchProduct;
    }

    public void setBranchProduct(BranchProduct branchProduct) {
        this.branchProduct = branchProduct;
    }


}
