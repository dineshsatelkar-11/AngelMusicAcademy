/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.accede.angel.sell.dao;

import com.accede.angel.admin.model.Admin;
import com.accede.angel.admin.model.CustomerAccount;
import com.accede.angel.sell.model.CustomerQuatation;
import com.accede.angel.sell.model.CustomerSale;
import com.accede.angel.services.Dates;
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
 * @author Admin
 */
public class CustomerQuatationDAO {
    
    public List<CustomerQuatation> getCustomerQuatationThisMonth(Admin admin) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        List<CustomerQuatation> users = null;
        try {
            Criteria criteria = session.createCriteria(CustomerQuatation.class);
            Date d1 = new Date();

            int day = d1.getDate() - 1;
            Date enddate = Dates.getEndingDate(d1, -day);
            Date Startdate = Dates.getEndingDate(d1, 1);

            criteria.add(Restrictions.eq("admin", admin));
            criteria.add(Restrictions.ge("date", enddate));
            criteria.add(Restrictions.lt("date", Startdate));

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

    public List<CustomerQuatation> getCustomerQuatationThisMonth() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        List<CustomerQuatation> users = null;
        try {
            Criteria criteria = session.createCriteria(CustomerQuatation.class);
            Date d1 = new Date();

            int day = d1.getDate() - 1;
            Date enddate = Dates.getEndingDate(d1, -day);
 Date Startdate = Dates.getEndingDate(d1, 1);
            criteria.add(Restrictions.ge("date", enddate));
            criteria.add(Restrictions.lt("date", Startdate));

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

    public List<CustomerQuatation> getCustomerQuatationLastMonth(Admin admin) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        List<CustomerQuatation> users = null;
        try {
            Criteria criteria = session.createCriteria(CustomerQuatation.class);
            Date d1 = new Date();
            int month = d1.getMonth();
            int days = 0;
            System.out.println("==========================================================");
            System.out.println(month);
            System.out.println("==========================================================");
            if (month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12) {
                days = 31;
            } else if (month == 2) {
                days = 28;
            } else {
                days = 30;
            }

            Date Start_Date = Dates.getEndingDate(d1, -(days + d1.getDate()));
            Date End_Date = Dates.getEndingDate(d1, -(d1.getDate()));

            criteria.add(Restrictions.eq("admin", admin));
            criteria.add(Restrictions.ge("date", Start_Date));
            criteria.add(Restrictions.lt("date", End_Date));

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

    public List<CustomerQuatation> getCustomerQuatationLastMonth() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        List<CustomerQuatation> users = null;
        try {
            Criteria criteria = session.createCriteria(CustomerQuatation.class);
            Date d1 = new Date();
            int month = d1.getMonth();
            int days = 0;
            System.out.println("==========================================================");
            System.out.println(month);
            System.out.println("==========================================================");
            if (month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12) {
                days = 31;
            } else if (month == 2) {
                days = 28;
            } else {
                days = 30;
            }

            Date Start_Date = Dates.getEndingDate(d1, -(days + d1.getDate()));
            Date End_Date = Dates.getEndingDate(d1, -(d1.getDate()));

            criteria.add(Restrictions.ge("date", Start_Date));
            criteria.add(Restrictions.lt("date", End_Date));

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

    public List<CustomerQuatation> getCustomerQuatationInoutt(Admin admin, int Days) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        List<CustomerQuatation> users = null;
        try {
            Criteria criteria = session.createCriteria(CustomerQuatation.class);
           

            criteria.add(Restrictions.eq("admin", admin));
            Date d1 = new Date();
            Date Startdate = Dates.getEndingDate(d1, 1);
            if (Days == 0) {
                criteria.add(Restrictions.eq("date", Dates.getStartingDate(new Date())));
            } else if (Days == 1) {
                criteria.add(Restrictions.like("date", Dates.getEndingDate(new Date(), -1)));
            } else if (Days == 7) {
                Days = 8;

                Date enddate = Dates.getEndingDate(d1, -Days);

                criteria.add(Restrictions.ge("date", enddate));
                criteria.add(Restrictions.lt("date", Startdate));
            } else if (Days == 30) {
                Days = 31;

                Date enddate = Dates.getEndingDate(d1, -Days);

                criteria.add(Restrictions.ge("date", enddate));
                criteria.add(Restrictions.lt("date", Startdate));
            }

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

    public List<CustomerQuatation> getCustomerQuatationInoutt(int Days) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        List<CustomerQuatation> users = null;
        try {
            Criteria criteria = session.createCriteria(CustomerQuatation.class);
            Date d1 = new Date();
            Date Startdate = Dates.getEndingDate(d1, 1);
            if (Days == 0) {
                criteria.add(Restrictions.eq("date", Dates.getStartingDate(new Date())));
            } else if (Days == 1) {
                criteria.add(Restrictions.like("date", Dates.getEndingDate(new Date(), -1)));
            } else if (Days == 7) {
                Days = 8;

                Date enddate = Dates.getEndingDate(d1, -Days);

                criteria.add(Restrictions.ge("date", enddate));
                criteria.add(Restrictions.lt("date", Startdate));
            } else if (Days == 30) {
                Days = 31;

                Date enddate = Dates.getEndingDate(d1, -Days);

                criteria.add(Restrictions.ge("date", enddate));
                criteria.add(Restrictions.lt("date", Startdate));
            }

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

    public boolean saveBrachsale(CustomerQuatation r1) {

        Session session = HibernateUtil.getSessionFactory().openSession();

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

    public boolean saveBrachsaleupdate(CustomerQuatation r1) {

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

    public List<CustomerQuatation> getCustomerQuatationInoutt(Admin admin, Date d1, Date d2) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        List<CustomerQuatation> users = null;
        try {
            Criteria criteria = session.createCriteria(CustomerQuatation.class);

            criteria.add(Restrictions.eq("admin", admin));
             Date enddate = Dates.getEndingDate(d1, -1);
             Date startdate = Dates.getEndingDate(d1, +1);
            criteria.add(Restrictions.ge("date", enddate));
            criteria.add(Restrictions.lt("date", startdate));

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

    public List<CustomerQuatation> getCustomerQuatationInoutt(Date d1, Date d2) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        List<CustomerQuatation> users = null;
        try {
            Criteria criteria = session.createCriteria(CustomerQuatation.class);

           Date enddate = Dates.getEndingDate(d1, -1);
             Date startdate = Dates.getEndingDate(d1, +1);
            criteria.add(Restrictions.ge("date", enddate));
            criteria.add(Restrictions.lt("date", startdate));

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

    public List<CustomerQuatation> getAllCustomerQuatation() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("FROM CustomerQuatation");
            List<CustomerQuatation> client = query.list();
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

    public boolean SaveProduct(CustomerQuatation r1) {

        Session session = HibernateUtil.getSessionFactory().openSession();

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

    public List<CustomerQuatation> getAllProduct() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("FROM CustomerQuatation");
            List<CustomerQuatation> client = query.list();
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

    public CustomerQuatation getpurchaseByID(int cid) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = s.beginTransaction();
        try {
            System.err.println("User ID:-" + cid);
            CustomerQuatation u = (CustomerQuatation) s.get(CustomerQuatation.class, cid);
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

    public List<CustomerQuatation> getBranchSale(String query) {
        List<CustomerQuatation> list = null;
        Transaction tra = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            tra = session.beginTransaction();
            list = session.createQuery(query).list();
        } catch (RuntimeException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }

        return list;
    }

    public List<CustomerQuatation> getAllCustomerQuatation(Admin p) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(CustomerQuatation.class);
            criteria.add(Restrictions.eq("admin", p));

            List<CustomerQuatation> u = criteria.list();

            return u;
        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {
            session.close();
        }
        return null;
    }

    public List<CustomerQuatation> getAllCustomerQuatation(CustomerAccount p) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(CustomerQuatation.class);
            criteria.add(Restrictions.eq("CustomerAccount", p));
            criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
            List<CustomerQuatation> u = criteria.list();

            return u;
        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {
            session.close();
        }
        return null;
    }

    public List<CustomerQuatation> getAllCustomer() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(CustomerQuatation.class);

            List<CustomerQuatation> u = criteria.list();

            return u;
        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {
            session.close();
        }
        return null;
    }

    public List<CustomerQuatation> getAllCustomerQuatationwithfilter(Date d1, Date d2, Admin p) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(CustomerQuatation.class);
            criteria.add(Restrictions.eq("admin", p));

            criteria.add(Restrictions.between("date", d1, d2));
            List<CustomerQuatation> u = criteria.list();

            return u;
        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {
            session.close();
        }
        return null;
    }

    public int getLastBillSaleID() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        int lastInvoiceID = 1;
        try {
            Query query = session.createQuery("SELECT MAX(id) FROM CustomerQuatation");
            lastInvoiceID = (int) query.uniqueResult();
            System.err.println("Last Invoice ID " + lastInvoiceID);
            tx.commit();
            return lastInvoiceID;
        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {
            session.close();
        }
        return lastInvoiceID;
    }
}
