package com.angel.musicacademy.service.impl;

import com.angel.musicacademy.dao.AdminDAO;
import com.angel.musicacademy.model.Admin;
import com.angel.musicacademy.model.BatchTime;
import com.angel.musicacademy.model.Branch;
import com.angel.musicacademy.model.Course;
import com.angel.musicacademy.model.Event;
import com.angel.musicacademy.model.Exam;
import com.angel.musicacademy.model.Instrument;
import com.angel.musicacademy.model.InstrumentSubcategory;
import com.angel.musicacademy.model.PhotosVideos;
import com.angel.musicacademy.model.Product;
import com.angel.musicacademy.model.Purchase;
import com.angel.musicacademy.model.Repair;
import com.angel.musicacademy.model.Sell;
import com.angel.musicacademy.model.Subject;
import com.angel.musicacademy.model.User;
import com.angel.musicacademy.service.AdminService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDAO adminDAO;
	
	/**************************** Admin *********************************/
	
	@Override
	public int createAdmin(Admin admin) {
		// TODO Auto-generated method stub
          
		return adminDAO.createAdmin(admin);
	}
	@Override
	public Admin updateAdmin(Admin admin) {
		// TODO Auto-generated method stub
		return adminDAO.updateAdmin(admin);
	}
	@Override
	public void deleteAdmin(int id) {
		// TODO Auto-generated method stub
		adminDAO.deleteAdmin(id);
	}
	@Override
	public List<Admin> getAllAdmins() {
		// TODO Auto-generated method stub
		return adminDAO.getAllAdmins();
	}
	@Override
	public Admin getAdminByAdminEmailAndPassword(Admin admin) {
		// TODO Auto-generated method stub
		return adminDAO.getAdminByAdminEmailAndPassword(admin);
	}
	
	@Override
	public Admin getReceptionByReceptionEmailAndPassword(Admin admin) {
		// TODO Auto-generated method stub
		return adminDAO.getReceptionByReceptionEmailAndPassword(admin);
	}
	
	
	
		
    /****************************End Of Admin *********************************/

        /*************************Instrument*****************************************/
          @Override
    public long createInstrumentSell(Sell sell) {
        return adminDAO.createInstrumentSell(sell);
    }
    
    @Override
	public Sell getSell(String sellno) {
		// TODO Auto-generated method stub
		return adminDAO.getSell(sellno);
	}
    /************************Instrument End*****************************/
	/**************************** Subject *********************************/

	   @Override
	    public long createSubject(Subject subject) {
	        return adminDAO.createSubject(subject);
	    }
	    @Override
	    public Subject updateSubject(Subject subject) {
	        return adminDAO.updateSubject(subject);
	    }
	    @Override
	    public void deleteSubject(long id) {
	        adminDAO.deleteSubject(id);
	    }
	    @Override
	    public List<Subject> getAllSubjects() {
	        return adminDAO.getAllSubjects();
	    }
	    @Override
	    public Subject getSubject(long id) {
	        return adminDAO.getSubject(id);
	    }    
	    @Override
	    public List<Subject> getAllSubjects(String subjectName) {
	        return adminDAO.getAllSubjects(subjectName);
	    }

              @Override
	    public long createCourse(Course course) {
	        return adminDAO.createCourse(course);
	    }
              @Override
	public List<Course> getAllCoursebysubject(long subjectId) {
		// TODO Auto-generated method stub
		return adminDAO.getAllCoursebysubject(subjectId);
	}
/**************************** End Of Subject *********************************/
	
/**************************** Batch Timing *********************************/
	@Override
	public int addBatchTiming(BatchTime batchTime) {
		return adminDAO.addBatchTiming(batchTime);
	}

	@Override
	public void deleteBatchTime(int id) {
		// TODO Auto-generated method stub
		adminDAO.deleteBatchTime(id);
	}

	@Override
	public List<BatchTime> getAllBatchTiming() {
		// TODO Auto-generated method stub
		return adminDAO.getAllBatchTiming();
	}

	@Override
	public BatchTime getBatchTime(int id) {
		// TODO Auto-generated method stub
		return adminDAO.getBatchTime(id);
	}

	/**************************** End Of Batch Timing *********************************/
	
        
        
     
        
	/**************************** Branch *********************************/

	@Override
	public int addBranch(Branch branch) {
		// TODO Auto-generated method stub
		return adminDAO.addBranch(branch);
	}

	@Override
	public void deleteBranch(int id) {
		// TODO Auto-generated method stub
		adminDAO.deleteBranch(id);
	}

	@Override
	public List<Branch> getAllBranch() {
		// TODO Auto-generated method stub
		return adminDAO.getAllBranchs();
	}

	@Override
	public Branch getBranch(int id) {
		// TODO Auto-generated method stub
		return adminDAO.getBranch(id);
	}

   /**************************** End Of Branch *********************************/
	
	/**************************** Instrument *********************************/

	@Override
	public int addInstrument(Instrument instrument) {
		// TODO Auto-generated method stub
		return adminDAO.addInstrument(instrument);
	}

	@Override
	public void deleteInstrument(int id) {
		// TODO Auto-generated method stub
		adminDAO.deleteInstrument(id);
	}

	@Override
	public List<Instrument> getAllInstruments() {
		// TODO Auto-generated method stub
		return adminDAO.getAllInstruments();
	}

	@Override
	public Instrument getInstrument(int id) {
		// TODO Auto-generated method stub
		return adminDAO.getInstrument(id);
	}
	
	 @Override
	    public Instrument updateInstrument(Instrument instrument) {
	        return adminDAO.updateInstrument(instrument);
	    }
	
	/**************************** End Of Instrument *********************************/
	
	
	/**************************** Instrument Subcategory *********************************/

	@Override
	public long addInstrumentSubcategory(InstrumentSubcategory instrumentSubcategory) {
		// TODO Auto-generated method stub
		return adminDAO.addInstrumentSubcategory(instrumentSubcategory);
	}

	@Override
	public void deleteInstrumentSubcategory(int id) {
		// TODO Auto-generated method stub
		adminDAO.deleteInstrumentSubcategory(id);
	}

	@Override
	public List<InstrumentSubcategory> getAllInstrumentSubcategorys() {
		// TODO Auto-generated method stub
		return adminDAO.getAllInstrumentSubcategorys();
	}

	@Override
	public InstrumentSubcategory getInstrumentSubcategory(long id) {
		// TODO Auto-generated method stub
		return adminDAO.getInstrumentSubcategory(id);
	}
	
	  @Override
		public List<InstrumentSubcategory> getAllInstrumentSubcategorybyinstrumentid(int instrumentId) {
			// TODO Auto-generated method stub
			return adminDAO.getAllInstrumentSubcategorybyinstrumentid(instrumentId);
		}
	  
	  
	  @Override
	    public InstrumentSubcategory updateInstrumentSubcategory(InstrumentSubcategory instrumentSubcategory) {
	        return adminDAO.updateInstrumentSubcategory(instrumentSubcategory);
	    }
	
	/**************************** End Of Instrument Subcategory *********************************/
	
	/**************************** Product *********************************/

	@Override
	public int addProduct(Product product) {
		// TODO Auto-generated method stub
		return adminDAO.addProduct(product);
	}

	@Override
	public void deleteProduct(int id) {
		// TODO Auto-generated method stub
		adminDAO.deleteProduct(id);
	}

	@Override
	public List<Product> getAllProducts() {
		// TODO Auto-generated method stub
		return adminDAO.getAllProducts();
	}

	@Override
	public Product getProduct(int id) {
		// TODO Auto-generated method stub
		return adminDAO.getProduct(id);
	}
	
	 @Override
	    public Product updateProduct(Product product) {
	        return adminDAO.updateProduct(product);
	    }
	 @Override
	    public int lastProductId() {
	        return adminDAO.lastProductId();
	    }
	
	/**************************** End Of Product *********************************/
	 
	 
	 /**************************** Purchase *********************************/

		@Override
		public int addPurchase(Purchase purchase) {
			// TODO Auto-generated method stub
			return adminDAO.addPurchase(purchase);
		}

		@Override
		public void deletePurchase(int id) {
			// TODO Auto-generated method stub
			adminDAO.deleteProduct(id);
		}

		@Override
		public List<Purchase> getAllPurchases() {
			// TODO Auto-generated method stub
			return adminDAO.getAllPurchases();
		}

		@Override
		public Purchase getPurchase(int id) {
			// TODO Auto-generated method stub
			return adminDAO.getPurchase(id);
		}
		
		 @Override
		    public Purchase updatePurchase(Purchase purchase) {
		        return adminDAO.updatePurchase(purchase);
		    }
		
		/**************************** End Of Purchase *********************************/
		 
		 
		 
	/**************************** Gallery *********************************/


	@Override
	public int addPhotoVideo(PhotosVideos photosVideo) {
		// TODO Auto-generated method stub
		return adminDAO.addPhotoVideo(photosVideo);
	}
	@Override
	public void deletePhotosVideo(int id) {
		// TODO Auto-generated method stub
		adminDAO.deletePhotosVideo(id);
		
	}
	@Override
	public List<PhotosVideos> getAllphotosVideos() {
		// TODO Auto-generated method stub
		return adminDAO.getAllphotosVideos();
	}
	@Override
	public PhotosVideos getPhotosVideo(int id) {
		// TODO Auto-generated method stub
		return adminDAO.getPhotosVideo(id);
	}
	
	/**************************** End Of Gallery *********************************/
	
	/**************************** Event *********************************/


	@Override
	public long addEvent(Event event) {
		// TODO Auto-generated method stub
		return adminDAO.addEvent(event);
	}
	@Override
	public void deleteEvent(long id) {
		// TODO Auto-generated method stub
		adminDAO.deleteEvent(id);
		
	}
	@Override
	public List<Event> getAllEvents() {
		// TODO Auto-generated method stub
		return adminDAO.getAllEvents();
	}
	@Override
	public Event getEvent(long id) {
		// TODO Auto-generated method stub
		return adminDAO.getEvent(id);
	}
	
	/**************************** End Of Event *********************************/

/**************************** Exam *********************************/
	
	@Override
	public long addExam(Exam exam) {
		// TODO Auto-generated method stub
		return adminDAO.addExam(exam);
	}
	@Override
	public void deleteExam(long id) {
		// TODO Auto-generated method stub
		adminDAO.deleteEvent(id);
	}
	@Override
	public List<Exam> getAllExams() {
		// TODO Auto-generated method stub
		return adminDAO.getAllExams();
	}
	@Override
	public Exam getExam(long id) {
		// TODO Auto-generated method stub
		return adminDAO.getExam(id);
	}
	

/**************************** End Of Exam *********************************/

/**************************** By Query *********************************/
	@Override
	public List<User> getUsersByBranch(String string) {
		// TODO Auto-generated method stub
		return null;
	}
/**************************** End Of By Query *********************************/
}

