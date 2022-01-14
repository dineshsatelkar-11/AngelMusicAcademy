/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.accede.angel.admin.dao;

import com.accede.angel.admin.model.Admin;
import com.accede.angel.admin.model.Admission;
import com.accede.angel.admin.model.CustomerAccount;
import com.accede.angel.admin.model.StudentPdf;
import com.accede.angel.admin.model.StudentVanishHistory;
import com.accede.angel.util.HibernateUtil;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Admin
 */
public class StudentVanishHistoryDao {
    
    
    
    
    
     public StudentVanishHistory getStudentVanishHistoryByID(int cid) {
       Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = s.beginTransaction();
        try {
            System.err.println("User ID:-" + cid);
            StudentVanishHistory u = (StudentVanishHistory) s.get(StudentVanishHistory.class, cid);
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
     
     
      public boolean update(StudentVanishHistory i)
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
      
      public boolean saveStudentVanishHistory(StudentVanishHistory b)
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
      
      
       public List<StudentVanishHistory> getStudentVanishHistory(CustomerAccount a) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(StudentVanishHistory.class);
            criteria.add(Restrictions.eq("CustomerAccount", a));
            criteria.addOrder(Order.desc("id"));
           
           criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY); 
            List<StudentVanishHistory> users = criteria.list();
            System.err.println("Recently Joined Users: " + users.size());
            return users;
        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {
            session.close();
        }
        return null;
    } 
       
       
       public List<StudentVanishHistory> getStudentVanishHistory(Admin a) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(StudentVanishHistory.class);
            criteria.add(Restrictions.eq("adminOfBranch", a));
            criteria.addOrder(Order.desc("id"));
           
           criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY); 
            List<StudentVanishHistory> users = criteria.list();
            System.err.println("Recently Joined Users: " + users.size());
            return users;
        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {
            session.close();
        }
        return null;
    } 
       
       
         public List<StudentVanishHistory> getStudentVanishHistory() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(StudentVanishHistory.class);
        
            criteria.addOrder(Order.desc("id"));
           
           criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY); 
            List<StudentVanishHistory> users = criteria.list();
            System.err.println("Recently Joined Users: " + users.size());
            return users;
        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {
            session.close();
        }
        return null;
    } 
      
}
