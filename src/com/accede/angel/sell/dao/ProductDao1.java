/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.sell.dao;

import com.accede.angel.sell.model.AddModel;
import com.accede.angel.sell.model.Barcode;
import com.accede.angel.sell.model.Brand;
import com.accede.angel.sell.model.Category;
import com.accede.angel.sell.model.ColorModel;
import com.accede.angel.sell.model.ProductModel;
import com.accede.angel.sell.model.SubCategory;
import com.accede.angel.util.HibernateUtil;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author accede9
 */
public class ProductDao1 {

    public ProductModel getProductByID(int cid) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        System.out.println("1");
        Transaction tx = s.beginTransaction();
        System.out.println("2");
        try {
            System.out.println("3");
            ProductModel u = (ProductModel) s.get(ProductModel.class, cid);
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

    public boolean SaveProduct(ProductModel r1) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        if (isproductexist(r1)) {
            return false;
        }
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

    public boolean UpdateProduct(ProductModel r1) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        System.out.println("9");
        Transaction t = null;
        try {
            t = session.getTransaction();
            System.out.println("10");
            t.begin();
            System.out.println("11");
            session.update(r1);
            System.out.println("12");
            t.commit();
            System.out.println("13");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("14");
            t.rollback();
            System.out.println("15");
        } finally {
            session.close();
            System.out.println("16");
        }
        return true;
    }
    
    
    public boolean UpdateProduct1(ProductModel r1) {

        Session session = HibernateUtil.getSessionFactory().openSession();
        System.out.println("9");
        Transaction t = null;
        if(isproductexist(r1))
            return false;
        try {
            t = session.getTransaction();
            System.out.println("10");
            t.begin();
            System.out.println("11");
            session.update(r1);
            System.out.println("12");
            t.commit();
            System.out.println("13");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("14");
            t.rollback();
            System.out.println("15");
        } finally {
            session.close();
            System.out.println("16");
        }
        return true;
    }

    public boolean isproductexist(ProductModel p) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(ProductModel.class);
            criteria.add(Restrictions.eq("brand", p.getBrand()));
            criteria.add(Restrictions.eq("Model", p.getModel()));
            criteria.add(Restrictions.eq("category", p.getCategory()));
            criteria.add(Restrictions.eq("colorModel", p.getColorModel()));
            criteria.add(Restrictions.eq("subCategory", p.getSubCategory()));
          
 criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY); 
            ProductModel u = (ProductModel) criteria.uniqueResult();
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

    public boolean isproductBarcodeexist(ProductModel r) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        boolean result = false;
        Transaction t = null;
        try {
            t = session.getTransaction();
            t.begin();
            Query query = session.createQuery("from ProductModel where  productshortcode=:productshortcode  ");

            query.setParameter("productshortcode", r.getProductBarcode());
            System.out.println("Brand===" + r.getProductname());
            ProductModel u = (ProductModel) query.uniqueResult();
            t.commit();
            if (u != null) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            t.rollback();
        } finally {
            session.close();
        }
        return result;
    }

    public ProductModel getproductdetails(ProductModel p) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("FROM ProductModel WHERE productBarcode=:productBarcode");
            query.setParameter("productBarcode", p.getProductBarcode());
            ProductModel celloClientRegistration = (ProductModel) query.uniqueResult();
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

   

       public List<ProductModel> getAllProduct() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(ProductModel.class);
           
            criteria.add(Restrictions.eq("Status", true));
             criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY); 
            List<ProductModel> users = criteria.list();
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
       
       
       public List<Barcode> getAllBarcode() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(Barcode.class);
           
           
             criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY); 
            List<Barcode> users = criteria.list();
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
       
       
         public boolean UpdateBarcode(Barcode r1) {

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
        return true;
    }
    
    
       
       public List<ProductModel> getAllProduct(long catid,long subid,int brandid,int modelid,int colorid) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(ProductModel.class);
           if(catid != 0)
             System.out.println("*************************************************************");
                         System.out.println("********************************catid*****************************"+catid);
                         System.out.println("*************************************************************");
                       
            criteria.add(Restrictions.eq("catid", catid));
             if(subid != 0)
            criteria.add(Restrictions.eq("subcatid", subid));
               if(brandid != 0)
            criteria.add(Restrictions.eq("brandid", brandid));
                 if(modelid != 0)
            criteria.add(Restrictions.eq("Modelid", modelid));
                   if(colorid != 0)
            criteria.add(Restrictions.eq("colorModelid", colorid));
            criteria.add(Restrictions.eq("Status", true));
             criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY); 
            List<ProductModel> users = criteria.list();
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
    
       public List<Integer> getAllProduct1(long catid,long subid,int brandid,int modelid,int colorid) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(ProductModel.class);
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
                   System.out.println("*************************************************************");
                         System.out.println("********************************catid*****************************"+catid);
                         System.out.println("*************************************************************");
                   System.out.println("*************************************************************");
                         System.out.println("********************************subcatid*****************************"+subid);
                         System.out.println("*************************************************************");
                   System.out.println("*************************************************************");
                         System.out.println("********************************brandid*****************************"+brandid);
                         System.out.println("*************************************************************");
                   System.out.println("*************************************************************");
                         System.out.println("********************************modelid*****************************"+modelid);
                         System.out.println("*************************************************************");
                         
                   System.out.println("*************************************************************");
                         System.out.println("********************************colorid*****************************"+colorid);
                         System.out.println("*************************************************************");
                   
         
            criteria.setProjection(Projections.property("id"));
             criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY); 
            List<Integer> users = criteria.list();
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
       
          public List<SubCategory> getAllProductSubCategory(long catid,long subid,int brandid,int modelid,int colorid) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(ProductModel.class);
            ProjectionList projList = Projections.projectionList();
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
            criteria.add(Restrictions.eq("Status", true));

            projList.add(Projections.groupProperty("subCategory"));
            criteria.setProjection(projList);
            List<SubCategory> users = criteria.list();
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
     
           public List<Brand> getAllProductBrand(long catid,long subid,int brandid,int modelid,int colorid) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(ProductModel.class);
            ProjectionList projList = Projections.projectionList();
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
            criteria.add(Restrictions.eq("Status", true));

            projList.add(Projections.groupProperty("brand"));
            criteria.setProjection(projList);
            List<Brand> users = criteria.list();
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
    
           
            public List<AddModel> getAllProductAddModel(long catid,long subid,int brandid,int modelid,int colorid) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(ProductModel.class);
            ProjectionList projList = Projections.projectionList();
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
            criteria.add(Restrictions.eq("Status", true));

            projList.add(Projections.groupProperty("Model"));
            criteria.setProjection(projList);
            List<AddModel> users = criteria.list();
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
            
            
             public List<ColorModel> getAllProductColorModel(long catid,long subid,int brandid,int modelid,int colorid) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(ProductModel.class);
            ProjectionList projList = Projections.projectionList();
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
            criteria.add(Restrictions.eq("Status", true));

            projList.add(Projections.groupProperty("colorModel"));
            criteria.setProjection(projList);
            List<ColorModel> users = criteria.list();
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
    
       
    public void updateProductQuentity(int product) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            session.update(product);
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {
            session.close();
        }
    }

    public void updateProductQuentity(ProductModel product) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            session.update(product);
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {
            session.close();
        }
    }

    public ProductModel getProductModel(ProductModel p) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(ProductModel.class);
            criteria.add(Restrictions.eq("brand", p.getBrand()));
            criteria.add(Restrictions.eq("Model", p.getModel()));
            criteria.add(Restrictions.eq("category", p.getCategory()));
            criteria.add(Restrictions.eq("colorModel", p.getColorModel()));
            criteria.add(Restrictions.eq("subCategory", p.getSubCategory()));

            ProductModel u = (ProductModel) criteria.uniqueResult();

            return u;
        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {
            session.close();
        }
        return null;
    }
    
    
      public int getLastProductModel()
    {
        Session session=HibernateUtil.getSessionFactory().openSession(); 
        Transaction tx = session.beginTransaction();
        int lastInvoiceID = 1;
        try {
           Query query = session.createQuery("SELECT MAX(id) FROM ProductModel");
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
}
