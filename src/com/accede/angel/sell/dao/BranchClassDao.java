/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.accede.angel.sell.dao;

import com.accede.angel.admin.model.Admin;
import com.accede.angel.sell.model.BranchClassSale;
import com.accede.angel.sell.model.BranchSale;
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
public class BranchClassDao {
  
    
    
      public List<BranchClassSale> getBranchClassSaleThisMonth(Admin admin) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
       List<BranchClassSale> users=null;
        try {
            Criteria criteria = session.createCriteria(BranchClassSale.class);
Date d1 = new Date();

            int day = d1.getDate() - 1;
            Date enddate = Dates.getEndingDate(d1, -day);
 Date Startdate = Dates.getEndingDate(d1, 1);
            criteria.add(Restrictions.ge("date", enddate));
            criteria.add(Restrictions.lt("date", Startdate));


            criteria.add(Restrictions.eq("admin", admin));
            

          
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
    public List<BranchClassSale> getBranchClassSaleThisMonth() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
       List<BranchClassSale> users=null;
        try {
            Criteria criteria = session.createCriteria(BranchClassSale.class);
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
    
    
    public List<BranchClassSale> getBranchClassSaleLastMonth(Admin admin) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
       List<BranchClassSale> users=null;
        try {
            Criteria criteria = session.createCriteria(BranchClassSale.class);
Date d1=new Date();
     int month=d1.getMonth();
     int days=0;
     System.out.println("==========================================================");
     System.out.println(month);
    System.out.println("==========================================================");
    if(month==1 || month==3 || month==5 || month==7 || month==8 ||month==10 ||month==12 )
        
    {
    days=31;
    }else if(month==2)
    {
          days=28;
    }
    else{
      days=30;
    }
    
Date Start_Date=Dates.getEndingDate(d1, -(days+d1.getDate()));
Date End_Date=Dates.getEndingDate(d1, -(d1.getDate()));


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

     public List<BranchClassSale> getBranchClassSaleLastMonth() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
       List<BranchClassSale> users=null;
        try {
            Criteria criteria = session.createCriteria(BranchClassSale.class);
Date d1=new Date();
     int month=d1.getMonth();
     int days=0;
     System.out.println("==========================================================");
     System.out.println(month);
    System.out.println("==========================================================");
    if(month==1 || month==3 || month==5 || month==7 || month==8 ||month==10 ||month==12 )
        
    {
    days=31;
    }else if(month==2)
    {
          days=28;
    }
    else{
      days=30;
    }
    
Date Start_Date=Dates.getEndingDate(d1, -(days+d1.getDate()));
Date End_Date=Dates.getEndingDate(d1, -(d1.getDate()));


      
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
     
     
     
     public List<BranchClassSale> getBranchClassSaleInoutt(Admin admin, int Days) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
       List<BranchClassSale> users=null;
        try {
            Criteria criteria = session.createCriteria(BranchClassSale.class);
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


            criteria.add(Restrictions.eq("admin", admin));
           

          
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
    
      public List<BranchClassSale> getBranchClassSaleInoutt( int Days) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
       List<BranchClassSale> users=null;
        try {
            Criteria criteria = session.createCriteria(BranchClassSale.class);
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
      public boolean saveBrachsale(BranchClassSale r1) {

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
      
      
      
      public List<BranchClassSale> getBranchClassSaleInoutt(Admin admin, Date d1 ,Date d2) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
       List<BranchClassSale> users=null;
        try {
            Criteria criteria = session.createCriteria(BranchClassSale.class);


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
      
      
      
       public List<BranchClassSale> getBranchClassSaleInoutt( Date d1 ,Date d2) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
       List<BranchClassSale> users=null;
        try {
            Criteria criteria = session.createCriteria(BranchClassSale.class);


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
     
 public List<BranchClassSale> getAllBranchClassSale()
    {
      Session session=HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("FROM BranchClassSale");
            List<BranchClassSale> client = query.list();
            tx.commit();
            return client;
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
        return null;
    }
 
 
  public List<BranchClassSale> getAllBranchClassSale(Admin admin) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
       List<BranchClassSale> users=null;
        try {
            Criteria criteria = session.createCriteria(BranchClassSale.class);


            criteria.add(Restrictions.eq("admin", admin));
           


          
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
