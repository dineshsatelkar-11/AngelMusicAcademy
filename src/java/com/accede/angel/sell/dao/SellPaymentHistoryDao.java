/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.accede.angel.sell.dao;

import com.accede.angel.sell.model.BranchClassSale;
import com.accede.angel.sell.model.ColorModel;
import com.accede.angel.sell.model.CustomerSale;
import com.accede.angel.sell.model.ProductModel;
import com.accede.angel.sell.model.SellPaymentHistory;
import com.accede.angel.util.HibernateUtil;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Admin
 */
public class SellPaymentHistoryDao {
     public boolean saveSellPaymentHistory(SellPaymentHistory r1) {

        Session session = HibernateUtil.getSessionFactory().openSession();
       
        
        Transaction t = null;
        try {
            t = session.getTransaction();
            t.begin();
            session.saveOrUpdate(r1);
            t.commit();
        } catch (Exception e) {
            e.printStackTrace();
            t.rollback();
        } finally {
            session.close();
        }
        return true;
    }
     
     
    public List<SellPaymentHistory> getAllSellPaymentHistory(CustomerSale CustomerSale) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(SellPaymentHistory.class);
           
        
            criteria.add(Restrictions.eq("CustomerSale", CustomerSale));
            
criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY); 
           
            List<SellPaymentHistory> users = criteria.list();
            System.err.println("Recently Joined Users: " + users.size());
            return users;
        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {
            session.close();
        }
        return null;
    }
       
     
}
