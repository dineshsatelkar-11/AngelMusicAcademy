/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.accede.angel.admin.dao;

import com.accede.angel.admin.model.InstrumentSubcategory;
import com.accede.angel.util.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author ACER
 */
public class InstrumentSubcategoryDao {
    
    
    
     
       public InstrumentSubcategory getInstrumentSubcategoryByID(long id)
{
       Session session=HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
             Query query = session.createQuery("FROM InstrumentSubcategory WHERE instrumentSubcategoryId=:id");
             query.setParameter("id", id);
             InstrumentSubcategory instrumentSubcategory = (InstrumentSubcategory) query.uniqueResult();
             tx.commit();
             return instrumentSubcategory;
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
  
      public void update(InstrumentSubcategory i)
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
      
      public boolean saveInstrumentSubcategory(InstrumentSubcategory b)
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
   
    public InstrumentSubcategory otpmatch(InstrumentSubcategory r) {
          Session session=HibernateUtil.getSessionFactory().openSession();
       
       InstrumentSubcategory r1=null;
       try{
         
         Query q=session.createQuery("from InstrumentSubcategory where Email=:e and Otp=:o");
//         q.setParameter("e",r.getEmail());
//         q.setParameter("o",r.getOtp());
      
         r1=(InstrumentSubcategory)q.uniqueResult();
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
             InstrumentSubcategory delete = (InstrumentSubcategory) session.load(InstrumentSubcategory.class, id);
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
    
       
        public List<InstrumentSubcategory> getAllInstrumentSubcategory()
    {
      Session session=HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("FROM InstrumentSubcategory");
            List<InstrumentSubcategory> client = query.list();
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
