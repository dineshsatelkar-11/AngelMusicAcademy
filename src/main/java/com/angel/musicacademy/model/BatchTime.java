package com.angel.musicacademy.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="batchtime")
public class BatchTime {

	@Id @GeneratedValue
	private int batchTimeId;
	private String batchTiming;
	public int getBatchTimeId() {
		return batchTimeId;
	}
	public void setBatchTimeId(int batchTimeId) {
		this.batchTimeId = batchTimeId;
	}
	public String getBatchTiming() {
		return batchTiming;
	}
	public void setBatchTiming(String batchTiming) {
		this.batchTiming = batchTiming.toUpperCase();
	}
	
	
}
