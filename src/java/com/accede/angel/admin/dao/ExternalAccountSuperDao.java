/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.accede.angel.admin.dao;

import com.accede.angel.admin.model.Employee;
import com.accede.angel.admin.model.ExternalAccount;
import com.accede.angel.admin.model.ExternalAccountSuper;
import com.accede.angel.util.HibernateUtil;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Admin
 */
public class ExternalAccountSuperDao {
    
     public ExternalAccountSuper getEmployeeByID(int EmployeeId)
{
       Session session=HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
             Query query = session.createQuery("FROM ExternalAccountSuper WHERE id=:PRD_ID");
             query.setParameter("PRD_ID", EmployeeId);
             ExternalAccountSuper emp = (ExternalAccountSuper) query.uniqueResult();
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
    
    
    public List<ExternalAccountSuper> getAllExternalAccountSuper() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
       List<ExternalAccountSuper> users=null;
        try {
            Criteria criteria = session.createCriteria(ExternalAccountSuper.class);

         criteria.add(Restrictions.eq("status",true));
        
         
          
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
    
     public boolean SaveExternalAccount(ExternalAccountSuper r1) {

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
    
    public boolean isExternalAccountexist(ExternalAccountSuper p) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(ExternalAccountSuper.class);
            criteria.add(Restrictions.eq("Mobileno", p.getMobileno()));
        
           
          

            ExternalAccountSuper u = (ExternalAccountSuper) criteria.uniqueResult();
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
    
}
