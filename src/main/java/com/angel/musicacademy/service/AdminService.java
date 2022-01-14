package com.angel.musicacademy.service;

import com.angel.musicacademy.model.Admin;
import com.angel.musicacademy.model.BatchTime;
import com.angel.musicacademy.model.Branch;
import com.angel.musicacademy.model.Course;
import com.angel.musicacademy.model.Purchase;
import com.angel.musicacademy.model.Event;
import com.angel.musicacademy.model.Exam;
import com.angel.musicacademy.model.Instrument;
import com.angel.musicacademy.model.InstrumentSubcategory;
import com.angel.musicacademy.model.PhotosVideos;
import com.angel.musicacademy.model.Product;
import com.angel.musicacademy.model.Repair;
import com.angel.musicacademy.model.Sell;
import com.angel.musicacademy.model.Subject;
import com.angel.musicacademy.model.User;
import java.util.List;

public interface AdminService {
	
   /**************************** Admin *********************************/
	
	public int createAdmin(Admin admin);
    public Admin updateAdmin(Admin admin);
    public void deleteAdmin(int id);
    public List<Admin> getAllAdmins();
    public Admin getAdminByAdminEmailAndPassword(Admin admin);
    public Admin getReceptionByReceptionEmailAndPassword(Admin admin);
	
    /**************************** End Of Admin *********************************/
 
    /****************Instrument*******************************/
     public long createInstrumentSell(Sell sell);
     public Sell getSell(String sellno); 
     
     /*******************************Instrument End*****************/
    
	/**************************** Subject *********************************/
	
    public long createSubject(Subject subject);
       public long createCourse(Course course);
    public Subject updateSubject(Subject subject);
    public void deleteSubject(long id);
    public List<Subject> getAllSubjects();
    public Subject getSubject(long id);   
    public List<Subject> getAllSubjects(String subjectName);
      public List<Course> getAllCoursebysubject(long subjectId);
    
    /**************************** End Of Subject *********************************/
	
	/**************************** Batch Timing *********************************/
	
	public int addBatchTiming(BatchTime batchTime);
    public void deleteBatchTime(int id);
    public List<BatchTime> getAllBatchTiming();
    public BatchTime getBatchTime(int id);   
    
    /**************************** End Of Batch Timing *********************************/
    
   
    /**************************** Branch *********************************/
	
    public int addBranch(Branch branch);
    public void deleteBranch(int id);
    public List<Branch> getAllBranch();
    public Branch getBranch(int id);   
    
    /**************************** End Of Branch *********************************/
    
    /**************************** Instrument *********************************/
	
	   public int addInstrument(Instrument instrument);
	   public void deleteInstrument(int id);
	   public List<Instrument> getAllInstruments();
	   public Instrument getInstrument(int id);  
	   public Instrument updateInstrument(Instrument instrument);
	   
	 /**************************** End Of Instrument *********************************/
	 
	 /**************************** Gallery *********************************/
		
	   public int addPhotoVideo(PhotosVideos photosVideo);
	   public void deletePhotosVideo(int id);
	   public List<PhotosVideos> getAllphotosVideos();
	   public PhotosVideos getPhotosVideo(int id);   
	   
	 /**************************** End Of Gallery *********************************/ 
	   
	 /**************************** Event *********************************/
		
   	   public long addEvent(Event event);
	   public void deleteEvent(long id);
	   public List<Event> getAllEvents();
	   public Event getEvent(long id);   
	   
	 /**************************** End Of Event *********************************/
	   
	 /**************************** Exam *********************************/
		
	   public long addExam(Exam exam);
	   public void deleteExam(long id);
	   public List<Exam> getAllExams();
	   public Exam getExam(long id);   
	   
	 /**************************** End Of Exam  *********************************/
	   
	 /**************************** By Query *********************************/
		
	   public List<User> getUsersByBranch(String query);   
	   
	 /**************************** End Of By Query  *********************************/
	  
	   /**************************** Add Instrument Subcategory *********************************/
	   public long addInstrumentSubcategory(InstrumentSubcategory instrumentSubcategory);
	   public void deleteInstrumentSubcategory(int id);
	   public List<InstrumentSubcategory> getAllInstrumentSubcategorys();
	   public InstrumentSubcategory getInstrumentSubcategory(long id); 
	   public List<InstrumentSubcategory> getAllInstrumentSubcategorybyinstrumentid(int instrumentId);
	   public InstrumentSubcategory updateInstrumentSubcategory(InstrumentSubcategory instrumentSubcategory);
	   
	    /**************************** End of Instrument Subcategory *********************************/
	   
	   /**************************** Product *********************************/
		
	   public int addProduct(Product product);
	   public void deleteProduct(int id);
	   public List<Product> getAllProducts();
	   public Product getProduct(int id);  
	   public Product updateProduct(Product product);
	   public int lastProductId();
	   
	 /**************************** End Of Product *********************************/

	   /**************************** Purchase *********************************/
		
	   public int addPurchase(Purchase purchase);
	   public void deletePurchase(int id);
	   public List<Purchase> getAllPurchases();
	   public Purchase getPurchase(int id);  
	   public Purchase updatePurchase(Purchase purchase);
	   
	 /**************************** End Of Purchase *********************************/


}
