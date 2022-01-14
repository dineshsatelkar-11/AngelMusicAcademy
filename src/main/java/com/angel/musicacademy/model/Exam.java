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
@Table(name="exam")
public class Exam implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id @GeneratedValue
	private long examId;
	private String examName;
	private Date examDate;
	@OneToMany(fetch=FetchType.EAGER,mappedBy="exam")
	private List<ExamApplication> examApplications;
	
	
	
	public Date getExamDate() {
		return examDate;
	}
	public void setExamDate(Date examDate) {
		this.examDate = examDate;
	}
	public long getExamId() {
		return examId;
	}
	public void setExamId(long examId) {
		this.examId = examId;
	}
	public String getExamName() {
		return examName;
	}
	public void setExamName(String examName) {
		this.examName = examName;
	}
	public List<ExamApplication> getExamApplications() {
		return examApplications;
	}
	public void setExamApplications(List<ExamApplication> examApplications) {
		this.examApplications = examApplications;
	}
	
}
