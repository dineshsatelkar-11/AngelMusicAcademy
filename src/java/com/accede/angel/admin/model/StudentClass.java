/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.admin.model;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;

/**
 *
 * @author Accede
 */
@Entity
public class StudentClass implements Serializable {

    @Id
    @GeneratedValue
    private long id;
    private String CourseName;
    private String CourseFee;
    private String AdvancePaid;
    private String RemainingFee;
    private String DueDate;
    @OneToOne(fetch = FetchType.EAGER)
    private Admission admission;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getCourseName() {
        return CourseName;
    }

    public void setCourseName(String CourseName) {
        this.CourseName = CourseName;
    }

    public String getCourseFee() {
        return CourseFee;
    }

    public void setCourseFee(String CourseFee) {
        this.CourseFee = CourseFee;
    }

    public String getAdvancePaid() {
        return AdvancePaid;
    }

    public void setAdvancePaid(String AdvancePaid) {
        this.AdvancePaid = AdvancePaid;
    }

    public String getRemainingFee() {
        return RemainingFee;
    }

    public void setRemainingFee(String RemainingFee) {
        this.RemainingFee = RemainingFee;
    }

    public String getDueDate() {
        return DueDate;
    }

    public void setDueDate(String DueDate) {
        this.DueDate = DueDate;
    }

    public Admission getAdmission() {
        return admission;
    }

    public void setAdmission(Admission admission) {
        this.admission = admission;
    }
  
    
    
}
