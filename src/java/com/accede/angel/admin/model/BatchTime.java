package com.accede.angel.admin.model;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="batchtime")
public class BatchTime {

	@Id @GeneratedValue
	private int batchTimeId;
	private String batchTiming;
         @OneToOne(fetch = FetchType.EAGER)
    private Admin adminOfBranch;
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

    public Admin getAdminOfBranch() {
        return adminOfBranch;
    }

    public void setAdminOfBranch(Admin adminOfBranch) {
        this.adminOfBranch = adminOfBranch;
    }
	
	
}
