/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.sell.dao;

import com.accede.angel.sell.model.PurchaseTemp;
import com.accede.angel.sell.model.VendorTransaction;
import com.accede.angel.util.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author USER
 */
public class VendorTransactionDao {
    public boolean SaveTransactionDetails(VendorTransaction v){
    Session session=HibernateUtil.getSessionFactory().openSession();
        Transaction tx=session.getTransaction();
        try {
            session.beginTransaction();
            session.saveOrUpdate(v);
            tx.commit();
            return true;
            
            
        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        }finally{
            session.close();
            
        }
        return false;
    
}
     public List<VendorTransaction> getAllVendor() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("FROM VendorTransaction");
            List<VendorTransaction> client = query.list();
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
     public VendorTransaction getTransactionById(long id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        VendorTransaction temp = null;
        try {

            Query q = session.createQuery("from VendorTransaction where Vendor_Id=:u ");
            q.setParameter("u", id);
           
            temp = (VendorTransaction) q.uniqueResult();

            return temp;
        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            session.close();
        }
        return null;

    }


}