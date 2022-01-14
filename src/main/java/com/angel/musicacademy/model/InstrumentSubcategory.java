package com.angel.musicacademy.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="instrumentSubcategory")

public class InstrumentSubcategory implements Serializable{

	private static final long serialVersionUID = 1L;

	@Id @GeneratedValue
	private long instrumentSubcategoryId;
    public long getInstrumentSubcategoryId() {
		return instrumentSubcategoryId;
	}

	public void setInstrumentSubcategoryId(long instrumentSubcategoryId) {
		this.instrumentSubcategoryId = instrumentSubcategoryId;
	}

	private String instrumentSubcategoryName;
     
     @ManyToOne(cascade = CascadeType.ALL,fetch = FetchType.EAGER)
     @JoinColumn(name = "INSTRUMENT")
     private Instrument instrument;

	



	public String getInstrumentSubcategoryName() {
		return instrumentSubcategoryName;
	}

	public void setInstrumentSubcategoryName(String instrumentSubcategoryName) {
		this.instrumentSubcategoryName = instrumentSubcategoryName;
	}

	public Instrument getInstrument() {
		return instrument;
	}

	public void setInstrument(Instrument instrument) {
		this.instrument = instrument;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
