package com.angel.musicacademy.service;

import com.angel.musicacademy.model.Branch;
import com.angel.musicacademy.model.EventApplication;
import com.angel.musicacademy.model.ExamApplication;
import com.angel.musicacademy.model.Instrument;
import com.angel.musicacademy.model.User;
import java.util.List;

public interface UserService {
    public long createUser(User user);
    public User updateUser(User user);
    public void deleteUser(long id);
    public List<User> getAllUsers();
    public User getUser(long id);
   
    
    public List<String> getAllExestingJRnumbers();
    public List<String> getAllExestingExamnumbers();
    public List<String> getAllExistingSellnumbers();
    
    
    public List<User> getAllUsers(String userName);
    public List<User> getUsersByBranch(Branch branch);
    
    public List<User> getAllWatingUsers();
    public List<User> getAllWatingUsersByBranch(Branch branch);
    public List<User> getAllActiveUsers();
    public List<User> getAllActiveUsersByBranch(Branch branch);
    public List<User> getAllFeeDueStudents();
    public List<User> getAllFeeDueStudentsByBranch(Branch branch);
    
    public void sendAdmissionConfirmSMS(User user);
    public void sendAdmissionConfirmMail(User user);
     public User getUserByUserEmailAndPassword(User user); 
    
    
    /**************************** Event Application*********************************/
	
	   public long addEventApplication(EventApplication eventApplication);
	   public void deleteEventApplication(long id);
	   public List<EventApplication> getAllEventApplications();
	   public EventApplication getEventApplication(long id);  
	   public List<String> getAllExestingEventnumbers();
	   public EventApplication getUserForApplyEvent(String eventNo);
	   
	 /**************************** End Of Event Application *********************************/
	   
	 /**************************** Exam Application*********************************/
		
	   public long addExamApplication(ExamApplication examApplication);
	   public void deleteExamApplication(long id);
	   public List<ExamApplication> getAllExamApplications();
	   public ExamApplication getExamApplication(long id);
	   public ExamApplication getUserForApplyExam(String id);
	 
	   
	 /**************************** End Of Exam Application *********************************/
}
