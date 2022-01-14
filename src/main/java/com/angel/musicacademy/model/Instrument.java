package com.angel.musicacademy.model;

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
	private String instrumentDescription;
	private String instrumentImgName;
	private Date instrumentAddedDate = new Date();
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "instrument")
    private List<InstrumentSubcategory> instrumentSubcategory;
	
	public List<InstrumentSubcategory> getInstrumentSubcategory() {
		return instrumentSubcategory;
	}
	public void setInstrumentSubcategory(List<InstrumentSubcategory> instrumentSubcategory) {
		this.instrumentSubcategory = instrumentSubcategory;
	}
	public String getInstrumentImgName() {
		return instrumentImgName;
	}
	public void setInstrumentImgName(String instrumentImgName) {
		this.instrumentImgName = instrumentImgName;
	}
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
	public String getInstrumentDescription() {
		return instrumentDescription;
	}
	public void setInstrumentDescription(String instrumentDescription) {
		this.instrumentDescription = instrumentDescription;
	}
	public Date getInstrumentAddedDate() {
		return instrumentAddedDate;
	}
	public void setInstrumentAddedDate(Date instrumentAddedDate) {
		this.instrumentAddedDate = instrumentAddedDate;
	}
	
	
}
