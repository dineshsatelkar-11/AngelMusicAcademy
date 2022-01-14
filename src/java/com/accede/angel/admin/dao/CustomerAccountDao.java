/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.admin.dao;

import com.accede.angel.admin.model.Admin;
import com.accede.angel.admin.model.Admission;
import com.accede.angel.admin.model.CustomerAccount;
import com.accede.angel.admin.model.Employee;
import com.accede.angel.services.Dates;
import com.accede.angel.util.HibernateUtil;
import java.util.Date;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Admin
 */
public class CustomerAccountDao {

    public boolean saveCustomerAccount(CustomerAccount c) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        if (isMobileNoExist(c)) {
            return false;
        }

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

    
    public boolean updateCustomerAccount1(CustomerAccount i) {
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
    public boolean isMobileNoExist(CustomerAccount CustomerAccount) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        boolean b = false;
        try {
            Criteria criteria = session.createCriteria(CustomerAccount.class);
            criteria.add(Restrictions.eq("MobileNo", CustomerAccount.getMobileNo()));
            criteria.add(Restrictions.eq("adminOfBranch", CustomerAccount.getAdminOfBranch()));
            CustomerAccount u = (CustomerAccount) criteria.uniqueResult();
            tx.commit();
            if (u != null) {
                b = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {
            session.close();
        }
        return b;
    }

    public List<CustomerAccount> getCustomerAccount(Admin a) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(CustomerAccount.class);
            criteria.add(Restrictions.eq("adminOfBranch", a));

            criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);

            List<CustomerAccount> users = criteria.list();
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

    public List<CustomerAccount> getCustomerAccount() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(CustomerAccount.class);

            criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);

            List<CustomerAccount> users = criteria.list();
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

    public List<CustomerAccount> getCustomerAccountsByMobile(String MobileNo, Admin admin) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(CustomerAccount.class);
            criteria.add(Restrictions.like("MobileNo", MobileNo + "%"));
            criteria.add(Restrictions.eq("adminOfBranch", admin));
            criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);

            List<CustomerAccount> users = criteria.list();
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

    public CustomerAccount getCustomerAccountById(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(CustomerAccount.class);

            criteria.add(Restrictions.eq("Id", id));

            CustomerAccount CustomerAccount = (CustomerAccount) criteria.uniqueResult();

            return CustomerAccount;
        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {
            session.close();
        }
        return null;
    }

    public void updateCustomerAccount(CustomerAccount i) {
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

}
