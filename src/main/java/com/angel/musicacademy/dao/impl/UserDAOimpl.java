package com.angel.musicacademy.dao.impl;

import com.angel.musicacademy.dao.UserDAO;
import com.angel.musicacademy.model.Branch;
import com.angel.musicacademy.model.EventApplication;
import com.angel.musicacademy.model.ExamApplication;
import com.angel.musicacademy.model.Instrument;
import com.angel.musicacademy.model.Sell;
import com.angel.musicacademy.model.User;
import com.angel.musicacademy.util.Cons;
import com.angel.musicacademy.util.HibernateUtil;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class UserDAOimpl implements UserDAO{

	    @Autowired
	    private HibernateUtil hibernateUtil;

	    @Autowired
	    private SessionFactory sessionFactory;
	    
	    @Override
	    public long createUser(User user) {        
	        return (Long) hibernateUtil.create(user);
	    }
	    
	    @Override
	    public User updateUser(User user) {        
	        return hibernateUtil.update(user);
	    }
	    
	    @Override
	    public void deleteUser(long id) {
	        User user = new User();
	        user.setUserId(id);
	        hibernateUtil.delete(user);
	    }
	    
	    @Override
	    public List<User> getAllUsers() {        
	        return hibernateUtil.fetchAll(User.class);
	    }
	    
           @Override
		public User getUserByUserEmailAndPassword(User user) {
			// TODO Auto-generated method stub
			String query = "FROM User WHERE userEmail='"+user.getUserEmail()+"' AND userPassword='"+user.getUserPassword()+"'";
			return hibernateUtil.getUserOrAdmin(query);
		}
                
                  @Override
		public ExamApplication getUserForApplyExam(String examno) {
			// TODO Auto-generated method stub
			String query = "FROM ExamApplication WHERE examno='"+examno+"' ";
			return hibernateUtil.getUserOrAdmin(query);
		}
                  
                  
                  @Override
          		public EventApplication getUserForApplyEvent(String eventNo) {
          			// TODO Auto-generated method stub
          			String query = "FROM EventApplication WHERE eventNo='"+eventNo+"' ";
          			return hibernateUtil.getUserOrAdmin(query);
          		}
	    @Override
	    public User getUser(long id) {
	        return hibernateUtil.fetchById(id, User.class);
	    }
            

	    
	    @Override
		public List<String> getAllExestingJRnumbers() {
			// TODO Auto-generated method stub
	    	Session session = sessionFactory.getCurrentSession();
			Criteria criteria = session.createCriteria(User.class)
													   .add(Restrictions.isNotNull("jrno"))
										    	       .setProjection(Projections.property("jrno"));
	    	@SuppressWarnings("unchecked")
			List<String> jrNos = (List<String>) criteria.list();
	    	return jrNos;
		}
	    
	    
	    @Override
	 		public List<String> getAllExestingEventnumbers() {
	 			// TODO Auto-generated method stub
	 	    	Session session = sessionFactory.getCurrentSession();
	 			Criteria criteria = session.createCriteria(EventApplication.class)
	 													   .add(Restrictions.isNotNull("eventNo"))
	 										    	       .setProjection(Projections.property("eventNo"));
	 	    	@SuppressWarnings("unchecked")
	 			List<String> eventNo = (List<String>) criteria.list();
	 	    	return eventNo;
	 		}
	    
	    @Override
		public List<String> getAllExistingSellnumbers() {
			// TODO Auto-generated method stub
	    	Session session = sessionFactory.getCurrentSession();
			Criteria criteria = session.createCriteria(Sell.class)
													   .add(Restrictions.isNotNull("sellNo"))
										    	       .setProjection(Projections.property("sellNo"));
	    	@SuppressWarnings("unchecked")
			List<String> sellNos = (List<String>) criteria.list();
	    	return sellNos;
		}
                
                  @Override
		public List<String> getAllExestingExamnumbers() {
			// TODO Auto-generated method stub
	    	Session session = sessionFactory.getCurrentSession();
			Criteria criteria = session.createCriteria(ExamApplication.class)
													   .add(Restrictions.isNotNull("examno"))
										    	       .setProjection(Projections.property("examno"));
	    	@SuppressWarnings("unchecked")
			List<String> jrNos = (List<String>) criteria.list();
	    	return jrNos;
		}
	    
	    @SuppressWarnings("unchecked")  
	    @Override
		public List<User> getUsersByBranch(Branch branch) {
			// TODO Auto-generated method stub
	    	Session session = sessionFactory.getCurrentSession();
	    	Query query = session.createQuery("FROM User WHERE userBranch=:BRANCH AND status=:STATUS");
	    	query.setParameter("STATUS",Cons.STUDENT_STATUS_ACTIVE);
	    	query.setParameter("BRANCH", branch);
	    	return query.list();
		}
	    

		@SuppressWarnings("unchecked")
		@Override
		public List<User> getAllWatingUsers() {
			Session session = sessionFactory.getCurrentSession();
	    	Query query = session.createQuery("FROM User WHERE status=:STATUS");
	    	query.setParameter("STATUS",Cons.STUDENT_STATUS_WATING);
	    	return query.list();
		}

		@SuppressWarnings("unchecked")
		@Override
		public List<User> getAllWatingUsersByBranch(Branch branch) {
			Session session = sessionFactory.getCurrentSession();
	    	Query query = session.createQuery("FROM User WHERE userBranch=:BRANCH AND status=:STATUS");
	    	query.setParameter("STATUS",Cons.STUDENT_STATUS_WATING);
	    	query.setParameter("BRANCH", branch);
	    	return query.list();
		}


	    
	    @SuppressWarnings("unchecked")
		@Override
		public List<User> getAllActiveUsers() {
			Session session = sessionFactory.getCurrentSession();
	    	Query query = session.createQuery("FROM User WHERE status=:STATUS");
	    	query.setParameter("STATUS",Cons.STUDENT_STATUS_ACTIVE);
	    	return query.list();
		}

		@SuppressWarnings("unchecked")
		@Override
		public List<User> getAllActiveUsersByBranch(Branch branch) {
			// TODO Auto-generated method stub
			Session session = sessionFactory.getCurrentSession();
	    	Query query = session.createQuery("FROM User WHERE userBranch=:BRANCH AND status=:STATUS");
	    	query.setParameter("STATUS",Cons.STUDENT_STATUS_ACTIVE);
	    	query.setParameter("BRANCH", branch);
	    	return query.list();
		}
		

		@Override
		public List<User> getAllFeeDueStudents() {
			Session session = sessionFactory.getCurrentSession();
			Criteria criteria = session.createCriteria(User.class);
			criteria.add(Restrictions.gt("balance",0f));
			criteria.add(Restrictions.eq("status", Cons.STUDENT_STATUS_ACTIVE));
			
			return criteria.list();
		}

		@Override
		public List<User> getAllFeeDueStudentsByBranch(Branch branch) {
			Session session = sessionFactory.getCurrentSession();
			Criteria criteria = session.createCriteria(User.class);
			criteria.add(Restrictions.gt("balance",0f));
			criteria.add(Restrictions.eq("status", Cons.STUDENT_STATUS_ACTIVE));
			criteria.add(Restrictions.eq("userBranch", branch));
			return criteria.list();
		}
		
		
		
		
	@Override
	public List<User> getAllUsers(String userName) {
		// TODO Auto-generated method stub
		return null;
	}
	

	/**************************** Event Application *********************************/
	@Override
	public long addEventApplication(EventApplication eventApplication) {
		// TODO Auto-generated method stub
		return (long) hibernateUtil.create(eventApplication);
	}

	@Override
	public void deleteEventApplication(long id) {
		// TODO Auto-generated method stub
		EventApplication eventApplication = new EventApplication();
		eventApplication.setEventApplicationId(id);
		hibernateUtil.delete(eventApplication);
	}

	@Override
	public List<EventApplication> getAllEventApplications() {
		// TODO Auto-generated method stub
		return hibernateUtil.fetchAll(EventApplication.class);
	}

	@Override
	public EventApplication getEventApplication(long id) {
		// TODO Auto-generated method stub
		return hibernateUtil.fetchById(id, EventApplication.class);
	}

	
/**************************** End Of Event Application *********************************/
	
/**************************** Exam Application *********************************/

	@Override
	public long addExamApplication(ExamApplication examApplication) {
		// TODO Auto-generated method stub
		return (long) hibernateUtil.create(examApplication);
	}

	@Override
	public void deleteExamApplication(long id) {
		// TODO Auto-generated method stub
		ExamApplication examApplication = new ExamApplication();
		examApplication.setExamApplicationId(id);
		hibernateUtil.delete(examApplication);
	}

	@Override
	public List<ExamApplication> getAllExamApplications() {
		// TODO Auto-generated method stub
		return hibernateUtil.fetchAll(ExamApplication.class);
	}

	@Override
	public ExamApplication getExamApplication(long id) {
		// TODO Auto-generated method stub
		return hibernateUtil.fetchById(id, ExamApplication.class);
	}
/**************************** End Of Exam Application *********************************/


	

}
