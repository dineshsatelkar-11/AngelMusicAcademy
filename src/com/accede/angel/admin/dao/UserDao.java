/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.accede.angel.admin.dao;

import com.accede.angel.admin.model.Exam;
import com.accede.angel.admin.model.User;
import com.accede.angel.util.HibernateUtil;
import java.text.DateFormatSymbols;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author ACER
 */
public class UserDao {
    
     public List<String> initDaysList() {
        List<String> daysList = new ArrayList<String>();
               daysList.addAll(Arrays.asList(new DateFormatSymbols().getWeekdays()));
               daysList.remove("Sunday");
               daysList.remove(0);
    	 return daysList;
    }
      public User getUserByID(int cid) {
       Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = s.beginTransaction();
        try {
            System.err.println("User ID:-" + cid);
            User u = (User) s.get(Exam.class, cid);
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
     
      public void updateUser(User i)
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
      
      public boolean saveUser(User b)
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
   
   
   
    
       public int DeleteUser(int id)
    {
      Session session=HibernateUtil.getSessionFactory().openSession();
      Transaction tx = session.beginTransaction();
      try {
             User delete = (User) session.load(Exam.class, id);
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
    
       
        public List<User> getAllUser()
    {
      Session session=HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("FROM User");
            List<User> user = query.list();
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
    
               public List<String> getAllExestingJRnumbers()
    {
      Session session=HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("Select jrno  from User");
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
    
    
}
