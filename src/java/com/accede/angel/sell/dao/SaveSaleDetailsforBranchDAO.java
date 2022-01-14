/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.accede.angel.sell.dao;

import com.accede.angel.sell.model.BranchClassSellDetails;
import com.accede.angel.sell.model.BranchSale;
import com.accede.angel.sell.model.BranchSaleDetails;
import com.accede.angel.sell.model.TempSaleforBranch;
import com.accede.angel.util.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author asd
 */
public class SaveSaleDetailsforBranchDAO {
    
      
     public boolean saveBranchSaleDetails(BranchSaleDetails r1) {

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
     
     
     public boolean saveBranchSaleDetails(BranchClassSellDetails r1) {

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
        
      public BranchSaleDetails getpurchaseByID(int cid) 
    
    
    {
       Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = s.beginTransaction();
        try {
            System.err.println("User ID:-" + cid);
            BranchSaleDetails u = (BranchSaleDetails) s.get(BranchSaleDetails.class, cid);
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
     
     
            public List<BranchSaleDetails> getAllProduct()
    {
      Session session=HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("FROM BranchSaleDetails");
            List<BranchSaleDetails> client = query.list();
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
               public List<BranchSaleDetails> getAllProduct(BranchSaleDetails purchaseprod)
    {
      Session session=HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("FROM BranchSaleDetails");
            List<BranchSaleDetails> client = query.list();
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
}
