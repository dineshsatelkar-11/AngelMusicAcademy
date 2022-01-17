/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.accede.angel.admin.dao;

import com.accede.angel.admin.model.Admin;
import com.accede.angel.admin.model.Admission;
import com.accede.angel.admin.model.AssignPDFAdmin;
import com.accede.angel.admin.model.AssignPaymentHistory;
import com.accede.angel.admin.model.ClassEnquiry;
import com.accede.angel.admin.model.PackageCourse;
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
public class AssignPDFAdminDao {
    
    
     public boolean saveAssignPDFAdmin(AssignPDFAdmin c)
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
     
      public boolean update(AssignPDFAdmin i) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            session.update(i);
            tx.commit();
              return true;
        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {
            session.close();
        }
          return false;
    }
      
      
        public boolean saveAssignPDFAdmin(AssignPaymentHistory c)
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
     
      public boolean update(AssignPaymentHistory i) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            session.update(i);
            tx.commit();
              return true;
        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {
            session.close();
        }
          return false;
    }
      
      
       public List<AssignPDFAdmin> getAssignPDFAdmin() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(AssignPDFAdmin.class);
            criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
            List<AssignPDFAdmin> u = criteria.list();

          
           
            return u;
        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {
            session.close();
        }
        return null;
    }
      
       public AssignPDFAdmin getAssignPDFAdmin(Admin admin) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
         AssignPDFAdmin AssignPDFAdmin=null;
        try {
            Criteria criteria = session.createCriteria(AssignPDFAdmin.class);

          
            criteria.add(Restrictions.eq("admin", admin));

            criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
              AssignPDFAdmin = (AssignPDFAdmin) criteria.uniqueResult();
  return AssignPDFAdmin;

        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {
            session.close();
        }
        return AssignPDFAdmin;
    }

       
         public AssignPDFAdmin getAssignPDFAdmin(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
         AssignPDFAdmin AssignPDFAdmin=null;
        try {
            Criteria criteria = session.createCriteria(AssignPDFAdmin.class);

          
            criteria.add(Restrictions.eq("Id", id));

            criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
              AssignPDFAdmin = (AssignPDFAdmin) criteria.uniqueResult();
  return AssignPDFAdmin;

        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {
            session.close();
        }
        return AssignPDFAdmin;
    }
      public List<AssignPDFAdmin> getAllAssignPDFAdmin()
    {
      Session session=HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("Select AssignPDFAdmin");
            List<AssignPDFAdmin> user = query.list();
            tx.commit();
            return user;
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
