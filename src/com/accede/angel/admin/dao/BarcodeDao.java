/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.admin.dao;


import com.accede.angel.sell.model.Barcode;
import com.accede.angel.util.HibernateUtil;
import java.util.List;
import javax.persistence.Entity;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Admin
 */


public class BarcodeDao {
      public Barcode getBarcodeByID(int cid) 
    
    {
       Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = s.beginTransaction();
        try {
            System.err.println("User ID:-" + cid);
            Barcode u = (Barcode) s.get(Barcode.class, cid);
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
        public List<Barcode> getAllBarcode() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("FROM Barcode");
            List<Barcode> client = query.list();
            tx.commit();
            return client;
        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {
            session.close();
        }
        return null;
    }
      public int getLastID()
    {
        Session session=HibernateUtil.getSessionFactory().openSession(); 
        Transaction tx = session.beginTransaction();
        int lastInvoiceID = 0;
        try {
           Query query = session.createQuery("SELECT MAX(id) FROM Barcode");
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
       
public Barcode getBarcodeByBarcode(String id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        Barcode temp = null;
        try {

            Query q = session.createQuery("from Barcode where Barcode=:u ");
            q.setParameter("u", id);
           
            temp = (Barcode) q.uniqueResult();

            return temp;
        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            session.close();
        }
        return null;

    }
     public Barcode SaveBarcode(Barcode r1) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        
        Transaction t = null;
        try {
            t = session.getTransaction();
            t.begin();
            session.saveOrUpdate(r1);
            t.commit();
        } catch (Exception e) {
            e.printStackTrace();
            t.rollback();
        } finally {
            session.close();
        }
        return r1;
    }
       public Barcode UpdateBarcode(Barcode r1) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        
        Transaction t = null;
        try {
            t = session.getTransaction();
            t.begin();
            session.update(r1);
            t.commit();
        } catch (Exception e) {
            e.printStackTrace();
            t.rollback();
        } finally {
            session.close();
        }
        return r1;
    }
       public static boolean isBarcodeExist(Barcode b) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        boolean result =true ;
        Transaction t = null;
        try {
            t = session.getTransaction();
            t.begin();
            Query query = session.createQuery("from Barcode where Barcode=:Barcode");
            query.setParameter("Barcode", b.getBarcode());
           
            Barcode u = (Barcode) query.uniqueResult();
            t.commit();
            if (u != null) {
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
            t.rollback();
        } finally {
            session.close();
        }
        return result;
    }
     
}
