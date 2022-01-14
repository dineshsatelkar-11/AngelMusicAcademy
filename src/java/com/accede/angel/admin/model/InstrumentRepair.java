/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.accede.angel.admin.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

/**
 *
 * @author Admin
 */

@Entity
public class InstrumentRepair {
    private static final long serialVersionUID = 1L;

	@Id @GeneratedValue
	private int instrumentId;
	private String instrumentName;
	private int instrumentRepairCost;

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
        this.instrumentName = instrumentName;
    }

    public int getInstrumentRepairCost() {
        return instrumentRepairCost;
    }

    public void setInstrumentRepairCost(int instrumentRepairCost) {
        this.instrumentRepairCost = instrumentRepairCost;
    }
        
        
        
}
