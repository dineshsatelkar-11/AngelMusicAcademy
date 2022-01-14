package com.accede.angel.admin.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="event")
public class Event implements Serializable{

	private static final long serialVersionUID = 1L;

	@Id @GeneratedValue
	private long eventId;
	private String eventName;
	private Date eventDate;
	private String eventVenue;
	private String eventAgeCategory;
	private String eventRules;
	private String eventImgName; 
	private Date eventCreatedDate = new Date();
	
	@OneToMany(fetch=FetchType.EAGER,mappedBy="event")
	private List<EventApplication> applications;
	
	public List<EventApplication> getApplications() {
		return applications;
	}
	public void setApplications(List<EventApplication> applications) {
		this.applications = applications;
	}
	public long getEventId() {
		return eventId;
	}
	public void setEventId(long eventId) {
		this.eventId = eventId;
	}
	public String getEventName() {
		return eventName;
	}
	public void setEventName(String eventName) {
		this.eventName = eventName;
	}
	public Date getEventDate() {
		return eventDate;
	}
	public void setEventDate(Date eventDate) {
		this.eventDate = eventDate;
	}
	public String getEventVenue() {
		return eventVenue;
	}
	public void setEventVenue(String eventVenue) {
		this.eventVenue = eventVenue;
	}
	public String getEventAgeCategory() {
		return eventAgeCategory;
	}
	public void setEventAgeCategory(String eventAgeCategory) {
		this.eventAgeCategory = eventAgeCategory;
	}
	public String getEventRules() {
		return eventRules;
	}
	public void setEventRules(String eventRules) {
		this.eventRules = eventRules;
	}
	public String getEventImgName() {
		return eventImgName;
	}
	public void setEventImgName(String eventImgName) {
		this.eventImgName = eventImgName;
	}
	public Date getEventCreatedDate() {
		return eventCreatedDate;
	}
	public void setEventCreatedDate(Date eventCreatedDate) {
		this.eventCreatedDate = eventCreatedDate;
	}
	
	
	
}
