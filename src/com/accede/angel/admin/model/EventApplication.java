package com.accede.angel.admin.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="eventapplication")
public class EventApplication implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id @GeneratedValue
	private long eventApplicationId;
	private String applicantName;
	@Temporal(TemporalType.DATE)
	private Date applicantDOB;
	private String applicantGender;
	private String applicantAddress;
	private String applicantEmail;
	private String applicantMobileNo;
	private String applicantSchoolName;
	private String applicantMusicTeacherName;
	private String applicantAgeCategory;
	private String applicantPerformanceForm; //Subject
	private String applicantPhotoName;
	private String eventNo;
	@Temporal(TemporalType.DATE)
	private Date appliedOn = new Date();
        private User user;
	
	@ManyToOne
	private Event event;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
	
	
	public String getEventNo() {
		return eventNo;
	}
	public void setEventNo(String eventNo) {
		this.eventNo = eventNo;
	}
	public Event getEvent() {
		return event;
	}
	public void setEvent(Event event) {
		this.event = event;
	}
	public long getEventApplicationId() {
		return eventApplicationId;
	}
	public void setEventApplicationId(long eventApplicationId) {
		this.eventApplicationId = eventApplicationId;
	}
	public String getApplicantName() {
		return applicantName;
	}
	public void setApplicantName(String applicantName) {
		this.applicantName = applicantName;
	}
	public Date getApplicantDOB() {
		return applicantDOB;
	}
	public void setApplicantDOB(Date applicantDOB) {
		this.applicantDOB = applicantDOB;
	}
	public String getApplicantGender() {
		return applicantGender;
	}
	public void setApplicantGender(String applicantGender) {
		this.applicantGender = applicantGender;
	}
	public String getApplicantAddress() {
		return applicantAddress;
	}
	public void setApplicantAddress(String applicantAddress) {
		this.applicantAddress = applicantAddress;
	}
	public String getApplicantEmail() {
		return applicantEmail;
	}
	public void setApplicantEmail(String applicantEmail) {
		this.applicantEmail = applicantEmail;
	}
	public String getApplicantMobileNo() {
		return applicantMobileNo;
	}
	public void setApplicantMobileNo(String applicantMobileNo) {
		this.applicantMobileNo = applicantMobileNo;
	}
	public String getApplicantSchoolName() {
		return applicantSchoolName;
	}
	public void setApplicantSchoolName(String applicantSchoolName) {
		this.applicantSchoolName = applicantSchoolName;
	}
	public String getApplicantMusicTeacherName() {
		return applicantMusicTeacherName;
	}
	public void setApplicantMusicTeacherName(String applicantMusicTeacherName) {
		this.applicantMusicTeacherName = applicantMusicTeacherName;
	}
	public String getApplicantAgeCategory() {
		return applicantAgeCategory;
	}
	public void setApplicantAgeCategory(String applicantAgeCategory) {
		this.applicantAgeCategory = applicantAgeCategory;
	}
	public String getApplicantPerformanceForm() {
		return applicantPerformanceForm;
	}
	public void setApplicantPerformanceForm(String applicantPerformanceForm) {
		this.applicantPerformanceForm = applicantPerformanceForm;
	}
	public String getApplicantPhotoName() {
		return applicantPhotoName;
	}
	public void setApplicantPhotoName(String applicantPhotoName) {
		this.applicantPhotoName = applicantPhotoName;
	}
	public Date getAppliedOn() {
		return appliedOn;
	}
	public void setAppliedOn(Date appliedOn) {
		this.appliedOn = appliedOn;
	}
	
	
	
}
