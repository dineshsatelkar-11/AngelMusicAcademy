package com.accede.angel.admin.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import java.util.List;

@Entity
@Table(name="instrument")
public class Instrument implements Serializable{

	private static final long serialVersionUID = 1L;

	@Id @GeneratedValue
	private int instrumentId;
	private String instrumentName;
	private int instrumentRentCost;
	
	
	private Date instrumentAddedDate = new Date();
	

	
	public int getInstrumentId() {
		return instrumentId;
	}
	public void setInstrumentId(int instrumentId) {
		this.instrumentId = instrumentId;
	}
	public String getInstrumentName() {
		return instrumentName;
	}
	public void setInstrumentName(String instrumentName) {
		this.instrumentName = instrumentName.toUpperCase();
	}
	
	public Date getInstrumentAddedDate() {
		return instrumentAddedDate;
	}
	public void setInstrumentAddedDate(Date instrumentAddedDate) {
		this.instrumentAddedDate = instrumentAddedDate;
	}

    public int getInstrumentRentCost() {
        return instrumentRentCost;
    }

    public void setInstrumentRentCost(int instrumentRentCost) {
        this.instrumentRentCost = instrumentRentCost;
    }
	
	
}
