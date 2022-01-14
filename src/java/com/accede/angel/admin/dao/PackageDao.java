/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.accede.angel.admin.dao;

import com.accede.angel.admin.model.AccountHistory;
import com.accede.angel.admin.model.Admin;
import com.accede.angel.admin.model.PackageCourse;
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
public class PackageDao {
     public boolean updatePackage(PackageCourse Package)
{
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
             session.update(Package);
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
     
    public PackageCourse getPackageCourseByID(int cid) {
       Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = s.beginTransaction();
        try {
            System.err.println("User ID:-" + cid);
            PackageCourse u = (PackageCourse) s.get(PackageCourse.class, cid);
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
public boolean saveaPackage(PackageCourse b)
    {
        Session session =HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        System.out.println("savePackage");
        
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

       public List<PackageCourse> getPackageCourseByAdmin(Admin a) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(PackageCourse.class);
            criteria.add(Restrictions.eq("adminOfBranch", a));
           
            List<PackageCourse> u = criteria.list();

            return u;
        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {
            session.close();
        }
        return null;
    }
       
       
       
        public List<PackageCourse> getPackageCourseForAdmission(Admin a) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(PackageCourse.class);
            criteria.add(Restrictions.eq("adminOfBranch", a));
            criteria.add(Restrictions.eq("Status", true));


            List<PackageCourse> u = criteria.list();

            return u;
        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {
            session.close();
        }
        return null;
    }
       
   
}
