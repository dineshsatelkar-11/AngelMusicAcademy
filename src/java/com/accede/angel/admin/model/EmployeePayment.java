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

/**
 *
 * @author Dinesh
 */

@Entity
public class EmployeePayment implements Serializable {

    @Id
    @GeneratedValue
    private long id;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date salaryDate = new Date();
     @OneToOne(fetch = FetchType.EAGER)
    private Employee employee;
   private int actualSalary;
   private int payment;
   private int incentive;
   private int year;
   private int totalamount;
   private int noOfDays;
   private int noOfDaysleave=0;
   
      private int advance;
      private int extrahours;
      private int overtimeamt;
   private int finalamount;
   private int balanceadvanceamt;
    private String month;
    private String monthinword;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Date getSalaryDate() {
        return salaryDate;
    }

    public void setSalaryDate(Date salaryDate) {
        this.salaryDate = salaryDate;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public int getActualSalary() {
        return actualSalary;
    }

    public void setActualSalary(int actualSalary) {
        this.actualSalary = actualSalary;
    }

    public int getPayment() {
        return payment;
    }

    public void setPayment(int payment) {
        this.payment = payment;
    }

    public int getIncentive() {
        return incentive;
    }

    public void setIncentive(int incentive) {
        this.incentive = incentive;
    }

    public int getTotalamount() {
        return totalamount;
    }

    public void setTotalamount(int totalamount) {
        this.totalamount = totalamount;
    }

    public int getNoOfDays() {
        return noOfDays;
    }

    public void setNoOfDays(int noOfDays) {
        this.noOfDays = noOfDays;
    }

    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }

    public int getAdvance() {
        return advance;
    }

    public void setAdvance(int advance) {
        this.advance = advance;
    }

    public int getFinalamount() {
        return finalamount;
    }

    public void setFinalamount(int finalamount) {
        this.finalamount = finalamount;
    }

    public int getBalanceadvanceamt() {
        return balanceadvanceamt;
    }

    public void setBalanceadvanceamt(int balanceadvanceamt) {
        this.balanceadvanceamt = balanceadvanceamt;
    }

    public int getExtrahours() {
        return extrahours;
    }

    public void setExtrahours(int extrahours) {
        this.extrahours = extrahours;
    }

    public int getOvertimeamt() {
        return overtimeamt;
    }

    public void setOvertimeamt(int overtimeamt) {
        this.overtimeamt = overtimeamt;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public int getNoOfDaysleave() {
        return noOfDaysleave;
    }

    public void setNoOfDaysleave(int noOfDaysleave) {
        this.noOfDaysleave = noOfDaysleave;
    }

    public String getMonthinword() {
        return monthinword;
    }

    public void setMonthinword(String monthinword) {
        this.monthinword = monthinword;
    }

    @Override
    public String toString() {
        return "EmployeePayment{" + "id=" + id + ", salaryDate=" + salaryDate + ", employee=" + employee + ", actualSalary=" + actualSalary + ", payment=" + payment + ", incentive=" + incentive + ", year=" + year + ", totalamount=" + totalamount + ", noOfDays=" + noOfDays + ", noOfDaysleave=" + noOfDaysleave + ", advance=" + advance + ", extrahours=" + extrahours + ", overtimeamt=" + overtimeamt + ", finalamount=" + finalamount + ", balanceadvanceamt=" + balanceadvanceamt + ", month=" + month + ", monthinword=" + monthinword + '}';
    }
   
   
}
