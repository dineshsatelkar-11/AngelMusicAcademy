package com.angel.musicacademy.model;

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
@Table(name="subject")
public class Subject implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id @GeneratedValue
	private long subjectId;
    private String subjectName;
	private String subjectDescription;
	private Date subjectRegisteredDate = new Date();

  
	@OneToMany(fetch=FetchType.EAGER,mappedBy="subject")
        private List<Course> course;
	public long getSubjectId() {
		return subjectId;
	}
	public void setSubjectId(long subjectId) {
		this.subjectId = subjectId;
	}
	public String getSubjectName() {
		return subjectName;
	}
	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName.toUpperCase();
	}
	public String getSubjectDescription() {
		return subjectDescription;
	}
	public void setSubjectDescription(String subjectDescription) {
		this.subjectDescription = subjectDescription;
	}
	public Date getSubjectRegisteredDate() {
		return subjectRegisteredDate;
	}
	public void setSubjectRegisteredDate(Date subjectRegisteredDate) {
		this.subjectRegisteredDate = subjectRegisteredDate;
	}
}
