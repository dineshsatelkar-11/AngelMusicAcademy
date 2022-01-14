/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.accede.angel.sell.dao;

import com.accede.angel.sell.model.Brand;
import com.accede.angel.sell.model.Category;
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
 * @author Admin
 */
public class SubCatDao {
      public SubCategory getelementByID(long cid) {
       Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = s.beginTransaction();
        try {
            System.err.println("User ID:-" + cid);
            SubCategory u = (SubCategory) s.get(SubCategory.class, cid);
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
    public boolean saveSubCategory(SubCategory b) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        System.out.println("saveadmin");
if(isCategoryExist(b))
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
    
   
     public List<SubCategory> getAllSubCategory() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(SubCategory.class);
             criteria.addOrder(Order.asc("SubCategory"));
            criteria.add(Restrictions.eq("deletestatus", true));
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
       public List<SubCategory> getAllSubCategorybycatname(Category Category) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(SubCategory.class);
             criteria.addOrder(Order.asc("SubCategory"));
            criteria.add(Restrictions.eq("deletestatus", true));
            criteria.add(Restrictions.eq("Category", Category.getCategory()));
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
     
       
       public List<SubCategory> getAllProductSubCategory1(Category a) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(ProductModel.class);
            ProjectionList projList = Projections.projectionList();
            criteria.add(Restrictions.eq("category", a));
            criteria.add(Restrictions.eq("Status", true));
  criteria.addOrder(Order.asc("SubCategory"));
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
       
       
       
   
 public void updateSubCategory(SubCategory i) {
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
 
 public boolean updateSubCategoryi(SubCategory i) {
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
 
 
    public boolean isCategoryExist(SubCategory brand) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(SubCategory.class);
            criteria.add(Restrictions.eq("Category", brand.getCategory()));
            criteria.add(Restrictions.eq("SubCategory", brand.getSubCategory()));

            SubCategory u = (SubCategory) criteria.uniqueResult();
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
    
    
     public SubCategory getSubCategory(SubCategory cat) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(SubCategory.class);
            criteria.add(Restrictions.eq("Category", cat.getCategory()));
 criteria.add(Restrictions.eq("SubCategory", cat.getSubCategory()));
            SubCategory u = (SubCategory) criteria.uniqueResult();
          return u;

        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {
            session.close();
        }
       return null;
    }
    public boolean deleteSubCategoryByID(long courseId)
{
         Session session=HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
             Query query = session.createQuery("DELETE FROM SubCategory WHERE id=:courseId");
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
}
