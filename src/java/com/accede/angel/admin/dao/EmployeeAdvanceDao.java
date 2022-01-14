/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.admin.dao;

import com.accede.angel.admin.model.Admin;
import com.accede.angel.admin.model.Employee;
import com.accede.angel.admin.model.EmployeeAdavance;
import com.accede.angel.admin.model.EmployeePayment;
import com.accede.angel.admin.model.Payment;
import com.accede.angel.util.HibernateUtil;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
public class EmployeeAdvanceDao {

    public boolean saveEmployeeAdavance(EmployeeAdavance c) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();

        try {
            session.saveOrUpdate(c);
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

    public List<EmployeeAdavance> getAllEmployeeAdavance(Employee Employee) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        List<EmployeeAdavance> users = null;
        try {
            Criteria criteria = session.createCriteria(EmployeeAdavance.class);

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

    public long getTotalAdvance(EmployeePayment b) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        long advanceamout = 0;
        try {
            Criteria criteria = session.createCriteria(EmployeeAdavance.class);

            
            System.out.println(b);
            criteria.add(Restrictions.eq("employee", b.getEmployee()));
            criteria.add(Restrictions.eq("month", b.getMonth()));
            criteria.add(Restrictions.eq("year",  Integer.toString(b.getYear()) ));

            criteria.setProjection(Projections.sum("advance"));
            criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
            List users = criteria.list();
            if (null == users || users.isEmpty()) {
                advanceamout = 0;
            } else {
                advanceamout = (Long) (users.get(0));
            }

            System.err.println("Recently Joined Users: " + users.size());

        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {
            session.close();
        }
        return advanceamout;
    }

}
