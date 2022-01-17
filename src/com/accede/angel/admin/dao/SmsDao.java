/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.accede.angel.admin.dao;

import com.accede.angel.admin.model.Admin;
import com.accede.angel.admin.model.Payment;
import com.accede.angel.admin.model.SmsModel;
import com.accede.angel.util.HibernateUtil;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Accede
 */
public class SmsDao {
   
    
      public boolean saveSms(SmsModel r1) {

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
  
     
    public List<SmsModel> getAllSms(Admin admin) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        List<SmsModel> users = null;
        try {
            Criteria criteria = session.createCriteria(SmsModel.class);

            criteria.add(Restrictions.eq("adminOfBranch", admin));

            criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
            users = criteria.list();

            return users;

        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {
            session.close();
        }
        return users;
    } 
      
    
    
     public SmsModel getSmsModelByID(long cid) {
       Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = s.beginTransaction();
        try {
            System.err.println("User ID:-" + cid);
            SmsModel u = (SmsModel) s.get(SmsModel.class, cid);
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
       public List<SmsModel> getAllSms()
    {
      Session session=HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("FROM SmsModel");
            List<SmsModel> smsModel = query.list();
            tx.commit();
            return smsModel;
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
       
       
         public boolean deleteSmsByID(long smsId)
{
         Session session=HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
             Query query = session.createQuery("DELETE FROM SmsModel WHERE smsId=:PRD_ID");
             query.setParameter("PRD_ID", smsId);
             int i = query.executeUpdate();
             System.err.println(i+" Product Deleted");
             tx.commit();
             return Boolean.TRUE;
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
         return Boolean.FALSE;
}
    
}
