package com.accede.angel.admin.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.accede.angel.util.Cons;

@Entity
@Table(name="user")
public class User implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id @GeneratedValue
	private long userId;
	private String jrno;
        private String counsellorName;
        private String userName;
        private String userMiddleName;
        private String userLastName;
	private String userPassword;
	private String userMobileNo;
	private String userParentMobileNo;

    public String getCounsellorName() {
        return counsellorName;
    }

    public void setCounsellorName(String counsellorName) {
        this.counsellorName = counsellorName;
    }

    public String getUserMiddleName() {
        return userMiddleName;
    }

    public void setUserMiddleName(String userMiddleName) {
        this.userMiddleName = userMiddleName;
    }

    public String getUserLastName() {
        return userLastName;
    }

    public void setUserLastName(String userLastName) {
        this.userLastName = userLastName;
    }

    public String getUserParentMobileNo() {
        return userParentMobileNo;
    }

    public void setUserParentMobileNo(String userParentMobileNo) {
        this.userParentMobileNo = userParentMobileNo;
    }

    public String getUserGender() {
        return userGender;
    }

    public void setUserGender(String userGender) {
        this.userGender = userGender;
    }

    public String getUserCourse() {
        return userCourse;
    }

    public void setUserCourse(String userCourse) {
        this.userCourse = userCourse;
    }
	private String userEmail;
	@Temporal(TemporalType.DATE)
	private Date userDOB;
	private int userAge;
        private String userGender;
	private String userAddress;
        private String userCourse;
	private String userSubject;
	@OneToOne(fetch=FetchType.EAGER)
	private Branch userBranch;
	private String userAttendingDays;
	private String userAttendingTime;
	private Date userRegisteredDate = new Date();
	
	private float totalFees;
	private float balance;
	@Temporal(TemporalType.DATE)
	private Date firstInstallmentDate;
	private float firstInstallment;
	@Temporal(TemporalType.DATE)
	private Date secondInstallmentDate;
	private float secondInstallment;
	@Temporal(TemporalType.DATE)
	private Date lastInstallmentDate;
	private float lastInstallment;
	private String status = Cons.STUDENT_STATUS_WATING;
        private String AdmissionMode;
        
       
        private Date userNextVisitReminder;

    public Date getUserNextVisitReminder() {
        return userNextVisitReminder;
    }

    public void setUserNextVisitReminder(Date userNextVisitReminder) {
        this.userNextVisitReminder = userNextVisitReminder;
    }

    public String getAdmissionMode() {
        return AdmissionMode;
    }

    public void setAdmissionMode(String AdmissionMode) {
        this.AdmissionMode = AdmissionMode;
    }
	
	
	
	public String getJrno() {
		return jrno;
	}

	public void setJrno(String jrno) {
		this.jrno = jrno;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public float getTotalFees() {
		return totalFees;
	}

	public void setTotalFees(float totalFees) {
		this.totalFees = totalFees;
	}

	public float getBalance() {
		return balance;
	}

	public void setBalance(float balance) {
		this.balance = balance;
	}

	public Date getFirstInstallmentDate() {
		return firstInstallmentDate;
	}

	public void setFirstInstallmentDate(Date firstInstallmentDate) {
		this.firstInstallmentDate = firstInstallmentDate;
	}

	public float getFirstInstallment() {
		return firstInstallment;
	}

	public void setFirstInstallment(float firstInstallment) {
		this.firstInstallment = firstInstallment;
	}

	public Date getSecondInstallmentDate() {
		return secondInstallmentDate;
	}

	public void setSecondInstallmentDate(Date secondInstallmentDate) {
		this.secondInstallmentDate = secondInstallmentDate;
	}

	public float getSecondInstallment() {
		return secondInstallment;
	}

	public void setSecondInstallment(float secondInstallment) {
		this.secondInstallment = secondInstallment;
	}

	public Date getLastInstallmentDate() {
		return lastInstallmentDate;
	}

	public void setLastInstallmentDate(Date lastInstallmentDate) {
		this.lastInstallmentDate = lastInstallmentDate;
	}

	public float getLastInstallment() {
		return lastInstallment;
	}

	public void setLastInstallment(float lastInstallment) {
		this.lastInstallment = lastInstallment;
	}

	public Date getUserRegisteredDate() {
		return userRegisteredDate;
	}

	public void setUserRegisteredDate(Date userRegisteredDate) {
		this.userRegisteredDate = userRegisteredDate;
	}

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName.toUpperCase();
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserMobileNo() {
		return userMobileNo;
	}

	public void setUserMobileNo(String userMobileNo) {
		this.userMobileNo = userMobileNo;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public Date getUserDOB() {
		return userDOB;
	}

	public void setUserDOB(Date userDOB) {
		this.userDOB = userDOB;
	}

	public int getUserAge() {
		return userAge;
	}

	public void setUserAge(int userAge) {
		this.userAge = userAge;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getUserSubject() {
		return userSubject;
	}

	public void setUserSubject(String userSubject) {
		this.userSubject = userSubject;
	}

	public Branch getUserBranch() {
		return userBranch;
	}

	public void setUserBranch(Branch userBranch) {
		this.userBranch = userBranch;
	}

	public String getUserAttendingDays() {
		return userAttendingDays;
	}

	public void setUserAttendingDays(String userAttendingDays) {
		this.userAttendingDays = userAttendingDays;
	}

	public String getUserAttendingTime() {
		return userAttendingTime;
	}

	public void setUserAttendingTime(String userAttendingTime) {
		this.userAttendingTime = userAttendingTime;
	}
	
}
