/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.accede.angel.admin.dao;

import com.accede.angel.admin.model.PreviousStudent;
import com.accede.angel.util.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author asd
 */
public class PreviousStudentDAO {
    
    
    public boolean Savebranch(PreviousStudent r1) {

        Session session = HibernateUtil.getSessionFactory().openSession();
          if (isPreviousStudentExist(r1)) {
            return false;
        } 
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
     
    
    
       public static boolean isPreviousStudentExist(PreviousStudent b) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        boolean result = false;
           System.out.println("Instrument-"+b.getMobilenumber());
        Transaction t = null;
        try {
            t = session.getTransaction();
            t.begin();
            Query query = session.createQuery("from PreviousStudent where mobilenumber=:mobilenumber");
            query.setParameter("mobilenumber", b.getMobilenumber());
//            System.out.println("Instrument-"+b.getInstrumentName());
            PreviousStudent u = (PreviousStudent) query.uniqueResult();
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
  
       public List<PreviousStudent> getAllCelloClient()
    {
      Session session=HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("FROM PreviousStudent");
            List<PreviousStudent> client = query.list();
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
    
 public List<PreviousStudent> getPurchaseProductReport(String query )
      {
          List<PreviousStudent> list=null;
          Transaction tra=null;
           Session session=HibernateUtil.getSessionFactory().openSession(); 
          try {
              tra=session.beginTransaction();
              list=session.createQuery(query).list();
          } catch (RuntimeException e) {
              e.printStackTrace();
          }
          finally{
              session.close();
          }
          
          return list; 
      }
    



    
}
