/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.accede.angel.admin.dao;

import com.accede.angel.admin.model.PreviliageLevel;
import com.accede.angel.sell.model.Category;
import com.accede.angel.util.HibernateUtil;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Admin
 */
public class PreviliageLevelDao {
    public boolean savePreviliageLevel(PreviliageLevel b) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        System.out.println("saveadmin");
if(isPreviliageLevelExist(b))
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
    
    
    public boolean isPreviliageLevelExist(PreviliageLevel PreviliageLevel) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(PreviliageLevel.class);
            criteria.add(Restrictions.eq("name", PreviliageLevel.getName()));

            PreviliageLevel u = (PreviliageLevel) criteria.uniqueResult();
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
    
    
        public List<PreviliageLevel> getPreviliageLevel() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(PreviliageLevel.class);
           
             criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY); 
            List<PreviliageLevel> users = criteria.list();
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
    
}
