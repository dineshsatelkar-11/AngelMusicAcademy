/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.accede.angel.admin.dao;

import com.accede.angel.admin.model.Admin;
import com.accede.angel.admin.model.BatchTime;
import com.accede.angel.admin.model.BatchTimings;
import com.accede.angel.admin.model.Branch;
import com.accede.angel.sell.model.ProductModel;
import com.accede.angel.util.HibernateUtil;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author ACER
 */
public class BatchTimeDa0 {
    
     public BatchTime getBatchTimeByID(int cid) {
       Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = s.beginTransaction();
        try {
            System.err.println("User ID:-" + cid);
            BatchTime u = (BatchTime) s.get(BatchTime.class, cid);
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
     
     
     public BatchTimings getBatchTimingsByID(int cid) {
       Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = s.beginTransaction();
        try {
            System.err.println("User ID:-" + cid);
            BatchTimings u = (BatchTimings) s.get(BatchTimings.class, cid);
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
     
      public void update(BatchTime i)
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
      
      public boolean saveBatchTime(BatchTime b)
    {
        Session session =HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
          
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
      
      public boolean updateBatchTime(BatchTime b)
    {
        Session session =HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
          
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
      
      
       public boolean saveBatchTimings(BatchTimings b)
    {
        Session session =HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
          
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
      
        public static boolean isBatchTimeExist(BatchTime b) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        boolean result = false;
        Transaction t = null;
        try {
            t = session.getTransaction();
            t.begin();
            Query query = session.createQuery("from BatchTime where batchTiming=:BatchTime and adminOfBranch:adminOfBranch");
            query.setParameter("BatchTime", b.getBatchTiming());
            query.setParameter("adminOfBranch", b.getAdminOfBranch());
            System.out.println("b.getAdminOfBranch()-"+b.getAdminOfBranch());
            System.out.println("BatchTime-"+b.getBatchTiming());
            BatchTime u = (BatchTime) query.uniqueResult();
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

   
    public BatchTime otpmatch(BatchTime r) {
          Session session=HibernateUtil.getSessionFactory().openSession();
       
       BatchTime r1=null;
       try{
         
         Query q=session.createQuery("from BatchTime where Email=:e and Otp=:o");
//         q.setParameter("e",r.getEmail());
//         q.setParameter("o",r.getOtp());
      
         r1=(BatchTime)q.uniqueResult();
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
             BatchTime delete = (BatchTime) session.load(BatchTime.class, id);
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
    
       
        public List<BatchTime> getAllBatchTime()
    {
      Session session=HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("FROM BatchTime");
            List<BatchTime> client = query.list();
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
        
        
          public List<BatchTime> getAllBatchTimeSuperAdmin()
    {
      Session session=HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("FROM BatchTime GROUP BY batchTiming");
            List<BatchTime> client = query.list();
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
        
      
        
       
        
        public List<BatchTime> getAllBatchTimeByGroup()
    {
      Session session=HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("FROM BatchTime ");
            List<BatchTime> client = query.list();
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
        
        
         public List<BatchTimings> getAllBatchTimings()
    {
      Session session=HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("FROM BatchTimings");
            List<BatchTimings> client = query.list();
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
