/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.accede.angel.admin.dao;

import com.accede.angel.admin.model.Product;
import com.accede.angel.admin.model.UploadCoursePdfModel;
import com.accede.angel.util.HibernateUtil;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author ACER
 */
public class UploadCoursePdfDao {
    
    
     public UploadCoursePdfModel getProductByID(int cid) {
       Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = s.beginTransaction();
        try {
            System.err.println("User ID:-" + cid);
            UploadCoursePdfModel u = (UploadCoursePdfModel) s.get(UploadCoursePdfModel.class, cid);
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
     
      public void update(UploadCoursePdfModel i)
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
      
      public boolean savePdf(UploadCoursePdfModel b)
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
   
    public UploadCoursePdfModel otpmatch(UploadCoursePdfModel r) {
          Session session=HibernateUtil.getSessionFactory().openSession();
       
       UploadCoursePdfModel r1=null;
       try{
         
         Query q=session.createQuery("from Product where Email=:e and Otp=:o");
//         q.setParameter("e",r.getEmail());
//         q.setParameter("o",r.getOtp());
      
         r1=(UploadCoursePdfModel)q.uniqueResult();
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
             UploadCoursePdfModel delete = (UploadCoursePdfModel) session.load(UploadCoursePdfModel.class, id);
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
    
       
        public List<UploadCoursePdfModel> getAllProduct()
    {
      Session session=HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("FROM UploadCoursePdfModel");
            List<UploadCoursePdfModel> client = query.list();
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
    
        
    public List<UploadCoursePdfModel> getUploadCoursePdfModel(String courseName ) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
       List<UploadCoursePdfModel> users=null;
        try {
            Criteria criteria = session.createCriteria(UploadCoursePdfModel.class);

            criteria.add(Restrictions.eq("courseName", courseName));
          
          
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
    
        
        
}
