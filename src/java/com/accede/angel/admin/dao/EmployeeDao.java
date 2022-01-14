/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.accede.angel.admin.dao;

import com.accede.angel.admin.model.Admin;
import com.accede.angel.admin.model.Admission;
import com.accede.angel.admin.model.ClassEnquiry;
import com.accede.angel.admin.model.Employee;
import com.accede.angel.admin.model.EmployeeActiveHistory;
import com.accede.angel.admin.model.EmployeeAdavance;
import com.accede.angel.admin.model.EmployeePayment;
import com.accede.angel.admin.model.EmployeeSalary;
import com.accede.angel.admin.model.EmployeeWeekoff;
import com.accede.angel.admin.model.Payment;
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
 * @author Accede
 */
public class EmployeeDao {
  
    public boolean saveEmployee(Employee c)
    {
        Session session =HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
       
        try {
            session.saveOrUpdate(c);
            tx.commit();
            return true;
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
        return false;
    } 
    
    public boolean saveEmployeeSalary(EmployeeSalary c)
    {
        Session session =HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
       
        try {
            session.saveOrUpdate(c);
            tx.commit();
            return true;
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
        return false;
    } 
    
     public boolean saveEmployeeActiveHistory(EmployeeActiveHistory c)
    {
        Session session =HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
       
        try {
            session.saveOrUpdate(c);
            tx.commit();
            return true;
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
        return false;
    } 
    
         public List<EmployeePayment> getAllEmployeePayment()
    {
      Session session=HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("FROM EmployeePayment");
            List<EmployeePayment> emp = query.list();
            tx.commit();
            return emp;
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
         
           public boolean saveEmployeePayment(EmployeePayment c)
    {
        Session session =HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
       
        try {
            session.saveOrUpdate(c);
            tx.commit();
            return true;
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
        return false;
    } 
           public List<EmployeeSalary> getAllEmployeeSalary(Employee Employee) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
       List<EmployeeSalary> users=null;
        try {
            Criteria criteria = session.createCriteria(EmployeeSalary.class);

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
             public List<EmployeeSalary> getAllEmployeeSalary()
    {
      Session session=HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            Query query = session.createQuery("FROM EmployeeSalary");
            List<EmployeeSalary> emp = query.list();
            tx.commit();
            return emp;
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
             
             
             
    public Employee getEmployeeByID(long EmployeeId)
{
       Session session=HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
             Query query = session.createQuery("FROM Employee WHERE id=:PRD_ID");
             query.setParameter("PRD_ID", EmployeeId);
             Employee emp = (Employee) query.uniqueResult();
             tx.commit();
             return emp;
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
    
    
       
       
         public List<Employee> getAllEmployee(Admin admin) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
       List<Employee> users=null;
        try {
            Criteria criteria = session.createCriteria(Employee.class);

            criteria.add(Restrictions.eq("Admin", admin));
         
          
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
         
         
          public List<EmployeeActiveHistory> getAllEmployeeActiveHistory(Employee Empl) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
       List<EmployeeActiveHistory> users=null;
        try {
            Criteria criteria = session.createCriteria(EmployeeActiveHistory.class);

            criteria.add(Restrictions.eq("employee", Empl));
         
          
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
    
         
          public List<Employee> getAllEmployee() {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
       List<Employee> users=null;
        try {
            Criteria criteria = session.createCriteria(Employee.class);

         
         
          
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
       
       public boolean updateEmployee(Employee b)
    {
        Session session =HibernateUtil.getSessionFactory().openSession();       
        Transaction tx = session.beginTransaction();
        System.out.println("saveadmin");
        
        try {
            session.update(b);
            tx.commit();
            return true;
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
        return false;
    }
        public void UpdateEmployeeStatus(Employee v) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction tx = session.beginTransaction();
        try {
            session.update(v);
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
            tx.rollback();
        } finally {
            session.close();
        }
    }
        
         public static boolean isEmployeePaymentExist(EmployeePayment b) 
    {
         Session session=HibernateUtil.getSessionFactory().openSession();
        boolean result = false;
        Transaction t=null;
        try
        {
             Criteria criteria = session.createCriteria(EmployeePayment.class);

            criteria.add(Restrictions.eq("employee", b.getEmployee()));
            criteria.add(Restrictions.eq("month", b.getMonth()));
            criteria.add(Restrictions.eq("year", b.getYear()));
         
          
            criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
          
            EmployeePayment u = (EmployeePayment)criteria.uniqueResult();
           
            if(u==null)
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
   
         
         
         public static boolean isEmployeePaymentExist(EmployeeWeekoff b) 
    {
         Session session=HibernateUtil.getSessionFactory().openSession();
        boolean result = false;
        Transaction t=null;
        try
        {
             Criteria criteria = session.createCriteria(EmployeePayment.class);

            criteria.add(Restrictions.eq("employee", b.getEmployee()));
            criteria.add(Restrictions.eq("month", b.getMonth()));
            criteria.add(Restrictions.eq("year",(Integer.parseInt(b.getYear()))));
         
          
            criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
          
            EmployeePayment u = (EmployeePayment)criteria.uniqueResult();
           
            if(u==null)
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
   
         
         
          public static boolean isEmployeePaymentExist(EmployeeAdavance b) 
    {
         Session session=HibernateUtil.getSessionFactory().openSession();
        boolean result = false;
        Transaction t=null;
        try
        {
             Criteria criteria = session.createCriteria(EmployeePayment.class);

            criteria.add(Restrictions.eq("employee", b.getEmployee()));
            criteria.add(Restrictions.eq("month", b.getMonth()));
            criteria.add(Restrictions.eq("year", (Integer.parseInt(b.getYear()))));
         
          
            criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
          
            EmployeePayment u = (EmployeePayment)criteria.uniqueResult();
           
            if(u==null)
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
          
          
          
   
}
