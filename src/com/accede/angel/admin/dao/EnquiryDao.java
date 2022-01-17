/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.accede.angel.admin.dao;

import com.accede.angel.admin.model.Admin;
import com.accede.angel.admin.model.Course;
import com.accede.angel.admin.model.Enquiry;
import com.accede.angel.admin.model.EnquiryDetail;
import com.accede.angel.admin.model.Rent;
import com.accede.angel.services.Dates;
import com.accede.angel.util.HibernateUtil;
import java.util.Date;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Accede
 */
public class EnquiryDao {
    public Enquiry getEnquiryByID(int cid) {
       Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = s.beginTransaction();
        try {
            System.err.println("User ID:-" + cid);
            Enquiry u = (Enquiry) s.get(Enquiry.class, cid);
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
     
     
      public boolean update(Enquiry i)
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
      
      public boolean saveEnquiry(Enquiry b)
    {
        Session session =HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
//         if (isEmailExist(b)) {
//            return false;
//        }  
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
       public boolean saveEnquiryDetail(EnquiryDetail b)
    {
        Session session =HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
//         if (isEmailExist(b)) {
//            return false;
//        }  
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
   
 
   
    
       public int Delete(int id)
    {
      Session session=HibernateUtil.getSessionFactory().openSession();
      Transaction tx = session.beginTransaction();
      try {
             Enquiry delete = (Enquiry) session.load(Course.class, id);
            session.delete(delete);
            tx.commit();
          } 
        catch (Exception e)
         {
           e.printStackTrace();
           tx.rollback();
           return 0;
         }
        finally 
         {
          session.close();
          
         }
      return 1;
    }
    
       
        public List<Enquiry> getAllEnquiry()
    {
      Session session=HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("FROM Enquiry");
            List<Enquiry> enquiry = query.list();
            tx.commit();
            return enquiry;
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
        
        
     
        
        
        
        public List<Enquiry> getAllEnquiryFollowup(Admin admin) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(Enquiry.class);
            Date startdate = new Dates().getEndingDate(new Date(), -365);
            Date enddate = new Dates().getEndingDate(new Date(), 1);
          
            criteria.add(Restrictions.eq("adminOfBranch", admin));
            criteria.add(Restrictions.ge("followupDate", startdate));
            criteria.add(Restrictions.lt("followupDate", enddate));
            criteria.add(Restrictions.eq("remove", true));
            criteria.add(Restrictions.eq("deleteEnquiry", true));
            criteria.addOrder(Order.asc("followupDate"));
        
            criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);

            List<Enquiry> users = criteria.list();
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
    
      public List<Enquiry> getAllEnquiryFollowup1(Admin admin) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(Enquiry.class);
           
            criteria.add(Restrictions.eq("adminOfBranch", admin));
          
           
            criteria.add(Restrictions.eq("deleteEnquiry", true));
            criteria.addOrder(Order.asc("followupDate"));
        
            criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);

            List<Enquiry> users = criteria.list();
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
    public List<Enquiry> getAllEnquiryFollowup1() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(Enquiry.class);
           
          
          
           
            criteria.add(Restrictions.eq("deleteEnquiry", true));
            criteria.addOrder(Order.asc("followupDate"));
        
            criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);

            List<Enquiry> users = criteria.list();
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
    
      public List<Enquiry> getTodayDueDateStudent(Admin a) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(Enquiry.class);
            criteria.add(Restrictions.eq("adminOfBranch", a));
            criteria.add(Restrictions.eq("remove", true));
            criteria.add(Restrictions.eq("deleteEnquiry", true));
            criteria.add(Restrictions.eq("followupDate", Dates.getStartingDate(new Date())));
             criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY); 
            List<Enquiry> users = criteria.list();
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
           
           
             public List<Enquiry> getAllDueDateStudent(Admin a) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(Enquiry.class);
            criteria.add(Restrictions.eq("adminOfBranch", a));
            criteria.add(Restrictions.eq("remove", true));
            criteria.add(Restrictions.eq("deleteEnquiry", true));
              
             criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY); 
            List<Enquiry> users = criteria.list();
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
           
           
             public List<Enquiry> getYesterdatDueDateStudent(Admin a) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(Enquiry.class);
            criteria.add(Restrictions.eq("adminOfBranch", a));
            criteria.add(Restrictions.eq("remove", true));
            criteria.add(Restrictions.eq("deleteEnquiry", true));
            criteria.add(Restrictions.like("followupDate", Dates.getEndingDate(new Date(), -1)));
            criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY); 
           
            List<Enquiry> users = criteria.list();
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
           
           
          public List<Enquiry> getTommorowDueDateStudent(Admin a) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(Enquiry.class);
            criteria.add(Restrictions.eq("adminOfBranch", a));
          criteria.add(Restrictions.eq("remove", true));
            criteria.add(Restrictions.eq("deleteEnquiry", true));
           criteria.add(Restrictions.eq("followupDate", Dates.getEndingDate(new Date(), 1)));
           criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY); 
            List<Enquiry> users = criteria.list();
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
