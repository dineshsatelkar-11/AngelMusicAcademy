/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.admin.dao;

import com.accede.angel.admin.model.Admin;
import com.accede.angel.admin.model.Branch;
import com.accede.angel.admin.model.Instrument;
import com.accede.angel.admin.model.LessonPdf;
import com.accede.angel.util.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Accede
 */
public class LessonDao {

    public LessonPdf getLessonPdfByID(int cid) {
        Session s = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = s.beginTransaction();
        try {
            System.err.println("User ID:-" + cid);
            LessonPdf u = (LessonPdf) s.get(LessonPdf.class, cid);
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

    public boolean update(LessonPdf i) {
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

    public boolean saveLessonPdf(LessonPdf b) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        if (isLessonPdfExist(b)) {
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

    public boolean saveLessonPdf1(LessonPdf b) {
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

     public static boolean isLessonPdfExist(LessonPdf b) 
    {
         Session session=HibernateUtil.getSessionFactory().openSession();
        boolean result = false;
        Transaction t=null;
        try
        {
            t=session.getTransaction();
            t.begin();
           Query query = session.createQuery("from LessonPdf where lessonno=:s  and courseid=:u");
            query.setParameter("u",b.getCourseid());
            query.setParameter("s",b.getLessonno());
            LessonPdf u = (LessonPdf)query.uniqueResult();
            t.commit();
            if(u!=null)
                return true;
        }
        catch(Exception e)
        {
            e.printStackTrace();
            t.rollback();
        }
        finally
        {
            session.close();
        }
       return result;
    }  

    public List<LessonPdf> getAllLessonPdf() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("FROM LessonPdf");
            List<LessonPdf> lessonPdf = query.list();
            tx.commit();
            return lessonPdf;
        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {
            session.close();
        }
        return null;
    }
}
