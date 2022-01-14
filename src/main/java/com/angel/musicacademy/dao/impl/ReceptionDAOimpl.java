package com.angel.musicacademy.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.angel.musicacademy.dao.ReceptionDAO;
import com.angel.musicacademy.model.Rent;
import com.angel.musicacademy.model.Repair;
import com.angel.musicacademy.model.Sell;
import com.angel.musicacademy.util.HibernateUtil;

@Repository
@Transactional
public class ReceptionDAOimpl implements ReceptionDAO
{
	 @Autowired
	 private HibernateUtil hibernateUtil;
	  @Autowired
	    private SessionFactory sessionFactory;
	
/**************************** Repair Work *********************************/
	
	@Override
	public long addRepair(Repair repair) {
		return (long) hibernateUtil.create(repair);
	}

	@Override
	public void deleteRepair(int id) {
		Repair repair = new Repair();
		repair.setRepairId(id);
        hibernateUtil.delete(repair);
	}

	@Override
	public List<Repair> getAllRepair() {
		return hibernateUtil.fetchAll(Repair.class);
	}

	@Override
	public Repair getRepair(int id) {
		return hibernateUtil.fetchById(id, Repair.class);
	}
	
         @Override
		public Repair getRepair(String repairNo) {
			// TODO Auto-generated method stub
			String query = "FROM Repair WHERE repairNo='"+repairNo+"' ";
			return hibernateUtil.getUserOrAdmin(query);
		}
        
          @Override
		public List<String> getAllExestingRepairnumbers() {
			// TODO Auto-generated method stub
	    	Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(Repair.class)
                    .add(Restrictions.isNotNull("repairNo"))
                .setProjection(Projections.property("repairNo"));
	    	@SuppressWarnings("unchecked")
			List<String> repairNos = (List<String>) criteria.list();
	    	return repairNos;
		}
	    
	    
	/**************************** End Of Repair Work *********************************/
	
    /**************************** Repair Work *********************************/

          @Override
  	    public long createInstrumentRent(Rent rent) {        
  	        return (Long) hibernateUtil.create(rent);
  	    }
          
          @Override
  		public Rent getRent(String rentno) {
  			// TODO Auto-generated method stub
  			String query = "FROM Rent WHERE rentNo='"+rentno+"' ";
  			return hibernateUtil.getUserOrAdmin(query);
  		}
          
          @Override
  		public List<String> getAllExistingRentnumbers() {
  			// TODO Auto-generated method stub
  	    	Session session = sessionFactory.getCurrentSession();
  			Criteria criteria = session.createCriteria(Rent.class)
  													   .add(Restrictions.isNotNull("rentNo"))
  										    	       .setProjection(Projections.property("rentNo"));
  	    	@SuppressWarnings("unchecked")
  			List<String> rentNo = (List<String>) criteria.list();
  	    	return rentNo;
  		}
          
      	@Override
    	public void deleteRent(int id) {
    		Rent rent = new Rent();
    		rent.setRentId(id);
            hibernateUtil.delete(rent);
    	}

    	@Override
    	public List<Rent> getAllRent() {
    		return hibernateUtil.fetchAll(Rent.class);
    	}

    	@Override
    	public Rent getRent(int id) {
    		return hibernateUtil.fetchById(id, Rent.class);
    	}
          
        
   /**************************** End Of Repair Work *********************************/
    
   /**************************** Sell Work *********************************/

          @Override
  	    public long createInstrumentSell(Sell sell) {        
  	        return (Long) hibernateUtil.create(sell);
  	    }
          
          @Override
  		public Sell getSell(String sellno) {
  			// TODO Auto-generated method stub
  			String query = "FROM Sell WHERE sellNo='"+sellno+"' ";
  			return hibernateUtil.getUserOrAdmin(query);
  		}
          
          @Override
  		public List<String> getAllExistingSellnumbers() {
  			// TODO Auto-generated method stub
  	    	Session session = sessionFactory.getCurrentSession();
  			Criteria criteria = session.createCriteria(Sell.class)
  													   .add(Restrictions.isNotNull("sellNo"))
  										    	       .setProjection(Projections.property("sellNo"));
  	    	@SuppressWarnings("unchecked")
  			List<String> sellNos = (List<String>) criteria.list();
  	    	return sellNos;
  		}
          
      	@Override
    	public void deleteSell(int id) {
    		Sell sell = new Sell();
    		sell.setSellId(id);
            hibernateUtil.delete(sell);
    	}

    	@Override
    	public List<Sell> getAllSell() {
    		return hibernateUtil.fetchAll(Sell.class);
    	}

    	@Override
    	public Sell getSell(int id) {
    		return hibernateUtil.fetchById(id, Sell.class);
    	}
  /**************************** End Of Sell Work *********************************/

}
