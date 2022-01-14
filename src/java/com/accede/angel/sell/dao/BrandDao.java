/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.sell.dao;

import com.accede.angel.admin.model.Admin;
import com.accede.angel.admin.model.Admission;
import com.accede.angel.sell.model.AddModel;
import com.accede.angel.sell.model.Brand;
import com.accede.angel.sell.model.Category;
import com.accede.angel.sell.model.ProductModel;
import com.accede.angel.sell.model.SubCategory;
import com.accede.angel.services.Dates;
import com.accede.angel.util.HibernateUtil;
import java.util.Date;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Varsha
 */
public class BrandDao {

    public List<Brand> getAllBrandByCategory(Category a) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(Brand.class);
              criteria.addOrder(Order.asc("Brand"));
            criteria.add(Restrictions.eq("Category", a));
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
    
    
    public boolean deleteBrandByID(long courseId)
{
         Session session=HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
             Query query = session.createQuery("DELETE FROM Brand WHERE id=:courseId");
             query.setParameter("courseId", courseId);
             int i = query.executeUpdate();
             System.err.println(i+" Product Deleted");
             tx.commit();
             return Boolean.TRUE;
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
         return Boolean.FALSE;
}

   

     public List<Brand> getAllBrand(Brand a) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(Brand.class);
            criteria.addOrder(Order.asc("Brand"));
            criteria.add(Restrictions.eq("deletestatus", true));
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
      public List<Brand> getAllProductModel(Category a) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(ProductModel.class);
            ProjectionList projList = Projections.projectionList();
            criteria.add(Restrictions.eq("category", a));
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

      
      public List<Brand> getAllProductModel(Category a , SubCategory b) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(ProductModel.class);
            ProjectionList projList = Projections.projectionList();
            criteria.add(Restrictions.eq("category", a));
            criteria.add(Restrictions.eq("subCategory", b));
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
      
      public List<Brand> getAllProductModel(Category a , SubCategory b,AddModel c) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(ProductModel.class);
            ProjectionList projList = Projections.projectionList();
            criteria.add(Restrictions.eq("category", a));
            criteria.add(Restrictions.eq("subCategory", b));
            criteria.add(Restrictions.eq("Model", c));
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
    public Brand getelementByID(int cid) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = s.beginTransaction();
        try {
            System.err.println("User ID:-" + cid);
            Brand u = (Brand) s.get(Brand.class, cid);
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

    public boolean saveBrand(Brand b) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        System.out.println("saveadmin");
        if (isBrandExist(b)) {
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

    public List<Brand> getAllProduct() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("FROM Brand");
            List<Brand> client = query.list();
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

    public boolean updateBrand(Brand i) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            session.update(i);
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

    public boolean isBrandExist(Brand brand) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(Brand.class);
            criteria.add(Restrictions.eq("Brand", brand.getBrand()));

            Brand u = (Brand) criteria.uniqueResult();
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

    
    
    public Brand getBrand(Brand brand) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(Brand.class);
            criteria.add(Restrictions.eq("Brand", brand.getBrand()));

            Brand u = (Brand) criteria.uniqueResult();
          return u;

        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {
            session.close();
        }
       return null;
    }
}
