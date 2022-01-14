package com.angel.musicacademy.service.impl;

import com.angel.musicacademy.dao.UserDAO;
import com.angel.musicacademy.model.Branch;
import com.angel.musicacademy.model.EventApplication;
import com.angel.musicacademy.model.ExamApplication;
import com.angel.musicacademy.model.Instrument;
import com.angel.musicacademy.model.User;
import com.angel.musicacademy.service.UserService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
    private UserDAO userDAO;

    @Override
    public long createUser(User user) {
        return userDAO.createUser(user);
    }
    @Override
    public User updateUser(User user) {
        return userDAO.updateUser(user);
    }
    @Override
    public void deleteUser(long id) {
        userDAO.deleteUser(id);
    }
    @Override
    public List<User> getAllUsers() {
        return userDAO.getAllUsers();
    }
    @Override
    public User getUser(long id) {
        return userDAO.getUser(id);
    } 
     @Override
    public ExamApplication getUserForApplyExam(String id) {
        return userDAO.getUserForApplyExam(id);
    }
     @Override
     public EventApplication getUserForApplyEvent(String eventNo) {
         return userDAO.getUserForApplyEvent(eventNo);
     }
    @Override
	public User getUserByUserEmailAndPassword(User user) {
		// TODO Auto-generated method stub
		return userDAO.getUserByUserEmailAndPassword(user);
	}
    @Override
    public List<User> getAllUsers(String userName) {
        return userDAO.getAllUsers(userName);
    }
	@Override
	public List<User> getUsersByBranch(Branch branch) {
		// TODO Auto-generated method stub
		return userDAO.getUsersByBranch(branch);
	}
	
	
	@Override
	public List<String> getAllExestingJRnumbers() {
		// TODO Auto-generated method stub
		return userDAO.getAllExestingJRnumbers();
	}
	@Override
	public List<String> getAllExestingEventnumbers() {
		// TODO Auto-generated method stub
		return userDAO.getAllExestingEventnumbers();
	}
	@Override
	public List<String> getAllExestingExamnumbers() {
		// TODO Auto-generated method stub
		return userDAO.getAllExestingExamnumbers();
	}
        @Override
	public List<String> getAllExistingSellnumbers() {
		// TODO Auto-generated method stub
		return userDAO.getAllExistingSellnumbers();
	}
	@Override
	public List<User> getAllWatingUsers() {
		// TODO Auto-generated method stub
		return userDAO.getAllWatingUsers();
	}
	@Override
	public List<User> getAllWatingUsersByBranch(Branch branch) {
		// TODO Auto-generated method stub
		return userDAO.getAllWatingUsersByBranch(branch);
	}
	@Override
	public List<User> getAllActiveUsers() {
		// TODO Auto-generated method stub
		return userDAO.getAllActiveUsers();
	}
	@Override
	public List<User> getAllActiveUsersByBranch(Branch branch) {
		// TODO Auto-generated method stub
		return userDAO.getAllActiveUsersByBranch(branch);
	}

	@Override
	public List<User> getAllFeeDueStudents() {
		// TODO Auto-generated method stub
		return userDAO.getAllFeeDueStudents();
	}
	@Override
	public List<User> getAllFeeDueStudentsByBranch(Branch branch) {
		// TODO Auto-generated method stub
		return userDAO.getAllFeeDueStudentsByBranch(branch);
	}

	
	@Override
	public void sendAdmissionConfirmSMS(User user) {
		String message = "Dear "+
						 user.getUserName()+","+
						 "\nCongratulations on your successful registration with Angel Music Academy."+
						 "\nYour Jr No Is : "+user.getJrno()+
						 "\nFor Details Visit Ur Registered Mail ID.";
		SendMessage.sendMobileMSG(user.getUserMobileNo(), message);
		
	}
	@Override
	public void sendAdmissionConfirmMail(User user) {
		// TODO Auto-generated method stub
		
	}


    
/**************************** Event Application*********************************/
	
    @Override
	public long addEventApplication(EventApplication eventApplication) {
		// TODO Auto-generated method stub
		return userDAO.addEventApplication(eventApplication);
	}
	@Override
	public void deleteEventApplication(long id) {
		// TODO Auto-generated method stub
		userDAO.deleteEventApplication(id);
	}
	@Override
	public List<EventApplication> getAllEventApplications() {
		// TODO Auto-generated method stub
		return userDAO.getAllEventApplications();
	}
	@Override
	public EventApplication getEventApplication(long id) {
		// TODO Auto-generated method stub
		return userDAO.getEventApplication(id);
	}
	
/**************************** End Of Event Application *********************************/
	
/**************************** Exam Application*********************************/
	
	@Override
	public long addExamApplication(ExamApplication examApplication) {
		// TODO Auto-generated method stub
		return userDAO.addExamApplication(examApplication);
	}
	@Override
	public void deleteExamApplication(long id) {
		// TODO Auto-generated method stub
		userDAO.deleteEventApplication(id);
	}
	@Override
	public List<ExamApplication> getAllExamApplications() {
		// TODO Auto-generated method stub
		return userDAO.getAllExamApplications();
	}
	@Override
	public ExamApplication getExamApplication(long id) {
		// TODO Auto-generated method stub
		return userDAO.getExamApplication(id);
	}


	
/**************************** End Of Exam Application *********************************/
    
	
}