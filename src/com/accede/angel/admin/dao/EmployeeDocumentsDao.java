/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.accede.angel.admin.dao;

import com.accede.angel.admin.model.Employee;
import com.accede.angel.admin.model.EmployeeDocuments;
import com.accede.angel.admin.model.EmployeeSalary;
import com.accede.angel.util.HibernateUtil;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Admin
 */
public class EmployeeDocumentsDao {
 
    
     public boolean saveEmployeeDocuments(EmployeeDocuments c)
    {
        Session session =HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
       
        try {
            session.saveOrUpdate(c);
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
      public boolean updateEmployeeDocuments(EmployeeDocuments c)
    {
        Session session =HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
       
        try {
            session.saveOrUpdate(c);
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
      
      
        public List<EmployeeDocuments> getAllEmployeeDocuments(Employee Employee) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
       List<EmployeeDocuments> users=null;
        try {
            Criteria criteria = session.createCriteria(EmployeeDocuments.class);

            criteria.add(Restrictions.eq("Employee", Employee));
         
          
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
        
        
         public EmployeeDocuments getEmployeeDocumentsByid(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(EmployeeDocuments.class);
         
            criteria.add(Restrictions.eq("id", id));
          
           criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY); 
            EmployeeDocuments users = (EmployeeDocuments)criteria.uniqueResult();
           
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
