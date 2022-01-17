/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.accede.angel.admin.dao;

import com.accede.angel.admin.model.Employee;
import com.accede.angel.admin.model.EmployeeAdavance;
import com.accede.angel.admin.model.EmployeePayment;
import com.accede.angel.admin.model.EmployeeWeekoff;
import com.accede.angel.util.HibernateUtil;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Admin
 */
public class EmployeeWeekoffDao {
        public boolean saveEmployeeWeekoff(EmployeeWeekoff c)
    {
        Session session =HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
       
        try {
            session.save(c);
            tx.commit();
            return true;
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
        return false;
    } 
     
     
      public List<EmployeeWeekoff> getAllEmployeeWeekoff(Employee Employee) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
       List<EmployeeWeekoff> users=null;
        try {
            Criteria criteria = session.createCriteria(EmployeeWeekoff.class);

            criteria.add(Restrictions.eq("employee", Employee));
         
          
            criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
           users = criteria.list();

           return users;

        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {
            session.close();
        }
        return users;
    }
      
      
      
    public int getTotalLeavs(EmployeePayment b) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        int TotalLeavs = 0;
        long TotalLeavs1 = 0;
        try {
            Criteria criteria = session.createCriteria(EmployeeWeekoff.class);

            criteria.add(Restrictions.eq("employee", b.getEmployee()));
            criteria.add(Restrictions.eq("month", b.getMonth()));
            criteria.add(Restrictions.eq("year", Integer.toString(b.getYear())));

            criteria.setProjection(Projections.sum("noofday"));
            criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
            List users = criteria.list();
            if (null == users || users.isEmpty()) {
                TotalLeavs1 = 0;
            } else {
                TotalLeavs1 = (Long) (users.get(0));
            }
TotalLeavs=(int)TotalLeavs1;
            System.err.println("-------------------------------------- " + users.size());
            System.err.println("TotalLeavs: " + users.size());
    System.err.println("-------------------------------------- " + users.size());

        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {
            session.close();
        }
        return TotalLeavs;
    }

}
