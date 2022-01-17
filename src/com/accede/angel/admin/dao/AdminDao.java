/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.accede.angel.admin.dao;

import com.accede.angel.admin.model.Admin;
import com.accede.angel.admin.model.BatchTime;
import com.accede.angel.admin.model.Branch;
import com.accede.angel.admin.model.SessionKey;
import com.accede.angel.admin.model.StudentAccount;

import com.accede.angel.services.DynamicGenerator;
import com.accede.angel.util.HibernateUtil;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author accede
 */
public class AdminDao {
    
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
    // for batch timing
     
     public void updateAdminid(Admin i)
{
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
             session.update(i);
             tx.commit();
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
}
     
     
public boolean saveadmin(Admin b)
    {
        Session session =HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        System.out.println("saveadmin");
        
        try {
            session.save(b);
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
     
     
public boolean saveSessionKey(SessionKey b)
    {
        Session session =HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        System.out.println("saveadmin");
        
        try {
            if(b.getSessionkey() != null)
            {
                
                 String timeStamp = new SimpleDateFormat("yyyyMMdd_HHmmss").format(Calendar.getInstance().getTime());
           
            DynamicGenerator dg = new DynamicGenerator();
            String no = dg.passwordGenerator();
            String sessionidd = no + timeStamp;
            b.setSessionkey(sessionidd);
            }
            session.save(b);
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




 public boolean deletesessionkey() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("DELETE FROM SessionKey ");

            int i = query.executeUpdate();
            System.err.println(i + " Product Deleted");
            tx.commit();
            return Boolean.TRUE;
        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {
            session.close();
        }
        return Boolean.FALSE;
    }

 
  
  public List<SessionKey> getAllSessionKeyobject()
    {
      Session session=HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
          Query query = session.createQuery("FROM SessionKey");
            List<SessionKey> branch = query.list();
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
   public List<String> getAllSessionKey()
    {
      Session session=HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("select sessionkey from SessionKey");
            List<String> branch = query.list();
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
    
  
public boolean updateadminprofilepic(Admin b)
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
public boolean saveadmin1(Admin b)
    {
        Session session =HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
          
        try {
            session.save(b);
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
   

public boolean saveBranch(Branch b)
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
    public static boolean isEmailExist(Admin b) 
    {
         Session session=HibernateUtil.getSessionFactory().openSession();
        boolean result = true;
        Transaction t=null;
        try
        {
            t=session.getTransaction();
            t.begin();
           Query query = session.createQuery("from Admin where adminEmail=:adminEmail");
            query.setParameter("adminEmail",b.getAdminEmail() );
            Admin u = (Admin)query.uniqueResult();
            t.commit();
            if(u!=null)
                return false;
        }
        catch(Exception e)
        {
            e.printStackTrace();
            t.rollback();
        }
        finally
        {
            session.close();
        }
       return result;
    }  
   
   
   
    
    
       
         public Admin getAdmin1(Admin admn) {
          Session session=HibernateUtil.getSessionFactory().openSession();
         Transaction tx = session.beginTransaction();
       Admin admn1=null;
       try{
          
         Query q=session.createQuery("from Admin where adminEmail=:u and adminPassword=:s and otp=:r");
         q.setParameter("u",admn.getAdminEmail());
         q.setParameter("s",admn.getAdminPassword());
         q.setParameter("r",admn.getOtp());
      
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
         
         
         
         
          public Admin getBranchReception(Admin admn) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(Admin.class);
         
            criteria.add(Restrictions.eq("adminEmail", admn.getAdminEmail()));
            criteria.add(Restrictions.eq("receptionPassword", admn.getReceptionPassword()));
          
           criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY); 
            Admin users = (Admin)criteria.uniqueResult();
           
            return users;
        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {
            session.close();
        }
        return null;
    } 
          public Admin getAdmin(Admin admn) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(Admin.class);
         
            criteria.add(Restrictions.eq("adminEmail", admn.getAdminEmail()));
            criteria.add(Restrictions.eq("adminPassword", admn.getAdminPassword()));
          
           criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY); 
            Admin users = (Admin)criteria.uniqueResult();
           
            return users;
        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {
            session.close();
        }
        return null;
    } 
          
        
        
         public Admin getBranchReception1(Admin admn) {
          Session session=HibernateUtil.getSessionFactory().openSession();
         Transaction tx = session.beginTransaction();
       Admin admn1=null;
       try{
          
         Query q=session.createQuery("from Admin where adminEmail=:u and receptionPassword=:s and otp=:r");
         q.setParameter("u",admn.getAdminEmail());
         q.setParameter("s",admn.getReceptionPassword());
         q.setParameter("r",admn.getOtp());
      
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
           public int getLastAdminID()
    {
        Session session=HibernateUtil.getSessionFactory().openSession(); 
        Transaction tx = session.beginTransaction();
        int lastInvoiceID = 0;
        try {
           Query query = session.createQuery("SELECT MAX(adminId) FROM Admin");
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
        
public void updateAdmin(Admin admin)
{
        Session session=HibernateUtil.getSessionFactory().openSession(); 
        Transaction tx = session.beginTransaction();
        try {
             session.update(admin);
             tx.commit();
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
}
public void updateBranch(Branch admin)
{
        Session session=HibernateUtil.getSessionFactory().openSession(); 
        Transaction tx = session.beginTransaction();
        try {
             session.update(admin);
             tx.commit();
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
}

    public List<Admin> getAllAdmin()
    {
      Session session=HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("FROM Admin");
            List<Admin> branch = query.list();
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
    
    
      public Admin getAdminbyEmail(String email) {
          Session session=HibernateUtil.getSessionFactory().openSession();
         Transaction tx = session.beginTransaction();
       Admin admn1=null;
       try{
          
         Query q=session.createQuery("from Admin where adminEmail=:u ");
         q.setParameter("u",email);
        
      
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
}
