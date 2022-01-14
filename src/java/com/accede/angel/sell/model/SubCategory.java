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
import org.hibernate.annotations.Type;

/**
 *
 * @author Admin
 */


@Entity
public class SubCategory {
    
    @Id
    @GeneratedValue
    
    private long id;
    private String Category;
    private String SubCategory;
     @OneToOne(fetch = FetchType.EAGER)
    private Category cat;
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

    public String getSubCategory() {
        return SubCategory;
    }

    public void setSubCategory(String SubCategory) {
        this.SubCategory = SubCategory;
    }

    public boolean isDeletestatus() {
        return deletestatus;
    }

    public void setDeletestatus(boolean deletestatus) {
        this.deletestatus = deletestatus;
    }

    @Override
    public String toString() {
        return "SubCategory{" + "id=" + id + ", Category=" + Category + ", SubCategory=" + SubCategory + ", deletestatus=" + deletestatus + '}';
    }

    public Category getCat() {
        return cat;
    }

    public void setCat(Category cat) {
        this.cat = cat;
    }

    
}
