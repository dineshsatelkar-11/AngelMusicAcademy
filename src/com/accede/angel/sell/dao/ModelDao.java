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
public class ModelDao {

    public AddModel getelementByID(int cid) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = s.beginTransaction();
        try {
            System.err.println("User ID:-" + cid);
            AddModel u = (AddModel) s.get(AddModel.class, cid);
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

    public boolean saveAddModel(AddModel b) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        System.out.println("saveadmin");
        if (isModelNoExist(b)) {
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

    public List<AddModel> getAllAddModel(AddModel a) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(AddModel.class);
 criteria.addOrder(Order.asc("ModelName"));
            criteria.add(Restrictions.eq("deletestatus", true));
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

    public List<AddModel> getAllProductModel(Category a) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(ProductModel.class);
            ProjectionList projList = Projections.projectionList();
            criteria.add(Restrictions.eq("category", a));
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
    
    public List<AddModel> getAllProductModel(Category a , SubCategory b) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(ProductModel.class);
            ProjectionList projList = Projections.projectionList();
            criteria.add(Restrictions.eq("category", a));
            criteria.add(Restrictions.eq("subCategory", b));
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

    
    
    public List<AddModel> getAllProductModel(Category a , SubCategory b,Brand c) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(ProductModel.class);
            ProjectionList projList = Projections.projectionList();
            criteria.add(Restrictions.eq("category", a));
            criteria.add(Restrictions.eq("subCategory", b));
            criteria.add(Restrictions.eq("brand", b));
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
    public void updateAddModel(AddModel i) {
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

    public boolean updateAddModelb(AddModel i) {
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

    public AddModel getAddModel(AddModel cat) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();

        try {
            Criteria criteria = session.createCriteria(AddModel.class);
            criteria.add(Restrictions.eq("ModelName", cat.getModelName()));

            AddModel u = (AddModel) criteria.uniqueResult();
            return u;

        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {
            session.close();
        }
        return null;
    }

    public boolean deleteAddModelByID(int courseId) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("DELETE FROM AddModel WHERE id=:courseId");
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

    public boolean isModelNoExist(AddModel brand) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(AddModel.class);
            criteria.add(Restrictions.eq("ModelName", brand.getModelName()));

            AddModel u = (AddModel) criteria.uniqueResult();
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

}
