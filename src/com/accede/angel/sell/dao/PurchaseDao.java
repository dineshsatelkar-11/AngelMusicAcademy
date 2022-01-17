/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.sell.dao;

import com.accede.angel.admin.model.Admin;
import com.accede.angel.admin.model.Payment;
import com.accede.angel.admin.model.Purchase;
import com.accede.angel.sell.model.PurchaseDetails;
import com.accede.angel.sell.model.PurchaseProduct;
import com.accede.angel.sell.model.Venderregistration;
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
 * @author ACER
 */
public class PurchaseDao {

    public Purchase getelementByID(int cid) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = s.beginTransaction();
        try {
            System.err.println("User ID:-" + cid);
            Purchase u = (Purchase) s.get(Purchase.class, cid);
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

    public PurchaseProduct getProductById(long cid) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = s.beginTransaction();
        try {
            System.err.println("User ID:-" + cid);
            PurchaseProduct u = (PurchaseProduct) s.get(Purchase.class, cid);
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

    public List<PurchaseProduct> getPurchaseProductThisMonth(Venderregistration vendorid) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        List<PurchaseProduct> users = null;
        try {
            Criteria criteria = session.createCriteria(PurchaseProduct.class);
            Date d1 = new Date();

            int day = d1.getDate() - 1;
            Date enddate = Dates.getEndingDate(d1, -day);

            criteria.add(Restrictions.eq("vendorid", vendorid));
            criteria.add(Restrictions.ge("Purchase_Date", enddate));
            criteria.add(Restrictions.lt("Purchase_Date", d1));

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

    public List<PurchaseProduct> getPurchaseProductThisMonth() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        List<PurchaseProduct> users = null;
        try {
            Criteria criteria = session.createCriteria(PurchaseProduct.class);
            Date d1 = new Date();

            int day = d1.getDate() - 1;
            Date enddate = Dates.getEndingDate(d1, -day);

            criteria.add(Restrictions.ge("Purchase_Date", enddate));
            criteria.add(Restrictions.lt("Purchase_Date", d1));

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

    public List<PurchaseProduct> getPurchaseProductLastMonth(Venderregistration vendorid) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        List<PurchaseProduct> users = null;
        try {
            Criteria criteria = session.createCriteria(PurchaseProduct.class);
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

            criteria.add(Restrictions.eq("vendorid", vendorid));
            criteria.add(Restrictions.ge("Purchase_Date", Start_Date));
            criteria.add(Restrictions.lt("Purchase_Date", End_Date));

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
    
    
    public List<PurchaseProduct> getPurchaseProductLastMonth() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        List<PurchaseProduct> users = null;
        try {
            Criteria criteria = session.createCriteria(PurchaseProduct.class);
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

          
            criteria.add(Restrictions.ge("Purchase_Date", Start_Date));
            criteria.add(Restrictions.lt("Purchase_Date", End_Date));

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

      public List<PurchaseProduct> getPurchaseProductInoutt(Venderregistration vendorid, int Days) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        List<PurchaseProduct> users = null;
        try {
            Criteria criteria = session.createCriteria(PurchaseProduct.class);
            Date d1 = new Date();
            System.out.println("--------------------------------------------------=" );
            System.out.println("Dayssss=" );
            System.out.println("Dayssss=" + Days);
            System.out.println("------------------------------------------------=" );
            Date Startdate = Dates.getEndingDate(d1, 1);
            if (Days == 0) {
                criteria.add(Restrictions.eq("Purchase_Date", Dates.getStartingDate(new Date())));
            } else if (Days == 1) {
                criteria.add(Restrictions.like("Purchase_Date", Dates.getEndingDate(new Date(), -1)));
            } else if (Days == 7) {
                Days = 8;

                Date enddate = Dates.getEndingDate(d1, -Days);

                criteria.add(Restrictions.ge("Purchase_Date", enddate));
                criteria.add(Restrictions.lt("Purchase_Date", Startdate));
            } else if (Days == 30) {
                Days = 31;

                Date enddate = Dates.getEndingDate(d1, -Days);

                criteria.add(Restrictions.ge("Purchase_Date", enddate));
                criteria.add(Restrictions.lt("Purchase_Date", Startdate));
            }else if(Days == (-1)) 
            {
            
           

            int day = d1.getDate() - 1;
            Date enddate = Dates.getEndingDate(d1, -day);

            criteria.add(Restrictions.ge("Purchase_Date", enddate));
            criteria.add(Restrictions.lt("Purchase_Date", d1));

            
            }
            else if (Days == (-2)) {

                d1 = new Date();
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
  System.out.println("==========================================================");
                System.out.println("Start_Date==="+Start_Date);
                System.out.println("End_Date==="+End_Date);
                System.out.println("==========================================================");
               
                criteria.add(Restrictions.ge("Purchase_Date", Start_Date));
                criteria.add(Restrictions.lt("Purchase_Date", End_Date));

            }
 System.out.println("==========================================================");
                System.out.println("vendorid==="+vendorid.getId());
                System.out.println("vendorid==="+vendorid.getId());
                System.out.println("==========================================================");
               
            if (vendorid.getId() != 0) {
                criteria.add(Restrictions.eq("vendorid", vendorid));
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

    
   public List<PurchaseProduct> getPurchaseProductTransferInoutt(Venderregistration vendorid, Date d1, Date d2) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        List<PurchaseProduct> users = null;
        try {
            Criteria criteria = session.createCriteria(PurchaseProduct.class);
            Date enddate = Dates.getEndingDate(d1, -1);
            Date startdate = Dates.getEndingDate(d2, +1);
            System.out.println("*******************");
            System.out.println("***********startdate********"+startdate);
            System.out.println("*******************");
            System.out.println("*******************");
            System.out.println("***********enddate********"+enddate);
            System.out.println("*******************");
            criteria.add(Restrictions.ge("date", enddate));
            criteria.add(Restrictions.lt("date", startdate));

             if (vendorid.getId() != 0) {
                criteria.add(Restrictions.eq("vendorid", vendorid));
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

    
     public List<PurchaseProduct> getPurchaseProductInoutt( int Days) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
       List<PurchaseProduct> users=null;
        try {
            Criteria criteria = session.createCriteria(PurchaseProduct.class);
 Date d1 = new Date();
            Date Startdate = Dates.getEndingDate(d1, 1);
            if (Days == 0) {
                criteria.add(Restrictions.eq("Purchase_Date", Dates.getStartingDate(new Date())));
            } else if (Days == 1) {
                criteria.add(Restrictions.like("Purchase_Date", Dates.getEndingDate(new Date(), -1)));
            } else if (Days == 7) {
                Days = 8;

                Date enddate = Dates.getEndingDate(d1, -Days);

                criteria.add(Restrictions.ge("Purchase_Date", enddate));
                criteria.add(Restrictions.lt("Purchase_Date", Startdate));
            } else if (Days == 30) {
                Days = 31;

                Date enddate = Dates.getEndingDate(d1, -Days);

                criteria.add(Restrictions.ge("Purchase_Date", enddate));
                criteria.add(Restrictions.lt("Purchase_Date", Startdate));
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
    
     public List<PurchaseProduct> getPurchaseProductInoutt(Venderregistration vendorid, Date d1 ,Date d2) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
       List<PurchaseProduct> users=null;
        try {
            Criteria criteria = session.createCriteria(PurchaseProduct.class);
Date datee=new Date();
Date startdate=Dates.getEndingDate(d1, -1);
Date enddate=Dates.getEndingDate(d2, 1);

            if (vendorid.getId() != 0) {
                criteria.add(Restrictions.eq("vendorid", vendorid));
            }
              
            criteria.add(Restrictions.ge("Purchase_Date", startdate));
            criteria.add(Restrictions.lt("Purchase_Date", enddate));

          
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
      
     
     public List<PurchaseProduct> getPurchaseProductInoutt( Date d1 ,Date d2) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
       List<PurchaseProduct> users=null;
        try {
            Criteria criteria = session.createCriteria(PurchaseProduct.class);


          Date datee=new Date();
Date startdate=Dates.getEndingDate(d1, -1);
Date enddate=Dates.getEndingDate(d2, 1);

            criteria.add(Restrictions.ge("Purchase_Date", startdate));
            criteria.add(Restrictions.lt("Purchase_Date", enddate));
          
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
     
     
     
    public PurchaseProduct getProductById2(long r) {
        Session session = HibernateUtil.getSessionFactory().openSession();

        PurchaseProduct r1 = null;
        try {

            Query q = session.createQuery("from PurchaseProduct where PurchaseID=:r ");
            q.setParameter("r", r);
//         q.setParameter("o",r.getOtp());

            r1 = (PurchaseProduct) q.uniqueResult();
            //  System.out.println("============"+r1.getEmail());
            return r1;
        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            session.close();
        }
        return null;
    }

    public void update(Purchase i) {
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

    public boolean save(Purchase b) {
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

    public boolean savePurchaseProduct(PurchaseProduct b) {
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

    public boolean savePurchaseDetails(PurchaseDetails b) {
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

    public Purchase otpmatch(Purchase r) {
        Session session = HibernateUtil.getSessionFactory().openSession();

        Purchase r1 = null;
        try {

            Query q = session.createQuery("from Purchase where Email=:e and Otp=:o");
//         q.setParameter("e",r.getEmail());
//         q.setParameter("o",r.getOtp());

            r1 = (Purchase) q.uniqueResult();
            //  System.out.println("============"+r1.getEmail());
            return r1;
        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            session.close();
        }
        return null;
    }

    public int Delete(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Purchase delete = (Purchase) session.load(Purchase.class, id);
            session.delete(delete);
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
            return 0;
        } finally {
            session.close();

        }
        return 1;
    }

    public List<Purchase> getAllCelloClient() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("FROM Purchase");
            List<Purchase> client = query.list();
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

    public List<PurchaseProduct> getAllPurchaseProduct() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("FROM PurchaseProduct");

            List<PurchaseProduct> client = query.list();
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

    public List<PurchaseProduct> getPurchaseProductReport(Date d1, Date d2, Venderregistration v) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(PurchaseProduct.class);

            System.out.println(d1);
            System.out.println(d2);
            System.out.println(v.getId());

            criteria.add(Restrictions.between("Purchase_Date", d1, d2));
            criteria.add(Restrictions.eq("vendorid", v));
//            criteria.addOrder(Order.desc("Reg_Date"));
            List<PurchaseProduct> users = criteria.list();
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

    public List<PurchaseProduct> getPurchaseProductReport1(String query) {
        List<PurchaseProduct> list = null;
        Transaction tra = null;
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            tra = session.beginTransaction();
            list = session.createQuery(query).list();
            System.out.println("list=" + list.size());
        } catch (RuntimeException e) {
            e.printStackTrace();
        } finally {
            session.close();
        }

        return list;
    }

    public long getLastPurchaseId() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        long lastInvoiceID = 1;
        try {
            Query query = session.createQuery("SELECT MAX(PurchaseID) FROM PurchaseProduct");
            lastInvoiceID = (long) query.uniqueResult();
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
