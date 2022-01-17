/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.accede.angel.sell.dao;

import com.accede.angel.sell.model.ProductModel;
import com.accede.angel.sell.model.TempCustomerSell;
import com.accede.angel.sell.model.TempSaleforBranch;
import com.accede.angel.util.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author asd
 */
public class CustomerSellDAO {
    
     public TempCustomerSell getTempProduct(String Barcode) {
          Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        TempCustomerSell temp = null;
        try {

            Query q = session.createQuery("from TempCustomerSell where productBarcode=:u ");
            q.setParameter("u", Barcode);
           
            temp = (TempCustomerSell) q.uniqueResult();

            return temp;
        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            session.close();
        }
        return null;

    }
    
     public boolean SaveProduct(TempCustomerSell r1) {

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
        return true;
    }
     
     
    public List<TempCustomerSell> getAllProduct()
    {
      Session session=HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("FROM TempCustomerSell");
            List<TempCustomerSell> client = query.list();
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
       public boolean deleteProduct() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("DELETE FROM TempCustomerSell ");

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
       
         public boolean deleteProductByID(String productID) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("DELETE FROM TempCustomerSell WHERE productBarcode=:PRD_ID");
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
}
