/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.sell.dao;


import com.accede.angel.sell.model.PurchaseTemp;
import com.accede.angel.util.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Accede
 */
public class PurchaseTempDao {

    public boolean Addproduct(PurchaseTemp Temp) {

        Session session = HibernateUtil.getSessionFactory().openSession();

        Transaction tx = session.getTransaction();

        try {
            tx.begin();
            session.saveOrUpdate(Temp);
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

    public List<PurchaseTemp> getAllproduct() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("FROM PurchaseTemp");
            List<PurchaseTemp> client = query.list();
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

    public List<Integer> getallproductcheck() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("select product_id FROM PurchaseTemp");
            List<Integer> client = query.list();
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

    public PurchaseTemp getTempProduct(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        PurchaseTemp temp = null;
        try {

            Query q = session.createQuery("from PurchaseTemp where product_id=:u ");
            q.setParameter("u", id);
           
            temp = (PurchaseTemp) q.uniqueResult();

            return temp;
        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            session.close();
        }
        return null;

    }

    public boolean deleteProductByID(int productID) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("DELETE FROM PurchaseTemp WHERE id=:PRD_ID");
            query.setParameter("PRD_ID", productID);
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

    public List<PurchaseTemp> getAllProducts() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("FROM PurchaseTemp");
            List<PurchaseTemp> allProducts = query.list();
            tx.commit();
            return allProducts;

        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {
            session.close();
        }
        return null;
    }

    public boolean deleteProduct() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("DELETE FROM PurchaseTemp ");

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
}
