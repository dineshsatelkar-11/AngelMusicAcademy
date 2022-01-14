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
 * @author Accede
 */
@Entity
public class Employee implements Serializable {

    @Id
    @GeneratedValue
    private long id;
    private int branchid;
    @Temporal(javax.persistence.TemporalType.TIME)
    private Date Intime;
    
    @Temporal(javax.persistence.TemporalType.TIME)
    private Date Outtime;
    
    @OneToOne(fetch = FetchType.EAGER)
    private BankDetails bankDetailId;
    @OneToOne(fetch = FetchType.EAGER)
    private Admin Admin;
    private String Password="123456789";
  private String Image = "Employee.jpg";
    private String imagepath;
    public BankDetails getBankDetailId() {
        return bankDetailId;
    }

    public void setBankDetailId(BankDetails bankDetailId) {
        this.bankDetailId = bankDetailId;
    }
    

    public int getBranchid() {
        return branchid;
    }

    public void setBranchid(int branchid) {
        this.branchid = branchid;
    }
    private String Name;
    private String MobileNo;
    private String email;
    private String workingType;
    private String alternateNo;
    private String PermanentNo;
    private String Address;

    public boolean isStatus() {
        return Status;
    }

    public void setStatus(boolean Status) {
        this.Status = Status;
    }
    private String emplyeeNo;
    private String PermanentAddress;
    private String qualification;
    private String designation;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date joiningDate;
       @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean Status=true;

    public boolean isEmp_Status() {
        return Emp_Status;
    }

    public void setEmp_Status(boolean Emp_Status) {
        this.Emp_Status = Emp_Status;
    }
   @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean Emp_Status=true;
    private int salary;
    private int advance=0;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getMobileNo() {
        return MobileNo;
    }

    

    public void setMobileNo(String MobileNo) {
        this.MobileNo = MobileNo;
    }

    public String getAlternateNo() {
        return alternateNo;
    }

    public void setAlternateNo(String alternateNo) {
        this.alternateNo = alternateNo;
    }

    public Date getIntime() {
        return Intime;
    }

    public void setIntime(Date Intime) {
        this.Intime = Intime;
    }

    public Date getOuttime() {
        return Outtime;
    }

    public void setOuttime(Date Outtime) {
        this.Outtime = Outtime;
    }

    public String getPermanentNo() {
        return PermanentNo;
    }

    public void setPermanentNo(String PermanentNo) {
        this.PermanentNo = PermanentNo;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public String getEmplyeeNo() {
        return emplyeeNo;
    }

    public void setEmplyeeNo(String emplyeeNo) {
        this.emplyeeNo = emplyeeNo;
    }

    public String getPermanentAddress() {
        return PermanentAddress;
    }

    public void setPermanentAddress(String PermanentAddress) {
        this.PermanentAddress = PermanentAddress;
    }

    public String getQualification() {
        return qualification;
    }

    public void setQualification(String qualification) {
        this.qualification = qualification;
    }

    public String getDesignation() {
        return designation;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
    }

    public Date getJoiningDate() {
        return joiningDate;
    }

    public void setJoiningDate(Date joiningDate) {
        this.joiningDate = joiningDate;
    }

    

    public int getSalary() {
        return salary;
    }

    public void setSalary(int salary) {
        this.salary = salary;
    }

    public Admin getAdmin() {
        return Admin;
    }

    public void setAdmin(Admin Admin) {
        this.Admin = Admin;
    }

    public int getAdvance() {
        return advance;
    }

    public void setAdvance(int advance) {
        this.advance = advance;
    }

    public String getWorkingType() {
        return workingType;
    }

    public void setWorkingType(String workingType) {
        this.workingType = workingType;
    }

    public String getImage() {
        return Image;
    }

    public void setImage(String Image) {
        this.Image = Image;
    }

    public String getImagepath() {
        return imagepath;
    }

    public void setImagepath(String imagepath) {
        this.imagepath = imagepath;
    }

    
    
    
}
