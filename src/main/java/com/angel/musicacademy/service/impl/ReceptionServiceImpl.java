package com.angel.musicacademy.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.angel.musicacademy.dao.ReceptionDAO;
import com.angel.musicacademy.model.Rent;
import com.angel.musicacademy.model.Repair;
import com.angel.musicacademy.model.Sell;
import com.angel.musicacademy.service.ReceptionService;

import org.springframework.beans.factory.annotation.Autowired;

@Repository
@Transactional
public class ReceptionServiceImpl implements ReceptionService
{
	   
	
	@Autowired
	private ReceptionDAO receptionDAO;
	
	/**************************** Repair Work *********************************/
		@Override
		public long addRepair(Repair repair) {
			return receptionDAO.addRepair(repair);
		}

		@Override
		public void deleteRepair(int id) {
			// TODO Auto-generated method stub
			receptionDAO.deleteRepair(id);
		}

		@Override
		public List<Repair> getAllRepair() {
			// TODO Auto-generated method stub
			return receptionDAO.getAllRepair();
		}

		@Override
		public Repair getRepair(int id) {
			// TODO Auto-generated method stub
			return receptionDAO.getRepair(id);
		}
	        @Override
		public List<String> getAllExistingRepairnumbers() {
			// TODO Auto-generated method stub
			return receptionDAO.getAllExestingRepairnumbers();
		}
	         @Override
		public Repair getRepair(String repairNo) {
			// TODO Auto-generated method stub
			return receptionDAO.getRepair(repairNo);
		}
		/**************************** End Of Repair Work *********************************/
		
	  /**************************** Rent Work *********************************/
     
	         @Override
	    public long createInstrumentRent(Rent rent) {
	         return receptionDAO.createInstrumentRent(rent);
	    }
	         @Override
	    public Rent getRent(String rentno) {
	     	// TODO Auto-generated method stub
	     	return receptionDAO.getRent(rentno);
	    }
	         @Override
	    public List<String> getAllExistingRentnumbers() {
	     	// TODO Auto-generated method stub
	     	return receptionDAO.getAllExistingRentnumbers();
	    }
	         @Override
	 		public void deleteRent(int id) {
	 			// TODO Auto-generated method stub
	 			receptionDAO.deleteRent(id);
	 		}

	 		@Override
	 		public List<Rent> getAllRent() {
	 			// TODO Auto-generated method stub
	 			return receptionDAO.getAllRent();
	 		}

	 		@Override
	 		public Rent getRent(int id) {
	 			// TODO Auto-generated method stub
	 			return receptionDAO.getRent(id);
	 		}
	        
	 /**************************** End Of Rent Work *********************************/
      
	/**************************** Sell Work *********************************/

	         @Override
	         public long createInstrumentSell(Sell sell) {
	             return receptionDAO.createInstrumentSell(sell);
	         }
	         
	         @Override
	     	public Sell getSell(String sellno) {
	     		// TODO Auto-generated method stub
	     		return receptionDAO.getSell(sellno);
	     	}
	         @Override
	     	public List<String> getAllExistingSellnumbers() {
	     		// TODO Auto-generated method stub
	     		return receptionDAO.getAllExistingSellnumbers();
	     	}
	         @Override
	 		public void deleteSell(int id) {
	 			// TODO Auto-generated method stub
	 			receptionDAO.deleteSell(id);
	 		}

	 		@Override
	 		public List<Sell> getAllSell() {
	 			// TODO Auto-generated method stub
	 			return receptionDAO.getAllSell();
	 		}

	 		@Override
	 		public Sell getSell(int id) {
	 			// TODO Auto-generated method stub
	 			return receptionDAO.getSell(id);
	 		}
 /**************************** End Of Sell Work *********************************/

}
