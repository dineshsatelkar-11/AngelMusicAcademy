/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.accede.angel.admin.dao;

import com.accede.angel.admin.model.Admin;
import com.accede.angel.admin.model.Admission;
import com.accede.angel.admin.model.ClassEnquiry;
import com.accede.angel.admin.model.CustomerAccount;
import com.accede.angel.admin.model.Instrument;
import com.accede.angel.admin.model.StudentAccount;
import com.accede.angel.services.Dates;
import com.accede.angel.util.HibernateUtil;
import java.util.Date;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author accede
 */
public class AdmissionDao {

    public boolean saveClassEnquiry(ClassEnquiry c)
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
     public boolean update(Admission i) {
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
      public Admission getAdmission(Admission admn) {
          Session session=HibernateUtil.getSessionFactory().openSession();
         Transaction tx = session.beginTransaction();
       Admission admn1=null;
       try{
          
         Query q=session.createQuery("from Admission where admissionNo=:u and studentPassword=:s");
         q.setParameter("u",admn.getAdmissionNo());
         q.setParameter("s",admn.getStudentPassword());
       System.out.println("student==" + admn.getAdmissionNo() );
        System.out.println("password==" + admn.getStudentPassword() );
         admn1=(Admission)q.uniqueResult();
        
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
      
       public Admission getAdmissionByAdmissionno(String admissionno) {
          Session session=HibernateUtil.getSessionFactory().openSession();
         Transaction tx = session.beginTransaction();
       Admission admn1=null;
       try{
          
         Query q=session.createQuery("from Admission where admissionNo=:u ");
         q.setParameter("u",admissionno);
        
       
         admn1=(Admission)q.uniqueResult();
        
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
      
    public Admission getAdmissionByID(long admissionId)
{
       Session session=HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
             Query query = session.createQuery("FROM Admission WHERE AdmissionId=:PRD_ID");
             query.setParameter("PRD_ID", admissionId);
             Admission admission = (Admission) query.uniqueResult();
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
    
  
     
     public boolean saveStudentAccount(StudentAccount c)
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
    
    public ClassEnquiry getStudByEmailorMobile(ClassEnquiry c) 
    {
        Session session=HibernateUtil.getSessionFactory().openSession();
        ClassEnquiry r2=null;
        try{
         
         Query q=session.createQuery("from ClassEnquiry where Email=:Email or Mobile=:Mobile ");
         q.setParameter("Email",c.getEmail());
         q.setParameter("Mobile",c.getMobile());
        
      
         r2=(ClassEnquiry)q.uniqueResult();
         return r2;
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
    
    public boolean saveAdmission(Admission a)
    {
        Session session =HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
       if (isAdmissionexist(a)) {
            return false;
        }
        try {
            session.saveOrUpdate(a);
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
    
    public boolean isAdmissionexist(Admission p) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(Admission.class);
            criteria.add(Restrictions.eq("CustomerAccount", p.getCustomerAccount()));

           
          

            Admission u = (Admission) criteria.uniqueResult();
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
    
    
    public long getLastAdmissionID()
    {
        Session session=HibernateUtil.getSessionFactory().openSession(); 
        Transaction tx = session.beginTransaction();
        long lastInvoiceID = 0;
        try {
           Query query = session.createQuery("SELECT MAX(AdmissionId) FROM Admission");
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
    public long getLastStudentAccountID()
    {
        Session session=HibernateUtil.getSessionFactory().openSession(); 
        Transaction tx = session.beginTransaction();
        long lastInvoiceID = 0;
        try {
           Query query = session.createQuery("SELECT MAX(AccountId) FROM StudentAccount");
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
 public List<String> getAllExestingJRnumbers()
    {
      Session session=HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("Select admissionNo  from Admission");
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
      public List<ClassEnquiry> getAllClassEnquiry()
    {
      Session session=HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("FROM ClassEnquiry");
            List<ClassEnquiry> classEnquiry = query.list();
            tx.commit();
            return classEnquiry;
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
      
        public List<Admission> getAllAdmission()
    {
      Session session=HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("FROM Admission order by AdmissionDate desc");
            List<Admission> admission = query.list();
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
          public boolean updateAdmission(Admission i)
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
    
          
           public List<Admission> getTodayDueDateStudent(Admin a) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(Admission.class);
            criteria.add(Restrictions.eq("adminOfBranch", a));
            criteria.add(Restrictions.eq("shiftToOldStudent", true));
            criteria.add(Restrictions.eq("DueDate", Dates.getStartingDate(new Date())));
             criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY); 
            List<Admission> users = criteria.list();
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
           
           
             public List<Admission> getAllDueDateStudent(Admin a) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(Admission.class);
            criteria.add(Restrictions.eq("adminOfBranch", a));
            criteria.add(Restrictions.eq("shiftToOldStudent", true));
             
             criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY); 
            List<Admission> users = criteria.list();
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
           
           
             public List<Admission> getYesterdatDueDateStudent(Admin a) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(Admission.class);
            criteria.add(Restrictions.eq("adminOfBranch", a));
            criteria.add(Restrictions.eq("shiftToOldStudent", true));
            criteria.add(Restrictions.like("DueDate", Dates.getEndingDate(new Date(), -1)));
            criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY); 
           
            List<Admission> users = criteria.list();
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
           
           
          public List<Admission> getTommorowDueDateStudent(Admin a) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(Admission.class);
            criteria.add(Restrictions.eq("adminOfBranch", a));
            criteria.add(Restrictions.eq("shiftToOldStudent", true));
           criteria.add(Restrictions.eq("DueDate", Dates.getEndingDate(new Date(), 1)));
           criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY); 
            List<Admission> users = criteria.list();
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
          
           public List<Admission> getStudentListRegular(Admin a) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(Admission.class);
            criteria.add(Restrictions.eq("adminOfBranch", a));
            criteria.add(Restrictions.eq("shiftToOldStudent", true));
             criteria.addOrder(Order.desc("AdmissionDate"));
           
           criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY); 
            List<Admission> users = criteria.list();
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
           
           
             public List<Admission> getStudentListRegular() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(Admission.class);
         
            criteria.add(Restrictions.eq("shiftToOldStudent", true));
             criteria.addOrder(Order.desc("AdmissionDate"));
           
           criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY); 
            List<Admission> users = criteria.list();
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
             
               public List<Admission> getStudentListRegular1() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(Admission.class);
         
            criteria.add(Restrictions.eq("shiftToOldStudent", true));
            criteria.add(Restrictions.eq("nextPaymentDate", new Date()));
             criteria.addOrder(Order.desc("AdmissionDate"));
           
           criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY); 
            List<Admission> users = criteria.list();
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
           
               public List<Admission> getStudentListRegular2() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(Admission.class);
         
            criteria.add(Restrictions.eq("shiftToOldStudent", true));
          
             criteria.add(Restrictions.like("nextPaymentDate", Dates.getEndingDate(new Date(), -1)));
             criteria.addOrder(Order.desc("AdmissionDate"));
           
           criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY); 
            List<Admission> users = criteria.list();
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
               
               
            public List<Admission> getStudentListOld(Admin a) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(Admission.class);
            criteria.add(Restrictions.eq("adminOfBranch", a));
            criteria.add(Restrictions.eq("shiftToOldStudent", false));
             criteria.addOrder(Order.desc("AdmissionDate"));
           
           criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY); 
            List<Admission> users = criteria.list();
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
          
            
              public List<Admission> getStudentListOld() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(Admission.class);
           
            criteria.add(Restrictions.eq("shiftToOldStudent", false));
             criteria.addOrder(Order.desc("AdmissionDate"));
           
           criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY); 
            List<Admission> users = criteria.list();
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
         
          
           public List<Admission> getTodayDueDateStudent1() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(Admission.class);
          
            criteria.add(Restrictions.eq("shiftToOldStudent", true));
            criteria.add(Restrictions.eq("DueDate", Dates.getStartingDate(new Date())));
             criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY); 
            List<Admission> users = criteria.list();
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
           
           
             public List<Admission> getAllDueDateStudent1() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(Admission.class);
           
            criteria.add(Restrictions.eq("shiftToOldStudent", true));
             
             criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY); 
            List<Admission> users = criteria.list();
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
           
           
             public List<Admission> getYesterdatDueDateStudent1() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(Admission.class);
           
            criteria.add(Restrictions.eq("shiftToOldStudent", true));
            criteria.add(Restrictions.like("DueDate", Dates.getEndingDate(new Date(), -1)));
            criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY); 
           
            List<Admission> users = criteria.list();
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
           
           
          public List<Admission> getTommorowDueDateStudent1() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(Admission.class);
         
            criteria.add(Restrictions.eq("shiftToOldStudent", true));
           criteria.add(Restrictions.eq("DueDate", Dates.getEndingDate(new Date(), 1)));
           criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY); 
            List<Admission> users = criteria.list();
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
         public Admission getAdmissionByAccount(CustomerAccount CustomerAccount) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(Admission.class);
         
            criteria.add(Restrictions.eq("CustomerAccount", CustomerAccount));
          
           criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY); 
            Admission users = (Admission)criteria.uniqueResult();
           
            return users;
        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {
            session.close();
        }
        return null;
    }     
    
         
         
          public StudentAccount getStudentAccountByid(long id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(StudentAccount.class);
         
            criteria.add(Restrictions.eq("AccountId", id));
          
           criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY); 
            StudentAccount users = (StudentAccount)criteria.uniqueResult();
           
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
