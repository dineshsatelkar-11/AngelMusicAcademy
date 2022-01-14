/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.sell.dao;

import com.accede.angel.admin.model.Purchase;
import com.accede.angel.sell.model.BranchClassProduct;
import com.accede.angel.sell.model.BranchProduct;
import com.accede.angel.sell.model.ProductModel;
import com.accede.angel.util.HibernateUtil;
import java.util.Date;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author asd
 */
public class BranchProductDao {

    public BranchProduct getBranchProduct(BranchProduct bp) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(BranchProduct.class);
            criteria.add(Restrictions.eq("productid", bp.getProductid()));
            criteria.add(Restrictions.eq("adminid", bp.getAdminid()));
            BranchProduct users = (BranchProduct) criteria.uniqueResult();
            return users;
        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {
            session.close();
        }
        return null;
    }

    
    
    public BranchClassProduct getBranchProduct(BranchClassProduct bp) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(BranchClassProduct.class);
            criteria.add(Restrictions.eq("productid", bp.getProductid()));
            criteria.add(Restrictions.eq("adminid", bp.getAdminid()));
            BranchClassProduct users = (BranchClassProduct) criteria.uniqueResult();
            return users;
        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {
            session.close();
        }
        return null;
    }
    public void updateBranchProduct(BranchProduct i) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            session.update(i);
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {
            session.close();
        }
    }

    
    
    public void updateBranchProduct(BranchClassProduct i) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            session.update(i);
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {
            session.close();
        }
    }

    public boolean saveBranchProduct(BranchProduct b) {
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
    public boolean saveBranchProduct(BranchClassProduct b) {
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
    
      public List<BranchProduct> getAllProduct()
    {
      Session session=HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("FROM BranchProduct");
            List<BranchProduct> client = query.list();
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
      public List<BranchClassProduct> getAllBranchClassProduct()
    {
      Session session=HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("FROM BranchClassProduct");
            List<BranchClassProduct> client = query.list();
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
     
      
      
     
          public List<BranchProduct> getAllProduct(int adminid,long catid,long subid,int brandid,int modelid,int colorid) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(BranchProduct.class);
           if(adminid != 0)
            criteria.add(Restrictions.eq("adminid", adminid));
           if(catid != 0)
            criteria.add(Restrictions.eq("catid", catid));
             if(subid != 0)
            criteria.add(Restrictions.eq("subcatid", subid));
               if(brandid != 0)
            criteria.add(Restrictions.eq("brandid", brandid));
                 if(modelid != 0)
            criteria.add(Restrictions.eq("Modelid", modelid));
                   if(colorid != 0)
            criteria.add(Restrictions.eq("colorModelid", colorid));
          
             criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY); 
            List<BranchProduct> users = criteria.list();
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
          
          
            public List<BranchProduct> getAllProduct(int adminid) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(BranchProduct.class);
           if(adminid != 0)
            criteria.add(Restrictions.eq("adminid", adminid));
           
          
             criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY); 
            List<BranchProduct> users = criteria.list();
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
            
            
            public List<BranchClassProduct> getAllProductBranchClassProduct(int adminid) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(BranchClassProduct.class);
           if(adminid != 0)
            criteria.add(Restrictions.eq("adminid", adminid));
           
          
             criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY); 
            List<BranchClassProduct> users = criteria.list();
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
          
          public List<BranchClassProduct> getAllBranchClassProductProduct(int adminid,long catid,long subid,int brandid,int modelid,int colorid) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(BranchClassProduct.class);
           if(adminid != 0)
            criteria.add(Restrictions.eq("adminid", adminid));
           if(catid != 0)
            criteria.add(Restrictions.eq("catid", catid));
             if(subid != 0)
            criteria.add(Restrictions.eq("subcatid", subid));
               if(brandid != 0)
            criteria.add(Restrictions.eq("brandid", brandid));
                 if(modelid != 0)
            criteria.add(Restrictions.eq("Modelid", modelid));
                   if(colorid != 0)
            criteria.add(Restrictions.eq("colorModelid", colorid));
          
             criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY); 
            List<BranchClassProduct> users = criteria.list();
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
    
      
      
       public BranchProduct getProductByID(int cid) 
    
    {
       Session s = HibernateUtil.getSessionFactory().openSession();
       System.out.println("1");
        Transaction tx = s.beginTransaction();
        System.out.println("2");
        try {
            System.out.println("3");
            BranchProduct u = (BranchProduct) s.get(BranchProduct.class, cid);
             System.out.println("4");
            tx.commit();
            return u;
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("5");
            tx.rollback();
            System.out.println("6");
        } finally {
            s.close();
            System.out.println("7");
        }
        return null;
    }
         public BranchProduct getproductdetails(BranchProduct p) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("FROM BranchProduct WHERE productBarcode=:productBarcode");
            query.setParameter("productBarcode",p.getProductBarcode());
            BranchProduct celloClientRegistration = (BranchProduct) query.uniqueResult();
            tx.commit();
            return celloClientRegistration;
        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {
            session.close();
        }
        return null;
    }
         public BranchProduct getproductdetailsbybarcodeandadmin(BranchProduct p) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("FROM BranchProduct WHERE productBarcode=:productBarcode and adminid=:s");
            query.setParameter("productBarcode",p.getProductBarcode());
            query.setParameter("s",p.getAdminid());
            BranchProduct celloClientRegistration = (BranchProduct) query.uniqueResult();
            tx.commit();
            return celloClientRegistration;
        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {
            session.close();
        }
        return null;
    }
      
      
    
}
