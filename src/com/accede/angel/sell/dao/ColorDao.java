/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.sell.dao;

import com.accede.angel.sell.model.AddModel;
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
import org.hibernate.criterion.Order;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Varsha
 */
public class ColorDao {
    
    public boolean saveColorModel(ColorModel b) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        System.out.println("saveadmin");
if(isColorModelExist(b))
    return false;
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
    
    
    
      public boolean updatecolor(ColorModel b) {
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
    
    public boolean isColorModelExist(ColorModel brand) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(Category.class);
            criteria.add(Restrictions.eq("Category", brand.getColorName()));

            ColorModel u = (ColorModel) criteria.uniqueResult();
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
  
     public List<ColorModel> getAllProductModel(Category a) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(ProductModel.class);
            ProjectionList projList = Projections.projectionList();
            criteria.add(Restrictions.eq("category", a));
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
     
     
     public List<ColorModel> getAllProductModel(Category a, SubCategory b) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(ProductModel.class);
            ProjectionList projList = Projections.projectionList();
            criteria.add(Restrictions.eq("category", a));
     criteria.add(Restrictions.eq("subCategory", b));
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
     
     
     public List<ColorModel> getAllProductModel(Category a, SubCategory b,AddModel c) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(ProductModel.class);
            ProjectionList projList = Projections.projectionList();
            criteria.add(Restrictions.eq("category", a));
     criteria.add(Restrictions.eq("subCategory", b));
      criteria.add(Restrictions.eq("Model", c));
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
     
     
     public List<ColorModel> getAllProductModel(Category a, SubCategory b,Brand c) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(ProductModel.class);
            ProjectionList projList = Projections.projectionList();
            criteria.add(Restrictions.eq("category", a));
     criteria.add(Restrictions.eq("subCategory", b));
      criteria.add(Restrictions.eq("brand", c));
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
     
       public List<ColorModel> getAllProductModel(Category a, SubCategory b,AddModel c ,Brand d) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(ProductModel.class);
            ProjectionList projList = Projections.projectionList();
            criteria.add(Restrictions.eq("category", a));
     criteria.add(Restrictions.eq("subCategory", b));
      criteria.add(Restrictions.eq("Model", c));
      criteria.add(Restrictions.eq("brand", d));
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
      public List<ColorModel> getAllColorModel(ColorModel a) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(ColorModel.class);
            criteria.addOrder(Order.asc("ColorName"));
            criteria.add(Restrictions.eq("deletestatus", true));
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
     
     public ColorModel getelementByID(int cid) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = s.beginTransaction();
        try {
            System.err.println("User ID:-" + cid);
            ColorModel u = (ColorModel) s.get(ColorModel.class, cid);
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
     
     
     
     public ColorModel getColorModel(ColorModel cat) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(ColorModel.class);
            criteria.add(Restrictions.eq("ColorName", cat.getColorName()));

            ColorModel u = (ColorModel) criteria.uniqueResult();
          return u;

        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {
            session.close();
        }
       return null;
    }
     
     
     
     public boolean deleteColorModelByID(int courseId) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("DELETE FROM ColorModel WHERE id=:courseId");
            query.setParameter("courseId", courseId);
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
