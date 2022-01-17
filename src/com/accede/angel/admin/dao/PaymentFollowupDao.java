/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.admin.dao;

import com.accede.angel.admin.model.Admin;
import com.accede.angel.admin.model.Branch;
import com.accede.angel.admin.model.CustomerAccount;
import com.accede.angel.admin.model.PaymentFollowup;
import com.accede.angel.admin.model.PaymentFollowupMessage;
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
 * @author Admin
 */
public class PaymentFollowupDao {

    public boolean savePaymentFollowup(PaymentFollowup b) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        System.out.println("saveadmin");

        try {
            session.save(b);
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
    
      public boolean updatePaymentFollowup(PaymentFollowup b) {
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

    public boolean savePaymentFollowupMessage(PaymentFollowupMessage b) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        System.out.println("saveadmin");

        try {
            session.save(b);
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

    public int getLastPaymentFollowupID() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        int lastInvoiceID = 0;
        try {
            Query query = session.createQuery("SELECT MAX(id) FROM PaymentFollowup");
            lastInvoiceID = (int) query.uniqueResult();
            System.err.println("Last Invoice ID " + lastInvoiceID);
            tx.commit();
            return lastInvoiceID;
        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {
            session.close();
        }
        return lastInvoiceID;
    }

    public PaymentFollowup getPaymentFollowupByID(int cid) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = s.beginTransaction();
        try {
            System.err.println("User ID:-" + cid);
            PaymentFollowup u = (PaymentFollowup) s.get(PaymentFollowup.class, cid);
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

    public List<PaymentFollowup> getAllPaymentFollowup(Admin admin) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(PaymentFollowup.class);
            Date startdate = new Dates().getEndingDate(new Date(), -365);
            Date enddate = new Dates().getEndingDate(new Date(), 1);
            System.out.println("enddate12="+enddate);
            criteria.add(Restrictions.eq("adminOfBranch", admin));
            criteria.add(Restrictions.ge("nextfollowupdate", startdate));
            criteria.add(Restrictions.lt("nextfollowupdate", enddate));
             criteria.add(Restrictions.eq("requeststatus", true));
            criteria.addOrder(Order.asc("nextfollowupdate"));
        
            criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);

            List<PaymentFollowup> users = criteria.list();
            System.err.println("Recently Joined Users125125: " + users.size());
            return users;
        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {
            session.close();
        }
        return null;
    }
    public List<PaymentFollowup> getAllPaymentFollowup() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(PaymentFollowup.class);
            Date startdate = new Dates().getEndingDate(new Date(), -365);
            Date enddate = new Dates().getEndingDate(new Date(), 1);
            System.out.println("enddate12="+enddate);
          
            criteria.add(Restrictions.ge("nextfollowupdate", startdate));
            criteria.add(Restrictions.lt("nextfollowupdate", enddate));
             criteria.add(Restrictions.eq("requeststatus", true));
            criteria.addOrder(Order.asc("nextfollowupdate"));
        
            criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);

            List<PaymentFollowup> users = criteria.list();
            System.err.println("Recently Joined Users125125: " + users.size());
            return users;
        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {
            session.close();
        }
        return null;
    }
     public List<PaymentFollowup> getAllPaymentFollowupByCust(CustomerAccount CustomerAccount) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(PaymentFollowup.class);
           
            criteria.add(Restrictions.eq("CustomerAccount", CustomerAccount));
           
            criteria.addOrder(Order.asc("nextfollowupdate"));
        
            criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);

            List<PaymentFollowup> users = criteria.list();
            System.err.println("Recently Joined Users125125: " + users.size());
            return users;
        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {
            session.close();
        }
        return null;
    }
    
    
    
    
      public List<PaymentFollowupMessage> getAllPaymentFollowupMessage(PaymentFollowup PaymentFollowup) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(PaymentFollowupMessage.class);
        
            criteria.add(Restrictions.eq("PaymentFollowup", PaymentFollowup));
           
         
            criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);

            List<PaymentFollowupMessage> users = criteria.list();
            System.err.println("Recently Joined Users55: " + users.size());
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
