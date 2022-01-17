/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.admin.dao;

import com.accede.angel.admin.model.Admin;
import com.accede.angel.admin.model.AdminPrevilleages;
import com.accede.angel.admin.model.PreviliageLevel;
import com.accede.angel.util.HibernateUtil;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Admin
 */
public class AdminPrevilleagesDao {

    public boolean saveAdminPrevilleages(AdminPrevilleages b) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        System.out.println("saveadmin");
        if (isAdminPrevilleagesExist(b)) {
            return false;
        }
        try {
            session.saveOrUpdate(b);
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

    
     public boolean UpdateAdminPrevilleages(AdminPrevilleages b) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        System.out.println("saveadmin");
      
        try {
            session.update(b);
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

    public boolean isAdminPrevilleagesExist(AdminPrevilleages PreviliageLevel) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(AdminPrevilleages.class);
            criteria.add(Restrictions.eq("Admin", PreviliageLevel.getAdmin()));
            criteria.add(Restrictions.eq("admintype", PreviliageLevel.getAdmintype()));

            AdminPrevilleages u = (AdminPrevilleages) criteria.uniqueResult();
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

    
       public AdminPrevilleages getAdminPrevilleages(Admin admn,String Type) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(AdminPrevilleages.class);
         
            criteria.add(Restrictions.eq("Admin", admn));
            criteria.add(Restrictions.eq("admintype", Type));
          
           criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY); 
            AdminPrevilleages users = (AdminPrevilleages)criteria.uniqueResult();
           
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
