package com.angel.musicacademy.dao;

import com.angel.musicacademy.model.Branch;
import com.angel.musicacademy.model.EventApplication;
import com.angel.musicacademy.model.ExamApplication;
import com.angel.musicacademy.model.Instrument;
import com.angel.musicacademy.model.User;
import java.util.List;

public interface UserDAO {
    public long createUser(User user);
    public User updateUser(User user);
    public void deleteUser(long id);
    public List<User> getAllUsers();
    public User getUser(long id);  
   
    public List<User> getAllUsers(String userName);
    
    public List<String> getAllExestingJRnumbers();
     
    
    public List<User> getAllWatingUsers();
    public List<User> getAllWatingUsersByBranch(Branch branch);
    public List<User> getAllActiveUsers();
    public List<User> getAllActiveUsersByBranch(Branch branch);
    
    public List<User> getUsersByBranch(Branch branch);
    
    public List<User> getAllFeeDueStudents();
    public List<User> getAllFeeDueStudentsByBranch(Branch branch);
     public User getUserByUserEmailAndPassword(User user);  
    
     
    public List<String> getAllExistingSellnumbers();
    /**************************** Event Application*********************************/
	
	   public long addEventApplication(EventApplication eventApplication);
	   public void deleteEventApplication(long id);
	   public List<EventApplication> getAllEventApplications();
	   public EventApplication getEventApplication(long id);   
	   public List<String> getAllExestingEventnumbers();
	   public EventApplication getUserForApplyEvent(String examno);
	   
	 /**************************** End Of Event Application *********************************/
	   
	 /**************************** Exam Application*********************************/
		
	   public long addExamApplication(ExamApplication examApplication);
	   public void deleteExamApplication(long id);
	   public List<ExamApplication> getAllExamApplications();
	   public ExamApplication getExamApplication(long id);   
	   public List<String> getAllExestingExamnumbers();
	   public ExamApplication getUserForApplyExam(String examno);
	   
	 /**************************** End Of Exam Application *********************************/
}