/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.admin.model;

import java.io.Serializable;
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
import javax.persistence.OrderBy;
import javax.persistence.Temporal;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.hibernate.annotations.Type;

/**
 *
 * @author accede
 */
@Entity
public class Admission implements Serializable {

    @Id
    @GeneratedValue
    private long AdmissionId;
    private String FirstName;
    private String admissionNo;

    private String LastName;
    private String ContactNo;
    private String Email;

    private double Age;
    private String Gender;
    private String Address;

    private String CourseName;

    private int admissionFee;
    private int noofcourseselect;
    private int noofDaysselect;
    private int noofBatchTimeselect;

    private int remaininFee;
    private int day;
    private int Year;

    private String Month;
    private String BatchTimings;
    
    private String studentPassword;

    private String DaysInWeek;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date JoiningDate;

    @Temporal(javax.persistence.TemporalType.DATE)
    private Date DateofBirth;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date AdmissionDate;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date DueDate;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date nextPaymentDate;

// private String PaymentOption;
    private String Image = "Student.jpg";
    private String imagepath;

    @OneToOne(fetch = FetchType.EAGER)
    private Admin adminOfBranch;
    @OneToOne(fetch = FetchType.EAGER)
    private CustomerAccount CustomerAccount;
    @OneToOne(fetch = FetchType.EAGER)
    private PackageCourse packageCourse;
   
    private int fee;
     private int discper;
    private int disamount;
    private int finalamount;
   
    @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.MERGE)
     @OrderBy("paymentDate DESC")
    private List<StudentAccount> studentAccount;

    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean shiftToOldStudent = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean birthdaysmsstatus = true;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean duedateSmsstatus = true;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date duedateSmsdate = new Date();
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date DateofBirthsmsdate = new Date();

    public boolean isBirthdaysmsstatus() {
        return birthdaysmsstatus;
    }

    public void setBirthdaysmsstatus(boolean birthdaysmsstatus) {
        this.birthdaysmsstatus = birthdaysmsstatus;
    }

    public boolean isDuedateSmsstatus() {
        return duedateSmsstatus;
    }

    public void setDuedateSmsstatus(boolean duedateSmsstatus) {
        this.duedateSmsstatus = duedateSmsstatus;
    }

    public String getImagepath() {
        return imagepath;
    }

    public void setImagepath(String imagepath) {
        this.imagepath = imagepath;
    }

    public String getAdmissionNo() {
        return admissionNo;
    }

    public void setAdmissionNo(String admissionNo) {
        this.admissionNo = admissionNo;
    }

    public int getRemaininFee() {
        return remaininFee;
    }

    public void setRemaininFee(int remaininFee) {
        this.remaininFee = remaininFee;
    }

    public Date getNextPaymentDate() {
        return nextPaymentDate;
    }

    public void setNextPaymentDate(Date nextPaymentDate) {
        this.nextPaymentDate = nextPaymentDate;
    }


    public String getStudentPassword() {
        return studentPassword;
    }

    public void setStudentPassword(String studentPassword) {
        this.studentPassword = studentPassword;
    }

    public int getAdmissionFee() {
        return admissionFee;
    }

    public void setAdmissionFee(int admissionFee) {
        this.admissionFee = admissionFee;
    }

    public String getCourseName() {
        return CourseName;
    }

    public void setCourseName(String CourseName) {
        this.CourseName = CourseName;
    }

  
    public Date getJoiningDate() {
        return JoiningDate;
    }

    public void setJoiningDate(Date JoiningDate) {
        this.JoiningDate = JoiningDate;
    }

    public Admin getAdminOfBranch() {
        return adminOfBranch;
    }

    public void setAdminOfBranch(Admin adminOfBranch) {
        this.adminOfBranch = adminOfBranch;
    }

    public String getImage() {
        return Image;
    }

    public void setImage(String Image) {
        this.Image = Image;
    }

    public String getFirstName() {
        return FirstName;
    }

    public void setFirstName(String FirstName) {
        this.FirstName = FirstName;
    }

    public String getLastName() {
        return LastName;
    }

    public void setLastName(String LastName) {
        this.LastName = LastName;
    }

    public String getContactNo() {
        return ContactNo;
    }

    public void setContactNo(String ContactNo) {
        this.ContactNo = ContactNo;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public Date getDueDate() {
        return DueDate;
    }

    public void setDueDate(Date DueDate) {
        this.DueDate = DueDate;
    }

    public List<StudentAccount> getStudentAccount() {
        return studentAccount;
    }

    public void setStudentAccount(List<StudentAccount> studentAccount) {
        this.studentAccount = studentAccount;
    }

    public long getAdmissionId() {
        return AdmissionId;
    }

    public void setAdmissionId(long AdmissionId) {
        this.AdmissionId = AdmissionId;
    }

    public Date getDateofBirth() {
        return DateofBirth;
    }

    public void setDateofBirth(Date DateofBirth) {
        this.DateofBirth = DateofBirth;
    }

    public double getAge() {
        return Age;
    }

    public void setAge(double Age) {
        this.Age = Age;
    }

    public String getGender() {
        return Gender;
    }

    public void setGender(String Gender) {
        this.Gender = Gender;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public String getBatchTimings() {
        return BatchTimings;
    }

    public void setBatchTimings(String BatchTimings) {
        this.BatchTimings = BatchTimings;
    }

    public String getDaysInWeek() {
        return DaysInWeek;
    }

    public void setDaysInWeek(String DaysInWeek) {
        this.DaysInWeek = DaysInWeek;
    }

    public Date getAdmissionDate() {
        return AdmissionDate;
    }

    public void setAdmissionDate(Date AdmissionDate) {
        this.AdmissionDate = AdmissionDate;
    }

    public boolean isShiftToOldStudent() {
        return shiftToOldStudent;
    }

    public void setShiftToOldStudent(boolean shiftToOldStudent) {
        this.shiftToOldStudent = shiftToOldStudent;
    }

    public Date getDuedateSmsdate() {
        return duedateSmsdate;
    }

    public void setDuedateSmsdate(Date duedateSmsdate) {
        this.duedateSmsdate = duedateSmsdate;
    }

    public Date getDateofBirthsmsdate() {
        return DateofBirthsmsdate;
    }

    public void setDateofBirthsmsdate(Date DateofBirthsmsdate) {
        this.DateofBirthsmsdate = DateofBirthsmsdate;
    }

    public CustomerAccount getCustomerAccount() {
        return CustomerAccount;
    }

    public void setCustomerAccount(CustomerAccount CustomerAccount) {
        this.CustomerAccount = CustomerAccount;
    }

    public int getNoofcourseselect() {
        return noofcourseselect;
    }

    public void setNoofcourseselect(int noofcourseselect) {
        this.noofcourseselect = noofcourseselect;
    }

    public int getNoofDaysselect() {
        return noofDaysselect;
    }

    public void setNoofDaysselect(int noofDaysselect) {
        this.noofDaysselect = noofDaysselect;
    }

    public int getNoofBatchTimeselect() {
        return noofBatchTimeselect;
    }

    public void setNoofBatchTimeselect(int noofBatchTimeselect) {
        this.noofBatchTimeselect = noofBatchTimeselect;
    }

    public int getDay() {
        return day;
    }

    public void setDay(int day) {
        this.day = day;
    }

    public int getYear() {
        return Year;
    }

    public void setYear(int Year) {
        this.Year = Year;
    }

    public String getMonth() {
        return Month;
    }

    public void setMonth(String Month) {
        this.Month = Month;
    }

    public PackageCourse getPackageCourse() {
        return packageCourse;
    }

    public void setPackageCourse(PackageCourse packageCourse) {
        this.packageCourse = packageCourse;
    }

   

   
 
    public int getFee() {
        return fee;
    }

    public void setFee(int fee) {
        this.fee = fee;
    }

    public int getDiscper() {
        return discper;
    }

    public void setDiscper(int discper) {
        this.discper = discper;
    }

    public int getDisamount() {
        return disamount;
    }

    public void setDisamount(int disamount) {
        this.disamount = disamount;
    }

    public int getFinalamount() {
        return finalamount;
    }

    public void setFinalamount(int finalamount) {
        this.finalamount = finalamount;
    }

    @Override
    public String toString() {
        return "Admission{" + "AdmissionId=" + AdmissionId + ", FirstName=" + FirstName + ", admissionNo=" + admissionNo + ", LastName=" + LastName + ", ContactNo=" + ContactNo + ", Email=" + Email + ", Age=" + Age + ", Gender=" + Gender + ", Address=" + Address + ", CourseName=" + CourseName + ", admissionFee=" + admissionFee + ", noofcourseselect=" + noofcourseselect + ", noofDaysselect=" + noofDaysselect + ", noofBatchTimeselect=" + noofBatchTimeselect + ", remaininFee=" + remaininFee + ", day=" + day + ", Year=" + Year + ", Month=" + Month + ", BatchTimings=" + BatchTimings + ", studentPassword=" + studentPassword + ", DaysInWeek=" + DaysInWeek + ", JoiningDate=" + JoiningDate + ", DateofBirth=" + DateofBirth + ", AdmissionDate=" + AdmissionDate + ", DueDate=" + DueDate + ", nextPaymentDate=" + nextPaymentDate + ", Image=" + Image + ", imagepath=" + imagepath + ", adminOfBranch=" + adminOfBranch + ", CustomerAccount=" + CustomerAccount + ", packageCourse=" + packageCourse + ", fee=" + fee + ", discper=" + discper + ", disamount=" + disamount + ", finalamount=" + finalamount + ", studentAccount=" + studentAccount + ", shiftToOldStudent=" + shiftToOldStudent + ", birthdaysmsstatus=" + birthdaysmsstatus + ", duedateSmsstatus=" + duedateSmsstatus + ", duedateSmsdate=" + duedateSmsdate + ", DateofBirthsmsdate=" + DateofBirthsmsdate + '}';
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 61 * hash + (int) (this.AdmissionId ^ (this.AdmissionId >>> 32));
        hash = 61 * hash + Objects.hashCode(this.FirstName);
        hash = 61 * hash + Objects.hashCode(this.admissionNo);
        hash = 61 * hash + Objects.hashCode(this.LastName);
        hash = 61 * hash + Objects.hashCode(this.ContactNo);
        hash = 61 * hash + Objects.hashCode(this.Email);
        hash = 61 * hash + (int) (Double.doubleToLongBits(this.Age) ^ (Double.doubleToLongBits(this.Age) >>> 32));
        hash = 61 * hash + Objects.hashCode(this.Gender);
        hash = 61 * hash + Objects.hashCode(this.Address);
        hash = 61 * hash + Objects.hashCode(this.CourseName);
        hash = 61 * hash + this.admissionFee;
        hash = 61 * hash + this.noofcourseselect;
        hash = 61 * hash + this.noofDaysselect;
        hash = 61 * hash + this.noofBatchTimeselect;
        hash = 61 * hash + this.remaininFee;
        hash = 61 * hash + this.day;
        hash = 61 * hash + this.Year;
        hash = 61 * hash + Objects.hashCode(this.Month);
        hash = 61 * hash + Objects.hashCode(this.BatchTimings);
        hash = 61 * hash + Objects.hashCode(this.studentPassword);
        hash = 61 * hash + Objects.hashCode(this.DaysInWeek);
        hash = 61 * hash + Objects.hashCode(this.JoiningDate);
        hash = 61 * hash + Objects.hashCode(this.DateofBirth);
        hash = 61 * hash + Objects.hashCode(this.AdmissionDate);
        hash = 61 * hash + Objects.hashCode(this.DueDate);
        hash = 61 * hash + Objects.hashCode(this.nextPaymentDate);
        hash = 61 * hash + Objects.hashCode(this.Image);
        hash = 61 * hash + Objects.hashCode(this.imagepath);
        hash = 61 * hash + Objects.hashCode(this.adminOfBranch);
        hash = 61 * hash + Objects.hashCode(this.CustomerAccount);
        hash = 61 * hash + Objects.hashCode(this.packageCourse);
        hash = 61 * hash + this.fee;
        hash = 61 * hash + this.discper;
        hash = 61 * hash + this.disamount;
        hash = 61 * hash + this.finalamount;
        hash = 61 * hash + Objects.hashCode(this.studentAccount);
        hash = 61 * hash + (this.shiftToOldStudent ? 1 : 0);
        hash = 61 * hash + (this.birthdaysmsstatus ? 1 : 0);
        hash = 61 * hash + (this.duedateSmsstatus ? 1 : 0);
        hash = 61 * hash + Objects.hashCode(this.duedateSmsdate);
        hash = 61 * hash + Objects.hashCode(this.DateofBirthsmsdate);
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
        final Admission other = (Admission) obj;
        if (this.AdmissionId != other.AdmissionId) {
            return false;
        }
        if (!Objects.equals(this.FirstName, other.FirstName)) {
            return false;
        }
        if (!Objects.equals(this.admissionNo, other.admissionNo)) {
            return false;
        }
        if (!Objects.equals(this.LastName, other.LastName)) {
            return false;
        }
        if (!Objects.equals(this.ContactNo, other.ContactNo)) {
            return false;
        }
        if (!Objects.equals(this.Email, other.Email)) {
            return false;
        }
        if (Double.doubleToLongBits(this.Age) != Double.doubleToLongBits(other.Age)) {
            return false;
        }
        if (!Objects.equals(this.Gender, other.Gender)) {
            return false;
        }
        if (!Objects.equals(this.Address, other.Address)) {
            return false;
        }
        if (!Objects.equals(this.CourseName, other.CourseName)) {
            return false;
        }
        if (this.admissionFee != other.admissionFee) {
            return false;
        }
        if (this.noofcourseselect != other.noofcourseselect) {
            return false;
        }
        if (this.noofDaysselect != other.noofDaysselect) {
            return false;
        }
        if (this.noofBatchTimeselect != other.noofBatchTimeselect) {
            return false;
        }
        if (this.remaininFee != other.remaininFee) {
            return false;
        }
        if (this.day != other.day) {
            return false;
        }
        if (this.Year != other.Year) {
            return false;
        }
        if (!Objects.equals(this.Month, other.Month)) {
            return false;
        }
        if (!Objects.equals(this.BatchTimings, other.BatchTimings)) {
            return false;
        }
        if (!Objects.equals(this.studentPassword, other.studentPassword)) {
            return false;
        }
        if (!Objects.equals(this.DaysInWeek, other.DaysInWeek)) {
            return false;
        }
        if (!Objects.equals(this.JoiningDate, other.JoiningDate)) {
            return false;
        }
        if (!Objects.equals(this.DateofBirth, other.DateofBirth)) {
            return false;
        }
        if (!Objects.equals(this.AdmissionDate, other.AdmissionDate)) {
            return false;
        }
        if (!Objects.equals(this.DueDate, other.DueDate)) {
            return false;
        }
        if (!Objects.equals(this.nextPaymentDate, other.nextPaymentDate)) {
            return false;
        }
        if (!Objects.equals(this.Image, other.Image)) {
            return false;
        }
        if (!Objects.equals(this.imagepath, other.imagepath)) {
            return false;
        }
        if (!Objects.equals(this.adminOfBranch, other.adminOfBranch)) {
            return false;
        }
        if (!Objects.equals(this.CustomerAccount, other.CustomerAccount)) {
            return false;
        }
        if (!Objects.equals(this.packageCourse, other.packageCourse)) {
            return false;
        }
        if (this.fee != other.fee) {
            return false;
        }
        if (this.discper != other.discper) {
            return false;
        }
        if (this.disamount != other.disamount) {
            return false;
        }
        if (this.finalamount != other.finalamount) {
            return false;
        }
        if (!Objects.equals(this.studentAccount, other.studentAccount)) {
            return false;
        }
        if (this.shiftToOldStudent != other.shiftToOldStudent) {
            return false;
        }
        if (this.birthdaysmsstatus != other.birthdaysmsstatus) {
            return false;
        }
        if (this.duedateSmsstatus != other.duedateSmsstatus) {
            return false;
        }
        if (!Objects.equals(this.duedateSmsdate, other.duedateSmsdate)) {
            return false;
        }
        if (!Objects.equals(this.DateofBirthsmsdate, other.DateofBirthsmsdate)) {
            return false;
        }
        return true;
    }
    
    
    

}
