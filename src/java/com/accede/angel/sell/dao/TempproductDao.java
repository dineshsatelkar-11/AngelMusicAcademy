/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.accede.angel.sell.dao;

import com.accede.angel.sell.model.BranchSale;
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
public class TempproductDao {
    
    
      public TempSaleforBranch getTempProduct(int id) {
          Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        TempSaleforBranch temp = null;
        try {

            Query q = session.createQuery("from TempSaleforBranch where productid=:u ");
            q.setParameter("u", id);
           
            temp = (TempSaleforBranch) q.uniqueResult();

            return temp;
        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            session.close();
        }
        return null;

    }
    
      
      
       public boolean saveBrachsale(TempSaleforBranch r1) {

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
       
       public List<TempSaleforBranch> getAllProducts() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("FROM TempSaleforBranch");
            List<TempSaleforBranch> allProducts = query.list();
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
            Query query = session.createQuery("DELETE FROM TempSaleforBranch ");

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
         public boolean deleteProductByID(int productID) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("DELETE FROM TempSaleforBranch WHERE id=:PRD_ID");
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
