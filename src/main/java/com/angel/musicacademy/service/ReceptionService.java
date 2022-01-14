package com.angel.musicacademy.service;

import java.util.List;

import com.angel.musicacademy.model.Rent;
import com.angel.musicacademy.model.Repair;
import com.angel.musicacademy.model.Sell;

public interface ReceptionService {
	
	 
    /**************************** Repair Work *********************************/
	
	public long addRepair(Repair repair);
    public void deleteRepair(int id);
    public List<Repair> getAllRepair();
    public Repair getRepair(int id);   
     public List<String> getAllExistingRepairnumbers();
     public Repair getRepair(String repairNo);
    /**************************** End Of Repair Work *********************************/
    
     /**************************** Rent Work *********************************/
     
     public long createInstrumentRent(Rent rent);
     public Rent getRent(String rentno); 
     public List<String> getAllExistingRentnumbers();
     public void deleteRent(int id);
     public List<Rent> getAllRent();
     public Rent getRent(int id); 

     /**************************** End Of Rent Work *********************************/

     /**************************** Sell Work *********************************/
     
     public long createInstrumentSell(Sell sell);
     public Sell getSell(String sellno); 
     public List<String> getAllExistingSellnumbers();
     public void deleteSell(int id);
     public List<Sell> getAllSell();
     public Sell getSell(int id); 
     
     /**************************** End Of Sell Work *********************************/
}
