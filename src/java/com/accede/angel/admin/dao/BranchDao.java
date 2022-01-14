/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.accede.angel.admin.dao;

import com.accede.angel.admin.model.Admin;
import com.accede.angel.admin.model.Branch;
import com.accede.angel.admin.model.Course;
import com.accede.angel.util.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Accede
 */
public class BranchDao {
    
    
    
       public Admin getAdmin(Admin admn) {
          Session session=HibernateUtil.getSessionFactory().openSession();
         Transaction tx = session.beginTransaction();
       Admin admn1=null;
       try{
          
         Query q=session.createQuery("from Admin where adminEmail=:u and adminPassword=:s");
         q.setParameter("u",admn.getAdminEmail());
         q.setParameter("s",admn.getAdminPassword());
      
         admn1=(Admin)q.uniqueResult();
        
         return admn1;
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
       
       
       
       
    public Admin getAdminByID(int cid) {
       Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = s.beginTransaction();
        try {
            System.err.println("User ID:-" + cid);
            Admin u = (Admin) s.get(Admin.class, cid);
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
    
    
      public Branch getBranchByID(int cid) {
       Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = s.beginTransaction();
        try {
            System.err.println("User ID:-" + cid);
            Branch u = (Branch) s.get(Branch.class, cid);
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
    
     public boolean Savebranch(Branch r1) {

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
     
         public int getLastBranchID()
    {
        Session session=HibernateUtil.getSessionFactory().openSession(); 
        Transaction tx = session.beginTransaction();
        int lastInvoiceID = 0;
        try {
           Query query = session.createQuery("SELECT MAX(branchId) FROM Branch");
           lastInvoiceID = (int) query.uniqueResult();
            System.err.println("Last Invoice ID "+lastInvoiceID);
           tx.commit();
           return lastInvoiceID;
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
        return lastInvoiceID;
    }
     
        public List<Branch> getAllBranch()
    {
      Session session=HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("FROM Branch");
            List<Branch> branch = query.list();
            tx.commit();
            return branch;
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
