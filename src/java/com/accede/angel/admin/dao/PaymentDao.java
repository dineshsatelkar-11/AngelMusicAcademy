/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.admin.dao;

import com.accede.angel.admin.model.Admin;
import com.accede.angel.admin.model.Payment;
import com.accede.angel.services.Dates;
import com.accede.angel.util.HibernateUtil;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Accede
 */
public class PaymentDao {

    public Payment getPaymentByID(long id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("FROM Payment WHERE Id=:PRD_ID");
            query.setParameter("PRD_ID", id);
            Payment payment = (Payment) query.uniqueResult();
            tx.commit();
            return payment;
        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {
            session.close();
        }
        return null;
    }

    public boolean update(Payment i) {
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

    public boolean savePayment(Payment b) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
//         if (isEmailExist(b)) {
//            return false;
//        }  
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

    public List<Payment> getAllPayment(Admin admin) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        List<Payment> users = null;
        try {
            Criteria criteria = session.createCriteria(Payment.class);

            criteria.add(Restrictions.eq("adminOfBranch", admin));

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

    public List<Payment> getAllPayment() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        List<Payment> users = null;
        try {
            Criteria criteria = session.createCriteria(Payment.class);

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

    
    
    public long getTodayPaymentCredit(Admin admin) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        long amout = 0;
        try {
            Criteria criteria = session.createCriteria(Payment.class);

            criteria.add(Restrictions.eq("paymentType", "Credit"));
            criteria.add(Restrictions.eq("adminOfBranch", admin));

            criteria.add(Restrictions.eq("paymentDate", Dates.getStartingDate(new Date())));
            criteria.setProjection(Projections.sum("amount"));
            criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
            List users = criteria.list();

            amout = (Long) (users.get(0));

        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {
            session.close();
        }
        return amout;
    }

    public List<Payment> getPaymentInoutt(Admin admin, int Days) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        List<Payment> users = null;
        try {
            Criteria criteria = session.createCriteria(Payment.class);
            Date d1 = new Date();
            Date Startdate = Dates.getEndingDate(d1, 1);
            if (Days == 0) {
                criteria.add(Restrictions.eq("paymentDate", Dates.getStartingDate(new Date())));
            } else if (Days == 1) {
                criteria.add(Restrictions.like("paymentDate", Dates.getEndingDate(new Date(), -1)));
            } else if (Days == 7) {
                Days = 8;

                Date enddate = Dates.getEndingDate(d1, -Days);

                criteria.add(Restrictions.ge("paymentDate", enddate));
                criteria.add(Restrictions.lt("paymentDate", Startdate));
            } else if (Days == 30) {
                Days = 31;

                Date enddate = Dates.getEndingDate(d1, -Days);

                criteria.add(Restrictions.ge("paymentDate", enddate));
                criteria.add(Restrictions.lt("paymentDate", Startdate));
            }


            criteria.add(Restrictions.eq("adminOfBranch", admin));
           

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

    public List<Payment> getPaymentInoutt(Admin admin, Date d1, Date d2) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        List<Payment> users = null;
        try {
            Criteria criteria = session.createCriteria(Payment.class);

            criteria.add(Restrictions.eq("adminOfBranch", admin));
         criteria.add(Restrictions.between("paymentDate", d1, d2));

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

    public List<Payment> getPaymentInoutt(Date d1, Date d2) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        List<Payment> users = null;
        try {
            Criteria criteria = session.createCriteria(Payment.class);
  criteria.add(Restrictions.between("paymentDate", d1, d2));
           

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

    public List<Payment> getPaymentInoutt(int Days) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        List<Payment> users = null;
        try {
            Criteria criteria = session.createCriteria(Payment.class);
            Date d1 = new Date();
            Date Startdate = Dates.getEndingDate(d1, 1);
            if (Days == 0) {
                criteria.add(Restrictions.eq("paymentDate", Dates.getStartingDate(new Date())));
            } else if (Days == 1) {
                criteria.add(Restrictions.like("paymentDate", Dates.getEndingDate(new Date(), -1)));
            } else if (Days == 7) {
                Days = 8;

                Date enddate = Dates.getEndingDate(d1, -Days);

                criteria.add(Restrictions.ge("paymentDate", enddate));
                criteria.add(Restrictions.lt("paymentDate", Startdate));
            } else if (Days == 30) {
                Days = 31;

                Date enddate = Dates.getEndingDate(d1, -Days);

                criteria.add(Restrictions.ge("paymentDate", enddate));
                criteria.add(Restrictions.lt("paymentDate", Startdate));
            }


//            criteria.add(Restrictions.eq("adminOfBranch", admin));
            

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

    public List<Payment> getPaymentThisMonth(Admin admin) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        List<Payment> users = null;
        try {
            Criteria criteria = session.createCriteria(Payment.class);
            Date d1 = new Date();

            int day = d1.getDate() - 1;
            Date enddate = Dates.getEndingDate(d1, -day);

            criteria.add(Restrictions.eq("adminOfBranch", admin));
            criteria.add(Restrictions.ge("paymentDate", enddate));
            criteria.add(Restrictions.lt("paymentDate", d1));

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

    public List<Payment> getPaymentThisMonth() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        List<Payment> users = null;
        try {
            Criteria criteria = session.createCriteria(Payment.class);
            Date d1 = new Date();

            int day = d1.getDate() - 1;
            Date enddate = Dates.getEndingDate(d1, -day);

//            criteria.add(Restrictions.eq("adminOfBranch", admin));
            criteria.add(Restrictions.ge("paymentDate", enddate));
            criteria.add(Restrictions.lt("paymentDate", d1));

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

    
    
    
    public List<Payment> getPaymentLastMonth(Admin admin) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        List<Payment> users = null;
        try {
            Criteria criteria = session.createCriteria(Payment.class);
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

            criteria.add(Restrictions.eq("adminOfBranch", admin));
            criteria.add(Restrictions.ge("paymentDate", Start_Date));
            criteria.add(Restrictions.lt("paymentDate", End_Date));

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

    public List<Payment> getPaymentLastMonth() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        List<Payment> users = null;
        try {
            Criteria criteria = session.createCriteria(Payment.class);
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

//            criteria.add(Restrictions.eq("adminOfBranch", admin));
            criteria.add(Restrictions.ge("paymentDate", Start_Date));
            criteria.add(Restrictions.lt("paymentDate", End_Date));

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

    public long getTodayPaymentDebit(Admin admin) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        long amout = 0;
        try {
            Criteria criteria = session.createCriteria(Payment.class);

            criteria.add(Restrictions.eq("paymentType", "Debit"));
            criteria.add(Restrictions.eq("adminOfBranch", admin));

            criteria.add(Restrictions.eq("paymentDate", Dates.getStartingDate(new Date())));
            criteria.setProjection(Projections.sum("amount"));
            criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
            List users = criteria.list();

            amout = (Long) (users.get(0));

        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {
            session.close();
        }
        return amout;
    }

    public long getYesterdayPayment(Admin admin) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        long amout = 0;
        try {
            Criteria criteria = session.createCriteria(Payment.class);

            criteria.add(Restrictions.eq("adminOfBranch", admin));
            Date d = new Date();
            int month = d.getMonth();
            month = month + 1;
            int year = d.getYear();
            year = year - 100;
            year = year + 2000;
            if (month < 4) {
                year = year - 1;
            }
            String Birthdate = 31 + "/" + 3 + "/" + year;
            Date Startdate = new Date();
            try {
                Startdate = new SimpleDateFormat("dd/MM/yyyy").parse(Birthdate);

            } catch (ParseException ex) {
                ex.printStackTrace();
            }
   System.err.println("++++++++Startdate++++++++++: " + Startdate);
            criteria.add(Restrictions.ge("paymentDate", Startdate));
            criteria.add(Restrictions.lt("paymentDate", new Date()));
            criteria.add(Restrictions.eq("paymentType", "Credit"));

            criteria.setProjection(Projections.sum("amount"));
            criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
            List users = criteria.list();
            long yesterdayamt = getYesterdayPaymentDebit(admin);
             System.err.println("++++++++++++++++++: " + yesterdayamt);
            amout = (Long) (users.get(0));
 System.err.println("++++++++++++++++++: " + amout);
            amout = amout - yesterdayamt;
            System.err.println("++++++++++++++++++: " + amout);
            System.err.println("Recently Joined Users: " + users.size());

        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {
            session.close();
        }
        return amout;
    }

    public long getYesterdayPaymentDebit(Admin admin) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        long amout = 0;
        try {
            Criteria criteria = session.createCriteria(Payment.class);

            criteria.add(Restrictions.eq("adminOfBranch", admin));
            Date d = new Date();
            int month = d.getMonth();
            month = month + 1;
            int year = d.getYear();
            year = year - 100;
            year = year + 2000;
            if (month < 4) {
                year = year - 1;
            }
            String Birthdate = 31 + "/" + 3 + "/" + year;
            Date Startdate = new Date();
            try {
                Startdate = new SimpleDateFormat("dd/MM/yyyy").parse(Birthdate);

            } catch (ParseException ex) {
                ex.printStackTrace();
            }

            criteria.add(Restrictions.ge("paymentDate", Startdate));
            criteria.add(Restrictions.lt("paymentDate", new Date()));
            criteria.add(Restrictions.eq("paymentType", "Debit"));

            criteria.setProjection(Projections.sum("amount"));
            criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
            List users = criteria.list();

            amout = (Long) (users.get(0));

            System.err.println("Recently Joined Users: " + users.size());

        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {
            session.close();
        }
        return amout;
    }

    public List<Payment> getPaymentOrder(String query) {
        List<Payment> list = null;
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
}
