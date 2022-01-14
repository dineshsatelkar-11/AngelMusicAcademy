/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.admin.dao;

import com.accede.angel.admin.model.BatchTime;
import com.accede.angel.admin.model.Course;
import com.accede.angel.util.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author ACER
 */
public class CourseDao {

    public Course getCourseByID(int cid) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = s.beginTransaction();
        try {
            System.err.println("User ID:-" + cid);
            Course u = (Course) s.get(Course.class, cid);
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
    
    
  
    
    
     public Course getCourseBylongID(long cid) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = s.beginTransaction();
        try {
            System.err.println("User ID:-" + cid);
            Course u = (Course) s.get(Course.class, cid);
            System.err.println("User ID:-" + u.getCourseName());
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

    public void update(Course i) {
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

      public boolean deleteCourseByID(long courseId)
{
         Session session=HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
             Query query = session.createQuery("DELETE FROM Course WHERE courseId=:courseId");
             query.setParameter("courseId", courseId);
             int i = query.executeUpdate();
             System.err.println(i+" Product Deleted");
             tx.commit();
             return Boolean.TRUE;
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
         return Boolean.FALSE;
}
    public boolean saveCourse(Course b) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        if (isCourseExist(b)) {
            return false;
        }
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
    
    
     public boolean saveCourse1(Course b) {
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

    public static boolean isCourseExist(Course b) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        boolean result = false;
        Transaction t = null;
        try {
            t = session.getTransaction();
            t.begin();
            Query query = session.createQuery("from Course where courseName=:courseName");
            query.setParameter("courseName", b.getCourseName());
            Course u = (Course) query.uniqueResult();
            t.commit();
            if (u != null) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            t.rollback();
        } finally {
            session.close();
        }
        return result;
    }

      public Course getCourseByName(String Coursename) {
        Session session = HibernateUtil.getSessionFactory().openSession();

        Course r1 = null;
        try {
               Query q = session.createQuery("from Course where courseName=:Coursename");
          q.setParameter("Coursename", Coursename);
          System.out.println("Coursename22-"+Coursename);
               r1 = (Course) q.uniqueResult();
               System.out.println("r1-"+r1);
                 return r1;
        } catch (Exception e) {
          e.printStackTrace();
        } finally {
           session.close();
        }
        return null;
    }
      
      
      
       public Course getCourseByIDDD(long courseidd) {
        Session session = HibernateUtil.getSessionFactory().openSession();

        Course r1 = null;
        try {
               Query q = session.createQuery("from Course where courseId=:Coursename");
          q.setParameter("Coursename", courseidd);
          System.out.println("Coursename22-"+courseidd);
               r1 = (Course) q.uniqueResult();
               System.out.println("r1-"+r1);
                 return r1;
        } catch (Exception e) {
          e.printStackTrace();
        } finally {
           session.close();
        }
        return null;
    }
    public Course otpmatch(Course r) {
        Session session = HibernateUtil.getSessionFactory().openSession();

        Course r1 = null;
        try {

            Query q = session.createQuery("from BatchTime where Email=:e and Otp=:o");
//         q.setParameter("e",r.getEmail());
//         q.setParameter("o",r.getOtp());

            r1 = (Course) q.uniqueResult();
            //  System.out.println("============"+r1.getEmail());
            return r1;
        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            session.close();
        }
        return null;
    }

    public boolean Delete(int id) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Course delete = (Course) session.load(Course.class, id);
            session.delete(delete);
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
            return false;
        } finally {
            session.close();

        }
        return true;
    }

    public List<Course> getAllCourse() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("FROM Course");
            List<Course> client = query.list();
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

}
