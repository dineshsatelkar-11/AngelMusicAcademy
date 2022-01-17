/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.sell.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import org.hibernate.annotations.Type;

/**
 *
 * @author Varsha
 */
@Entity
public class Category {
    
    @Id
    @GeneratedValue
    
    private long id;
    private String Category;
      @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean deletestatus = true;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

 

    public String getCategory() {
        return Category;
    }

    public void setCategory(String Category) {
        this.Category = Category;
    }

    public boolean isDeletestatus() {
        return deletestatus;
    }

    public void setDeletestatus(boolean deletestatus) {
        this.deletestatus = deletestatus;
    }
    
    
    
}
