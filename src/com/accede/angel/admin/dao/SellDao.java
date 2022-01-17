/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.accede.angel.admin.dao;

import com.accede.angel.admin.model.Sell;
import com.accede.angel.util.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author ACER
 */
public class SellDao {
    
     public List<String> getAllSellnumbers()
    {
      Session session=HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("Select sellNo  from Sell");
            List<String> user = query.list();
            tx.commit();
            return user;
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
    
    
     public Sell getelementByID(int cid) {
       Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = s.beginTransaction();
        try {
            System.err.println("User ID:-" + cid);
            Sell u = (Sell) s.get(Sell.class, cid);
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
     
      public void update(Sell i)
{
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
             session.update(i);
             tx.commit();
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
}
      
      public boolean saveSell(Sell b)
    {
        Session session =HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
//         if (isEmailExist(b)) {
//            return false;
//        }  
        try {
            session.saveOrUpdate(b);
            tx.commit();
            return true;
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
        return false;
    } 
   
    public Sell otpmatch(Sell r) {
          Session session=HibernateUtil.getSessionFactory().openSession();
       
       Sell r1=null;
       try{
         
         Query q=session.createQuery("from Sell where Email=:e and Otp=:o");
//         q.setParameter("e",r.getEmail());
//         q.setParameter("o",r.getOtp());
      
         r1=(Sell)q.uniqueResult();
       //  System.out.println("============"+r1.getEmail());
         return r1;
       }
       catch(Exception e)
       {
           e.printStackTrace();
           
       }
       finally
       {
           session.close();
       }
       return null; 
     }
   
    
       public int Delete(int id)
    {
      Session session=HibernateUtil.getSessionFactory().openSession();
      Transaction tx = session.beginTransaction();
      try {
             Sell delete = (Sell) session.load(Sell.class, id);
            session.delete(delete);
            tx.commit();
          } 
        catch (Exception e)
         {
           e.printStackTrace();
           tx.rollback();
           return 0;
         }
        finally 
         {
          session.close();
          
         }
      return 1;
    }
    
       
        public List<Sell> getAllSellInquiry()
    {
      Session session=HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("FROM Sell");
            List<Sell> client = query.list();
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
