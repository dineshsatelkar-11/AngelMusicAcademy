/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.accede.angel.sell.dao;

import com.accede.angel.sell.model.CustomerSaleDetails;
import com.accede.angel.sell.model.ProductModel;
import com.accede.angel.util.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author asd
 */
public class CustomerSaleDetailsDAO {
    
       public boolean SaveProduct(CustomerSaleDetails r1) {

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
     
    
    public List<CustomerSaleDetails> getAllProduct()
    {
      Session session=HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("FROM CustomerSaleDetails");
            List<CustomerSaleDetails> client = query.list();
            tx.commit();
            return client;
        }
        catch (Exception e)
         {
           e.printStackTrace();
           tx.rollback();
         }
        finally 
         {
          session.close();
         }
        return null;
    }
    
    
     
    
    
    
    
    
   public CustomerSaleDetails getCustomerSaleDetailsByID(int cid) {
       Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = s.beginTransaction();
        try {
            System.err.println("User ID:-" + cid);
            CustomerSaleDetails u = (CustomerSaleDetails) s.get(CustomerSaleDetails.class, cid);
            tx.commit();
            return u;
        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {
            s.close();
        }
        return null;
    } 
    
    
    
    
}
