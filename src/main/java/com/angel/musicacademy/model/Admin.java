package com.angel.musicacademy.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="admin")
public class Admin implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id @GeneratedValue
	private int adminId;
	private String adminEmail;
	private String adminName;
	private String adminMobileNo;
	private String adminPassword;
	private String receptionPassword;
	public String getReceptionPassword() {
		return receptionPassword;
	}
	public void setReceptionPassword(String receptionPassword) {
		this.receptionPassword = receptionPassword;
	}
	private int otp;
	private Date registeredDate = new Date();
	@OneToOne(cascade=CascadeType.ALL)
	private Branch adminOfBranch;
	
	public int getAdminId() {
		return adminId;
	}
	public void setAdminId(int adminId) {
		this.adminId = adminId;
	}
	public String getAdminEmail() {
		return adminEmail;
	}
	public void setAdminEmail(String adminEmail) {
		this.adminEmail = adminEmail;
	}
	public String getAdminMobileNo() {
		return adminMobileNo;
	}
	public void setAdminMobileNo(String adminMobileNo) {
		this.adminMobileNo = adminMobileNo;
	}
	public String getAdminPassword() {
		return adminPassword;
	}
	public void setAdminPassword(String adminPassword) {
		this.adminPassword = adminPassword;
	}
	public int getOtp() {
		return otp;
	}
	public void setOtp(int otp) {
		this.otp = otp;
	}
	public Date getRegisteredDate() {
		return registeredDate;
	}
	public void setRegisteredDate(Date registeredDate) {
		this.registeredDate = registeredDate;
	}
	public Branch getAdminOfBranch() {
		return adminOfBranch;
	}
	public void setAdminOfBranch(Branch adminOfBranch) {
		this.adminOfBranch = adminOfBranch;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName.toUpperCase();
	}
		
	
}
