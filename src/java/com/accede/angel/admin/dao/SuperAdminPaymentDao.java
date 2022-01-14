/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.accede.angel.admin.dao;

import com.accede.angel.admin.model.Admin;
import com.accede.angel.admin.model.Course;
import com.accede.angel.admin.model.Payment;
import com.accede.angel.admin.model.SuperAdminPayment;
import com.accede.angel.services.Dates;
import com.accede.angel.util.HibernateUtil;
import java.util.Date;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

/**
 *
 * @author Admin
 */
public class SuperAdminPaymentDao {
     
     public boolean saveSuperAdminPayment(SuperAdminPayment b) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
       
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
     
     public List<SuperAdminPayment> getPaymentThisMonth(String admin,String paymentAgainsType) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        List<SuperAdminPayment> users = null;
        try {
            Criteria criteria = session.createCriteria(SuperAdminPayment.class);
            Date d1 = new Date();

            int day = d1.getDate() - 1;
            Date enddate = Dates.getEndingDate(d1, -day);

            criteria.add(Restrictions.eq("paymentAgainsType", paymentAgainsType));
            criteria.add(Restrictions.eq("paymentAgains", admin));
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
     
     public List<SuperAdminPayment> getPaymentThisMonth(String paymentAgainsType) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        List<SuperAdminPayment> users = null;
        try {
            Criteria criteria = session.createCriteria(SuperAdminPayment.class);
            Date d1 = new Date();

            int day = d1.getDate() - 1;
            Date enddate = Dates.getEndingDate(d1, -day);

            criteria.add(Restrictions.eq("paymentAgainsType", paymentAgainsType));
           
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
     
     public List<SuperAdminPayment> getPaymentThisMonth() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        List<SuperAdminPayment> users = null;
        try {
            Criteria criteria = session.createCriteria(SuperAdminPayment.class);
            Date d1 = new Date();

            int day = d1.getDate() - 1;
            Date enddate = Dates.getEndingDate(d1, -day);

           
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

public List<SuperAdminPayment> getPaymentLastMonth(String admin,String paymentAgainsType) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        List<SuperAdminPayment> users = null;
        try {
            Criteria criteria = session.createCriteria(SuperAdminPayment.class);
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

             criteria.add(Restrictions.eq("paymentAgainsType", paymentAgainsType));
            criteria.add(Restrictions.eq("paymentAgains", admin));
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
public List<SuperAdminPayment> getPaymentLastMonth() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        List<SuperAdminPayment> users = null;
        try {
            Criteria criteria = session.createCriteria(SuperAdminPayment.class);
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

public List<SuperAdminPayment> getPaymentLastMonth(String paymentAgainsType) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        List<SuperAdminPayment> users = null;
        try {
            Criteria criteria = session.createCriteria(SuperAdminPayment.class);
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

             criteria.add(Restrictions.eq("paymentAgainsType", paymentAgainsType));
       
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


public List<SuperAdminPayment> getPaymentInoutt(String admin, String paymentAgainsType,int Days) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        List<SuperAdminPayment> users = null;
        try {
            Criteria criteria = session.createCriteria(SuperAdminPayment.class);
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

          criteria.add(Restrictions.eq("paymentAgainsType", paymentAgainsType));
            criteria.add(Restrictions.eq("paymentAgains", admin));

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

public List<SuperAdminPayment> getPaymentInoutt(int Days) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        List<SuperAdminPayment> users = null;
        try {
            Criteria criteria = session.createCriteria(SuperAdminPayment.class);
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

            criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
            users = criteria.list();
System.out.println("users===="+users.size());
            return users;

        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {
            session.close();
        }
        return users;
    }
public List<SuperAdminPayment> getPaymentInoutt( String paymentAgainsType,int Days) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        List<SuperAdminPayment> users = null;
        try {
            Criteria criteria = session.createCriteria(SuperAdminPayment.class);
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

          criteria.add(Restrictions.eq("paymentAgainsType", paymentAgainsType));
          

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


public List<SuperAdminPayment> getPaymentInoutt(String admin, String paymentAgainsType,Date d1, Date d2) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        List<SuperAdminPayment> users = null;
        try {
            Criteria criteria = session.createCriteria(SuperAdminPayment.class);

               criteria.add(Restrictions.eq("paymentAgainsType", paymentAgainsType));
            criteria.add(Restrictions.eq("paymentAgains", admin));
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


public List<SuperAdminPayment> getPaymentInoutt(Date d1, Date d2) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        List<SuperAdminPayment> users = null;
        try {
            Criteria criteria = session.createCriteria(SuperAdminPayment.class);

               
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
public List<SuperAdminPayment> getPaymentInoutt(String paymentAgainsType, Date d1, Date d2) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        List<SuperAdminPayment> users = null;
        try {
            Criteria criteria = session.createCriteria(SuperAdminPayment.class);

               criteria.add(Restrictions.eq("paymentAgainsType", paymentAgainsType));
       
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


public List<SuperAdminPayment> getAllPayment(String paymentAgainsType) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        List<SuperAdminPayment> users = null;
        try {
            Criteria criteria = session.createCriteria(SuperAdminPayment.class);
 criteria.add(Restrictions.eq("paymentAgainsType", paymentAgainsType));
       
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


public List<SuperAdminPayment> getAllPayment(String paymentAgainsType,String admin) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        List<SuperAdminPayment> users = null;
        try {
            Criteria criteria = session.createCriteria(SuperAdminPayment.class);
 criteria.add(Restrictions.eq("paymentAgainsType", paymentAgainsType));
         criteria.add(Restrictions.eq("paymentAgains", admin));
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
public List<SuperAdminPayment> getAllPayment() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        List<SuperAdminPayment> users = null;
        try {
            Criteria criteria = session.createCriteria(SuperAdminPayment.class);
       
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


 public List<SuperAdminPayment> getPaymentForExternalAccount(String admin,String paymentAgainsType) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        List<SuperAdminPayment> users = null;
        try {
            Criteria criteria = session.createCriteria(SuperAdminPayment.class);
            

            criteria.add(Restrictions.eq("paymentAgainsType", paymentAgainsType));
            criteria.add(Restrictions.eq("paymentAgains", admin));
           

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
}
