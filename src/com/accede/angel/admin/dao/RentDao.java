/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.accede.angel.admin.dao;

import com.accede.angel.admin.model.Admin;
import com.accede.angel.admin.model.Admission;
import com.accede.angel.admin.model.CustomerAccount;
import com.accede.angel.admin.model.Rent;
import com.accede.angel.admin.model.RentDetails;
import com.accede.angel.admin.model.RepairDetails;
import com.accede.angel.services.Dates;
import com.accede.angel.util.HibernateUtil;
import java.util.Date;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author ACER
 */
public class RentDao {
    
      public List<Rent> getAllRentnumbers()
    {
      Session session=HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
           Query query = session.createQuery("FROM Rent");
            List<Rent> user = query.list();
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
    
      public List<Rent> getAllRentRequestForAdmin(Admin a) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(Rent.class);
            criteria.add(Restrictions.eq("adminOfBranch", a));
          criteria.addOrder(Order.desc("receivedDate"));
            criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY); 
           
            List<Rent> users = criteria.list();
            System.err.println("Recently Joined Users: " + users.size());
            System.err.println("list: " + users);
            return users;
        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {
            session.close();
        }
        return null;
    }
      
      
      public List<Rent> getAllRentRequestForAdmin() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(Rent.class);
       
          criteria.addOrder(Order.desc("receivedDate"));
            criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY); 
           
            List<Rent> users = criteria.list();
            System.err.println("Recently Joined Users: " + users.size());
            System.err.println("list: " + users);
            return users;
        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {
            session.close();
        }
        return null;
    }
         
    public Rent getRentByID(long id)
{
       Session session=HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
             Query query = session.createQuery("FROM Rent WHERE Id=:PRD_ID");
             query.setParameter("PRD_ID", id);
             System.out.println("id-"+id);
             Rent admission = (Rent) query.uniqueResult();
                 System.out.println("admission-"+admission);
             tx.commit();
             return admission;
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
      public boolean update(Rent i)
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
      
      public boolean saveRent(Rent b)
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
      public boolean saveRentDetails(RentDetails b)
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
   
    public Rent getbyRentNo(String r) {
          Session session=HibernateUtil.getSessionFactory().openSession();
       
       Rent r1=null;
       try{
         
         Query q=session.createQuery("from Rent where rentNo=:e ");
         q.setParameter("e",r);
//         q.setParameter("o",r.getOtp());
      
         r1=(Rent)q.uniqueResult();
       //  System.out.println("============"+r1.getEmail());
         return r1;
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
   
    
       public int Delete(int id)
    {
      Session session=HibernateUtil.getSessionFactory().openSession();
      Transaction tx = session.beginTransaction();
      try {
             Rent delete = (Rent) session.load(Rent.class, id);
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
    
       
        public List<Rent> getAllRentInquiry()
    {
      Session session=HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("FROM Rent");
            List<Rent> client = query.list();
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
    
    public long getLastRentID()
    {
        Session session=HibernateUtil.getSessionFactory().openSession(); 
        Transaction tx = session.beginTransaction();
        long lastInvoiceID = 0;
        try {
           Query query = session.createQuery("SELECT MAX(Id) FROM Rent");
           lastInvoiceID = (long) query.uniqueResult();
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
    
    
    public long getLastRentDetailsID()
    {
        Session session=HibernateUtil.getSessionFactory().openSession(); 
        Transaction tx = session.beginTransaction();
        long lastInvoiceID = 0;
        try {
           Query query = session.createQuery("SELECT MAX(AccountId) FROM RentDetails");
           lastInvoiceID = (long) query.uniqueResult();
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
    
    
    
    
      public List<Rent> getTodayDueDateStudent(Admin a) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(Rent.class);
            criteria.add(Restrictions.eq("adminOfBranch", a));
            criteria.add(Restrictions.eq("CloseRequest", true));
            criteria.add(Restrictions.eq("receivedDate", Dates.getStartingDate(new Date())));
             criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY); 
            List<Rent> users = criteria.list();
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
           
           
             public List<Rent> getAllDueDateStudent(Admin a) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(Rent.class);
            criteria.add(Restrictions.eq("adminOfBranch", a));
            criteria.add(Restrictions.eq("CloseRequest", true));
              
             criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY); 
            List<Rent> users = criteria.list();
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
           
           
             public List<Rent> getYesterdatDueDateStudent(Admin a) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(Rent.class);
            criteria.add(Restrictions.eq("adminOfBranch", a));
            criteria.add(Restrictions.eq("CloseRequest", true));
            criteria.add(Restrictions.like("receivedDate", Dates.getEndingDate(new Date(), -1)));
            criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY); 
           
            List<Rent> users = criteria.list();
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
             
             
             public List<Rent> getAllRentRequestForCust(CustomerAccount a) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(Rent.class);
            criteria.add(Restrictions.eq("CustomerAccount", a));
          criteria.addOrder(Order.desc("receivedDate"));
            criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY); 
           
            List<Rent> users = criteria.list();
            System.err.println("Recently Joined Users: " + users.size());
            System.err.println("list: " + users);
            return users;
        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {
            session.close();
        }
        return null;
    }
             
             
               
           
          
             
          public List<Rent> getTommorowDueDateStudent(Admin a) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(Rent.class);
            criteria.add(Restrictions.eq("adminOfBranch", a));
            criteria.add(Restrictions.eq("CloseRequest", true));
           criteria.add(Restrictions.eq("receivedDate", Dates.getEndingDate(new Date(), 1)));
           criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY); 
            List<Rent> users = criteria.list();
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
          
          
          
             public List<Rent> getTodayDueDateStudent1() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(Rent.class);
//            criteria.add(Restrictions.eq("adminOfBranch", a));
            criteria.add(Restrictions.eq("CloseRequest", true));
            criteria.add(Restrictions.eq("receivedDate", Dates.getStartingDate(new Date())));
             criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY); 
            List<Rent> users = criteria.list();
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
           
           
             public List<Rent> getAllDueDateStudent1() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(Rent.class);
           
            criteria.add(Restrictions.eq("CloseRequest", true));
              
             criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY); 
            List<Rent> users = criteria.list();
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
           
           
             public List<Rent> getYesterdatDueDateStudent1() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(Rent.class);
          
            criteria.add(Restrictions.eq("CloseRequest", true));
            criteria.add(Restrictions.like("receivedDate", Dates.getEndingDate(new Date(), -1)));
            criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY); 
           
            List<Rent> users = criteria.list();
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
           
           
          public List<Rent> getTommorowDueDateStudent1() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(Rent.class);
          
            criteria.add(Restrictions.eq("CloseRequest", true));
           criteria.add(Restrictions.eq("receivedDate", Dates.getEndingDate(new Date(), 1)));
           criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY); 
            List<Rent> users = criteria.list();
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
