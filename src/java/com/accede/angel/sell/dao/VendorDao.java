/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.sell.dao;

import com.accede.angel.sell.model.ColorModel;
import com.accede.angel.sell.model.Venderregistration;
import com.accede.angel.util.HibernateUtil;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author a2z
 */
public class VendorDao {

    public boolean savevendor(Venderregistration cm) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        if (isEmailExist(cm)) {
            return false;
        }
        Transaction tx = session.getTransaction();
        try {
            tx.begin();
            session.saveOrUpdate(cm);
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

    public static boolean isEmailExist(Venderregistration cm) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        boolean result = false;
        Transaction tx = null;
        {
            try {
                tx = session.getTransaction();
                tx.begin();
                Query query = session.createQuery("from Venderregistration where Email=:Vendoremail and companyPhone=:companyPhone");
                query.setParameter("Vendoremail", cm.getEmail());
                query.setParameter("companyPhone", cm.getCompanyPhone());
                //query.setParameter("companyemail", cm.getCompanyemail());
                Venderregistration cmm = (Venderregistration) query.uniqueResult();
                tx.commit();
                if (cmm != null) {
                    return true;

                }
            } catch (Exception e) {
                e.printStackTrace();
                tx.rollback();
            } finally {
                session.close();

            }
        }
        return result;
    }

   
       public List<Venderregistration> getAllVendor() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(Venderregistration.class);
           
            criteria.add(Restrictions.eq("Status", true));
            List<Venderregistration> users = criteria.list();
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
    public Venderregistration getvenderbyid (long cid) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = s.beginTransaction();
        try {
            System.err.println("User ID:-" + cid);
            Venderregistration u = (Venderregistration) s.get(Venderregistration.class, cid);
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

    public void Updatevenderstatus(Venderregistration v) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            session.update(v);
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {
            session.close();
        }
    }

    public boolean updatevendor(Venderregistration b)
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
    
}
