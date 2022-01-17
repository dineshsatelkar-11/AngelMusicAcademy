/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.accede.angel.admin.dao;

import com.accede.angel.admin.model.Admin;
import com.accede.angel.admin.model.BankDetails;
import com.accede.angel.admin.model.Employee;
import com.accede.angel.util.HibernateUtil;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author a2z
 */
public class BankDetailDao {
    
    public boolean saveBankDetails(BankDetails b)
    {
        Session session =HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
       
        
        try {
            session.save(b);
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
    public BankDetails getBankByID(long BankId)
{
       Session session=HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
             Query query = session.createQuery("FROM BankDetails WHERE id=:PRD_ID");
             query.setParameter("PRD_ID", BankId);
             BankDetails emp = (BankDetails) query.uniqueResult();
             tx.commit();
             return emp;
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
    public boolean updateBank(BankDetails b)
    {
        Session session =HibernateUtil.getSessionFactory().openSession();       
        Transaction tx = session.beginTransaction();
        //System.out.println("saveadmin");
        
        try {
            session.update(b);
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
    
}
