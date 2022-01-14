package com.angel.musicacademy.model;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="branch")
public class Branch {

	@Id @GeneratedValue
	private int branchId;
	private String branchName;
	private String branchAddress;
	
	@OneToOne(fetch=FetchType.EAGER,cascade=CascadeType.ALL)
	private Admin admin;
	
	
	
	public Admin getAdmin() {
		return admin;
	}
	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	private Date branchRegisteredDate = new Date();
	
	public int getBranchId() {
		return branchId;
	}
	public void setBranchId(int branchId) {
		this.branchId = branchId;
	}
	public String getBranchName() {
		return branchName;
	}
	public void setBranchName(String branchName) {
		this.branchName = branchName.toUpperCase();
	}
	public String getBranchAddress() {
		return branchAddress;
	}
	public void setBranchAddress(String branchAddress) {
		this.branchAddress = branchAddress;
	}
	public Date getBranchRegisteredDate() {
		return branchRegisteredDate;
	}
	public void setBranchRegisteredDate(Date branchRegisteredDate) {
		this.branchRegisteredDate = branchRegisteredDate;
	}
	
	
}
