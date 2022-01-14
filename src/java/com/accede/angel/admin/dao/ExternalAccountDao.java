/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.accede.angel.admin.dao;

import com.accede.angel.admin.model.Admin;
import com.accede.angel.admin.model.Branch;
import com.accede.angel.admin.model.ExternalAccount;
import com.accede.angel.sell.model.ProductModel;
import com.accede.angel.util.HibernateUtil;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author asd
 */
public class ExternalAccountDao {
   
    
    public boolean updateExternalAccount(ExternalAccount b)
    {
        Session session =HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        System.out.println("saveadmin");
        
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
     public ExternalAccount getExternalAccountByID(int cid) {
       Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = s.beginTransaction();
        try {
            System.err.println("User ID:-" + cid);
            ExternalAccount u = (ExternalAccount) s.get(ExternalAccount.class, cid);
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
      public boolean SaveExternalAccount(ExternalAccount r1) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        if (isExternalAccountexist(r1)) {
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
    
    public boolean isExternalAccountexist(ExternalAccount p) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(ExternalAccount.class);
            criteria.add(Restrictions.eq("AccountHolderName", p.getAccountHolderName()));
            criteria.add(Restrictions.eq("adminOfBranch", p.getAdminOfBranch()));
           
          

            ExternalAccount u = (ExternalAccount) criteria.uniqueResult();
            if (u != null) {
                return true;
            }

        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {
            session.close();
        }
        return false;
    }
    
    
     public List<ExternalAccount> getAccountList(Admin p) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(ExternalAccount.class);
           
            criteria.add(Restrictions.eq("adminOfBranch", p));
           
          

            List<ExternalAccount>  u =  criteria.list();
           
                return u;
          

        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {
            session.close();
        }
        return null;
    }
     
     
      public List<ExternalAccount> getAllAccountList() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(ExternalAccount.class);
           
        
           
          

            List<ExternalAccount>  u =  criteria.list();
           
                return u;
          

        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {
            session.close();
        }
        return null;
    }
 
    
}
