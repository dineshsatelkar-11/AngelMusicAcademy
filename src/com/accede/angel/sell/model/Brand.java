/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.sell.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import org.hibernate.annotations.Type;

/**
 *
 * @author Varsha
 */
@Entity
public class Brand {
   
    @Id
    @GeneratedValue
    
    private int id;
    private String Brand;
       @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean deletestatus = true;
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBrand() {
        return Brand;
    }

    public void setBrand(String Brand) {
        this.Brand = Brand;
    }

    public boolean isDeletestatus() {
        return deletestatus;
    }

    public void setDeletestatus(boolean deletestatus) {
        this.deletestatus = deletestatus;
    }

    @Override
    public String toString() {
        return "Brand{" + "id=" + id + ", Brand=" + Brand + ", deletestatus=" + deletestatus + '}';
    }

     
}
