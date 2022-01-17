/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.sell.dao;

import com.accede.angel.admin.model.Admin;
import com.accede.angel.sell.model.BranchClassTransfer;
import com.accede.angel.sell.model.BranchClassTransfer;
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
public class BranchClassTransferDao {

    public List<BranchClassTransfer> getBranchClassTransferThisMonth(Admin admin) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        List<BranchClassTransfer> users = null;
        try {
            Criteria criteria = session.createCriteria(BranchClassTransfer.class);
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

    public List<BranchClassTransfer> getBranchClassTransferThisMonth() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        List<BranchClassTransfer> users = null;
        try {
            Criteria criteria = session.createCriteria(BranchClassTransfer.class);
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

    public List<BranchClassTransfer> getBranchClassTransferLastMonth(Admin admin) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        List<BranchClassTransfer> users = null;
        try {
            Criteria criteria = session.createCriteria(BranchClassTransfer.class);
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

    public List<BranchClassTransfer> getBranchClassTransferLastMonth() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        List<BranchClassTransfer> users = null;
        try {
            Criteria criteria = session.createCriteria(BranchClassTransfer.class);
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

    public List<BranchClassTransfer> getBranchClassTransferInoutt(Admin admin, int Days) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        List<BranchClassTransfer> users = null;
        try {
            Criteria criteria = session.createCriteria(BranchClassTransfer.class);
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

            criteria.add(Restrictions.eq("toadmin", admin));

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

    public List<BranchClassTransfer> getBranchClassTransferInoutt(int Days) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        List<BranchClassTransfer> users = null;
        try {
            Criteria criteria = session.createCriteria(BranchClassTransfer.class);
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

    public boolean saveBranchClassTransfer(BranchClassTransfer r1) {

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

    public List<BranchClassTransfer> getBranchClassTransferInoutt(Admin admin, Date d1, Date d2) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        List<BranchClassTransfer> users = null;
        try {
            Criteria criteria = session.createCriteria(BranchClassTransfer.class);

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

    public List<BranchClassTransfer> getBranchClassTransferInoutt(Date d1, Date d2) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        List<BranchClassTransfer> users = null;
        try {
            Criteria criteria = session.createCriteria(BranchClassTransfer.class);

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

    public List<BranchClassTransfer> getAllBranchClassTransfer() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("FROM BranchClassTransfer");
            List<BranchClassTransfer> client = query.list();
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

    public List<BranchClassTransfer> getAllBranchClassTransfer(Admin admin) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        List<BranchClassTransfer> users = null;
        try {
            Criteria criteria = session.createCriteria(BranchClassTransfer.class);

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
    
    
    
    public List<BranchClassTransfer> getAllBranchClassTransfer1(Admin admin) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        List<BranchClassTransfer> users = null;
        try {
            Criteria criteria = session.createCriteria(BranchClassTransfer.class);

            criteria.add(Restrictions.eq("toadmin", admin));

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

    public List<BranchClassTransfer> getAllBranchClassTransfer(int adminid) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Criteria criteria = session.createCriteria(BranchClassTransfer.class);
            if (adminid != 0) {
                criteria.add(Restrictions.eq("toadminid", adminid));
            }
//           if(catid != 0)
//            criteria.add(Restrictions.eq("product.category.id", catid));
//             if(subid != 0)
//            criteria.add(Restrictions.eq("subcatid", subid));
//               if(brandid != 0)
//            criteria.add(Restrictions.eq("brandid", brandid));
//                 if(modelid != 0)
//            criteria.add(Restrictions.eq("Modelid", modelid));
//                   if(colorid != 0)
//            criteria.add(Restrictions.eq("colorModelid", colorid));

            criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
            List<BranchClassTransfer> users = criteria.list();
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

    public List<BranchClassTransfer> getBranchClassTransferInoutt(int adminid, int Days,int fromadmin) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        List<BranchClassTransfer> users = null;
        try {
            Criteria criteria = session.createCriteria(BranchClassTransfer.class);
            Date d1 = new Date();
            System.out.println("Dayssss=" + Days);
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
            
            else if(Days == (-1)) 
            {
            
           

            int day = d1.getDate() - 1;
            Date enddate = Dates.getEndingDate(d1, -day);

            criteria.add(Restrictions.ge("date", enddate));
            criteria.add(Restrictions.lt("date", d1));

            
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

                criteria.add(Restrictions.ge("date", Start_Date));
                criteria.add(Restrictions.lt("date", End_Date));

            }

            if (adminid != 0) {
                criteria.add(Restrictions.eq("toadminid", adminid));
            }
                      if (fromadmin != 0) {
                criteria.add(Restrictions.eq("adminid", fromadmin));
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

    public List<BranchClassTransfer> getBranchClassTransferInoutt(int adminid, Date d1, Date d2,int fromadmin) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        List<BranchClassTransfer> users = null;
        try {
            Criteria criteria = session.createCriteria(BranchClassTransfer.class);
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

            if (adminid != 0) {
                criteria.add(Restrictions.eq("toadminid", adminid));
            }
            if (fromadmin != 0) {
                criteria.add(Restrictions.eq("adminid", fromadmin));
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

}
