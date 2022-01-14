/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.accede.angel.admin.dao;

import com.accede.angel.admin.model.Instrument;
import com.accede.angel.util.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author ACER
 */
public class InstrumentDao {
    
     public Instrument getInstrumentByID(int cid) {
       Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = s.beginTransaction();
        try {
            System.err.println("User ID:-" + cid);
            Instrument u = (Instrument) s.get(Instrument.class, cid);
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
     
      public boolean update(Instrument i)
{
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
             session.update(i);
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
      
      public boolean saveInstrument(Instrument b)
    {
        Session session =HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
         if (isInstrumentExist(b)) {
            return false;
        }  
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
      
      
      
    public static boolean isInstrumentExist(Instrument b) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        boolean result = false;
           System.out.println("Instrument-"+b.getInstrumentName());
        Transaction t = null;
        try {
            t = session.getTransaction();
            t.begin();
            Query query = session.createQuery("from Instrument where instrumentName=:instrumentName");
            query.setParameter("instrumentName", b.getInstrumentName());
            System.out.println("Instrument-"+b.getInstrumentName());
            Instrument u = (Instrument) query.uniqueResult();
             System.out.println("Instrument2-"+u);
            t.commit();
            if (u != null) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            t.rollback();
        } finally {
            session.close();
        }
        return result;
    }
    public Instrument getInstument(String r) {
          Session session=HibernateUtil.getSessionFactory().openSession();
       
       Instrument r1=null;
       try{
         
         Query q=session.createQuery("from Instrument where instrumentName=:e ");
        q.setParameter("e",r);

      
         r1=(Instrument)q.uniqueResult();
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
   
    
       public boolean Delete(int id)
    {
      Session session=HibernateUtil.getSessionFactory().openSession();
      Transaction tx = session.beginTransaction();
      try {
             Instrument delete = (Instrument) session.load(Instrument.class, id);
            session.delete(delete);
            tx.commit();
          } 
        catch (Exception e)
         {
           e.printStackTrace();
           tx.rollback();
           return false;
         }
        finally 
         {
          session.close();
          
         }
      return true;
    }
    
       
        public List<Instrument> getAllInstrumene()
    {
      Session session=HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("FROM Instrument");
            List<Instrument> client = query.list();
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
