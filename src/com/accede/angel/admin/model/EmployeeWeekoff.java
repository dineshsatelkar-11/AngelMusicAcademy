/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.admin.model;

import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import org.hibernate.annotations.Type;

/**
 *
 * @author Admin
 */
@Entity
public class EmployeeWeekoff implements Serializable {

    @Id
    @GeneratedValue
    private long id;
    @OneToOne(fetch = FetchType.EAGER)
    private Employee employee;
    private String month;
    private String reason;
    private String TypeofLeave;
    private String year;
    private int noofday;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date WeekoffDate = new Date();
     @Temporal(javax.persistence.TemporalType.DATE)
    private Date TillDate = new Date();
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean Status3 = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean Status1 = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean Status2 = true;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getTypeofLeave() {
        return TypeofLeave;
    }

    public void setTypeofLeave(String TypeofLeave) {
        this.TypeofLeave = TypeofLeave;
    }

  

    public Date getWeekoffDate() {
        return WeekoffDate;
    }

    public void setWeekoffDate(Date WeekoffDate) {
        this.WeekoffDate = WeekoffDate;
    }

    public boolean isStatus3() {
        return Status3;
    }

    public void setStatus3(boolean Status3) {
        this.Status3 = Status3;
    }

    public boolean isStatus1() {
        return Status1;
    }

    public void setStatus1(boolean Status1) {
        this.Status1 = Status1;
    }

    public boolean isStatus2() {
        return Status2;
    }

    public void setStatus2(boolean Status2) {
        this.Status2 = Status2;
    }

    public int getNoofday() {
        return noofday;
    }

    public void setNoofday(int noofday) {
        this.noofday = noofday;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public Date getTillDate() {
        return TillDate;
    }

    public void setTillDate(Date TillDate) {
        this.TillDate = TillDate;
    }

}
