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
import com.accede.angel.admin.model.Repair;
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
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author ACER
 */
public class RepairDao {
    
     public List<String> getAllRepairnumbers()
    {
      Session session=HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("Select repairNo  from Repair");
            List<String> user = query.list();
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
    
    
    
     public Repair getelementByID(int cid) {
       Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = s.beginTransaction();
        try {
            System.err.println("User ID:-" + cid);
            Repair u = (Repair) s.get(Repair.class, cid);
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
     
      public boolean update(Repair i)
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
      
      
        public boolean updateRepairDetails(RepairDetails i)
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
      
      public boolean saveRepair(Repair b)
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
   
      public boolean saveRepairDetails(RepairDetails b)
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
   
    public Repair otpmatch(Repair r) {
          Session session=HibernateUtil.getSessionFactory().openSession();
       
       Repair r1=null;
       try{
         
         Query q=session.createQuery("from Repair where Email=:e and Otp=:o");
//         q.setParameter("e",r.getEmail());
//         q.setParameter("o",r.getOtp());
      
         r1=(Repair)q.uniqueResult();
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
             Repair delete = (Repair) session.load(Repair.class, id);
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
    
        
    public Repair getRepairByID(long id)
{
       Session session=HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
             Query query = session.createQuery("FROM Repair WHERE repairId=:PRD_ID");
             query.setParameter("PRD_ID", id);
             Repair admission = (Repair) query.uniqueResult();
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
    
    
    public Repair getbyRepairtNo(String r) {
          Session session=HibernateUtil.getSessionFactory().openSession();
       
       Repair r1=null;
       try{
         
         Query q=session.createQuery("from Repair where repairNo=:e ");
         q.setParameter("e",r);
//         q.setParameter("o",r.getOtp());
      
         r1=(Repair)q.uniqueResult();
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
    
    
    public List<Repair> getAllRepairRequestForAdmin(Admin a) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(Repair.class);
            criteria.add(Restrictions.eq("adminOfBranch", a));
            criteria.add(Restrictions.eq("duedateSmsstatus", true));
          criteria.addOrder(Order.desc("receivedDate"));
            criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY); 
           
            List<Repair> users = criteria.list();
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
    
    public List<Repair> getAllRepairRequestForAdmin() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(Repair.class);
          
          criteria.addOrder(Order.desc("receivedDate"));
            criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY); 
           
            List<Repair> users = criteria.list();
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
        
    
        public List<Repair> getAllRepairInquiry()
    {
      Session session=HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("FROM Repair");
            List<Repair> client = query.list();
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
    
     public long getLastRepairID()
    {
        Session session=HibernateUtil.getSessionFactory().openSession(); 
        Transaction tx = session.beginTransaction();
        long lastInvoiceID = 0;
        try {
           Query query = session.createQuery("SELECT MAX(repairId) FROM Repair");
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
     
       public long getLastRepairDetailsID()
    {
        Session session=HibernateUtil.getSessionFactory().openSession(); 
        Transaction tx = session.beginTransaction();
        long lastInvoiceID = 0;
        try {
           Query query = session.createQuery("SELECT MAX(AccountId) FROM RepairDetails");
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
     
     
    
    
      public List<Repair> getTodayDueDateStudent(Admin a) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(Repair.class);
            criteria.add(Restrictions.eq("adminOfBranch", a));
            criteria.add(Restrictions.eq("CloseRequest", true));
            criteria.add(Restrictions.eq("returnDate", Dates.getStartingDate(new Date())));
             criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY); 
            List<Repair> users = criteria.list();
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
           
           
             public List<Repair> getAllDueDateStudent(Admin a) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(Repair.class);
            criteria.add(Restrictions.eq("adminOfBranch", a));
            criteria.add(Restrictions.eq("CloseRequest", true));
              
             criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY); 
            List<Repair> users = criteria.list();
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
           
           
             public List<Repair> getYesterdatDueDateStudent(Admin a) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(Repair.class);
            criteria.add(Restrictions.eq("adminOfBranch", a));
            criteria.add(Restrictions.eq("CloseRequest", true));
            criteria.add(Restrictions.like("returnDate", Dates.getEndingDate(new Date(), -1)));
            criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY); 
           
            List<Repair> users = criteria.list();
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
           
           
          public List<Repair> getTommorowDueDateStudent(Admin a) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(Repair.class);
            criteria.add(Restrictions.eq("adminOfBranch", a));
            criteria.add(Restrictions.eq("CloseRequest", true));
           criteria.add(Restrictions.eq("returnDate", Dates.getEndingDate(new Date(), 1)));
           criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY); 
            List<Repair> users = criteria.list();
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
    
          
          
          
            public List<Repair> getTodayDueDateStudent1() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(Repair.class);
          
            criteria.add(Restrictions.eq("CloseRequest", true));
            criteria.add(Restrictions.eq("returnDate", Dates.getStartingDate(new Date())));
             criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY); 
            List<Repair> users = criteria.list();
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
           
           
             public List<Repair> getAllDueDateStudent1() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(Repair.class);
            
            criteria.add(Restrictions.eq("CloseRequest", true));
              
             criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY); 
            List<Repair> users = criteria.list();
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
           
           
             public List<Repair> getYesterdatDueDateStudent1() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(Repair.class);
         
            criteria.add(Restrictions.eq("CloseRequest", true));
            criteria.add(Restrictions.like("returnDate", Dates.getEndingDate(new Date(), -1)));
            criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY); 
           
            List<Repair> users = criteria.list();
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
           
           
          public List<Repair> getTommorowDueDateStudent1() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(Repair.class);
         
            criteria.add(Restrictions.eq("CloseRequest", true));
           criteria.add(Restrictions.eq("returnDate", Dates.getEndingDate(new Date(), 1)));
           criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY); 
            List<Repair> users = criteria.list();
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
          
     public List<Repair> getAllRepairRequestForCust(CustomerAccount a) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(Repair.class);
            criteria.add(Restrictions.eq("CustomerAccount", a));
            
            criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY); 
           
            List<Repair> users = criteria.list();
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
