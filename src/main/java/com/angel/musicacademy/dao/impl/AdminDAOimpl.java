package com.angel.musicacademy.dao.impl;

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
import com.angel.musicacademy.util.HibernateUtil;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
@Repository
@Transactional
public class AdminDAOimpl implements AdminDAO {
	 @Autowired
	 private HibernateUtil hibernateUtil;
	  @Autowired
	    private SessionFactory sessionFactory;
	 
	 /**************************** Admin *********************************/
		@Override
		public int createAdmin(Admin admin) {
			// TODO Auto-generated method stub
			return (int) hibernateUtil.create(admin);
		}

		@Override
		public Admin updateAdmin(Admin admin) {
			// TODO Auto-generated method stub
			return hibernateUtil.update(admin);
		}

		@Override
		public void deleteAdmin(int id) {
			// TODO Auto-generated method stub
			Admin admin = new Admin();
	        admin.setAdminId(id);
	        hibernateUtil.delete(admin);
		}

		@Override
		public List<Admin> getAllAdmins() {
			// TODO Auto-generated method stub
			return hibernateUtil.fetchAll(Admin.class);
		}

		@Override
		public Admin getAdminByAdminEmailAndPassword(Admin admin) {
			// TODO Auto-generated method stub
			String query = "FROM Admin WHERE adminEmail='"+admin.getAdminEmail()+"' AND adminPassword='"+admin.getAdminPassword()+"'";
			return hibernateUtil.getUserOrAdmin(query);
		}
		
		@Override
		public Admin getReceptionByReceptionEmailAndPassword(Admin admin) {
			// TODO Auto-generated method stub
			String password = admin.getAdminPassword() ;
			 

			String query = "FROM Admin WHERE adminEmail='"+admin.getAdminEmail()+"' AND receptionPassword='"+password+"'";
			

			return hibernateUtil.getUserOrAdmin(query);
			
		}
		
     /****************************End Of Admin *********************************/

 /***********************************Instrument***********************/
        @Override
	    public long createInstrumentSell(Sell sell) {        
	        return (Long) hibernateUtil.create(sell);
	    }
            
        
         @Override
		public Sell getSell(String sellno) {
			// TODO Auto-generated method stub
			String query = "FROM Sell WHERE sellNo='"+sellno+"' ";
			return hibernateUtil.getUserOrAdmin(query);
		}
            
 /*(***********************************Instrument End**********************/
            
	 /**************************** Branch *********************************/
	 @Override
	    public long createSubject(Subject subject) {        
	        return (Long) hibernateUtil.create(subject);
	    }
	    
	    @Override
	    public Subject updateSubject(Subject subject) {        
	        return hibernateUtil.update(subject);
	    }
	    
	    @Override
	    public void deleteSubject(long id) {
	        Subject subject = new Subject();
	        subject.setSubjectId(id);
	        hibernateUtil.delete(subject);
	    }
	    
	    @Override
	    public List<Subject> getAllSubjects() {        
	        return hibernateUtil.fetchAll(Subject.class);
	    }
	    
	    @Override
	    public Subject getSubject(long id) {
	        return hibernateUtil.fetchById(id, Subject.class);
	    }

		@Override
		public List<Subject> getAllSubjects(String subjectName) {
			// TODO Auto-generated method stub
			return null;
      }
		 @Override
	    public long createCourse(Course course) {        
	        return (Long) hibernateUtil.create(course);
	    }
            
             @SuppressWarnings("unchecked")
		@Override
		public List<Course> getAllCoursebysubject(long subjectId) {
			// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
	    	Query query = session.createQuery("FROM Course WHERE SUBJECT=:subjectId");
	    	query.setParameter("subjectId",subjectId);
	    	
	    	return query.list();
		}
	/**************************** End Of Branch *********************************/ 
	 
	 
	/**************************** Batch Timing *********************************/
	
	@Override
	public int addBatchTiming(BatchTime batchTime) {
		return (Integer) hibernateUtil.create(batchTime);
	}

	@Override
	public void deleteBatchTime(int id) {
		BatchTime batchTime = new BatchTime();
		batchTime.setBatchTimeId(id);
        hibernateUtil.delete(batchTime);
	}

	@Override
	public List<BatchTime> getAllBatchTiming() {
		return hibernateUtil.fetchAll(BatchTime.class);
	}

	@Override
	public BatchTime getBatchTime(int id) {
		return hibernateUtil.fetchById(id, BatchTime.class);
	}
	
	/**************************** End Of Batch Timing *********************************/
	
        
        
         
	
        
/**************************** Branch *********************************/
	
	@Override
	public int addBranch(Branch branch) {
		return (Integer) hibernateUtil.create(branch);
	}

	@Override
	public void deleteBranch(int id) {
		Branch branch = new Branch();
		branch.setBranchId(id);
        hibernateUtil.delete(branch);
	}

	@Override
	public List<Branch> getAllBranchs() {
		return hibernateUtil.fetchAll(Branch.class);
	}

	@Override
	public Branch getBranch(int id) {
		return hibernateUtil.fetchById(id, Branch.class);
	}
	
/**************************** End Of Branch *********************************/
	
/**************************** Instrument *********************************/
	
	@Override
	public int addInstrument(Instrument instrument) {
		return (Integer) hibernateUtil.create(instrument);
	}

	@Override
	public void deleteInstrument(int id) {
		Instrument instrument = new Instrument();
		instrument.setInstrumentId(id);
        hibernateUtil.delete(instrument);
	}

	@Override
	public List<Instrument> getAllInstruments() {
		return hibernateUtil.fetchAll(Instrument.class);
	}

	@Override
	public Instrument getInstrument(int id) {
		return hibernateUtil.fetchById(id, Instrument.class);
	}

	 @Override
	    public Instrument updateInstrument(Instrument instrument) {        
	        return hibernateUtil.update(instrument);
	    }
	
/**************************** End Of Instrument *********************************/
	
	
	
	
/**************************** Add Instrument Subcategory  *********************************/
	
	@Override
	public long addInstrumentSubcategory(InstrumentSubcategory instrumentSubcategory) {
		return (long) hibernateUtil.create(instrumentSubcategory);
	}

	@Override
	public void deleteInstrumentSubcategory(int id) {
		InstrumentSubcategory instrumentSubcategory = new InstrumentSubcategory();
		instrumentSubcategory.setInstrumentSubcategoryId(id);
        hibernateUtil.delete(instrumentSubcategory);
	}

	@Override
	public List<InstrumentSubcategory> getAllInstrumentSubcategorys() {
		return hibernateUtil.fetchAll(InstrumentSubcategory.class);
	}

	@Override
	public InstrumentSubcategory getInstrumentSubcategory(long id) {
		return hibernateUtil.fetchById(id, InstrumentSubcategory.class);
	}

	  
    @SuppressWarnings("unchecked")
@Override
public List<InstrumentSubcategory> getAllInstrumentSubcategorybyinstrumentid(int instrumentId) {
	// TODO Auto-generated method stub
Session session = sessionFactory.getCurrentSession();
	Query query = session.createQuery("FROM InstrumentSubcategory WHERE INSTRUMENT=:instrumentId");
	query.setParameter("instrumentId",instrumentId);
	
	return query.list();
}
	 @Override
	    public InstrumentSubcategory updateInstrumentSubcategory(InstrumentSubcategory instrumentSubcategory) {        
	        return hibernateUtil.update(instrumentSubcategory);
	    }
/**************************** End Of Add Instrument Subcategory  *********************************/
	
/**************************** Product *********************************/
	
	@Override
	public int addProduct(Product product) {
		return (Integer) hibernateUtil.create(product);
	}

	@Override
	public void deleteProduct(int id) {
		Product product = new Product();
		product.setProductId(id);
        hibernateUtil.delete(product);
	}

	@Override
	public List<Product> getAllProducts() {
		return hibernateUtil.fetchAll(Product.class);
	}

	@Override
	public Product getProduct(int id) {
		return hibernateUtil.fetchById(id, Product.class);
	}

	 @Override
	    public Product updateProduct(Product product) {        
	        return hibernateUtil.update(product);
	    }
	
	  @SuppressWarnings("unchecked")
			@Override
			public int lastProductId() {
				// TODO Auto-generated method stub
			Session session = sessionFactory.getCurrentSession();
		    	Query query = session.createQuery("SELECT MAX(productId) FROM Product");
		    	
		    	int productId = (int) query.uniqueResult();
		    	return productId;
			}
/**************************** End Of Product *********************************/
	
	 
	 
	 /**************************** Purchase *********************************/
		
		@Override
		public int addPurchase(Purchase purchase) {
			return (Integer) hibernateUtil.create(purchase);
		}

		@Override
		public void deletePurchase(int id) {
			Purchase purchase = new Purchase();
			purchase.setPurchaseId(id);
	        hibernateUtil.delete(purchase);
		}

		@Override
		public List<Purchase> getAllPurchases() {
			return hibernateUtil.fetchAll(Purchase.class);
		}

		@Override
		public Purchase getPurchase(int id) {
			return hibernateUtil.fetchById(id, Purchase.class);
		}

		 @Override
		    public Purchase updatePurchase(Purchase purchase) {        
		        return hibernateUtil.update(purchase);
		    }
		
	/**************************** End Of Product *********************************/
		
	
/**************************** Gallery *********************************/
	@Override
	public int addPhotoVideo(PhotosVideos photosVideo) {
		// TODO Auto-generated method stub
		return (int) hibernateUtil.create(photosVideo);
	}

	@Override
	public void deletePhotosVideo(int id) {
		// TODO Auto-generated method stub
		PhotosVideos photosVideo = new PhotosVideos();
		photosVideo.setGalleryId(id);
        hibernateUtil.delete(photosVideo);
	}

	@Override
	public List<PhotosVideos> getAllphotosVideos() {
		// TODO Auto-generated method stub
		return hibernateUtil.fetchAll(PhotosVideos.class);
	}

	@Override
	public PhotosVideos getPhotosVideo(int id) {
		// TODO Auto-generated method stub
		return hibernateUtil.fetchById(id, PhotosVideos.class);
	}

	
	
	
/**************************** End Of Gallery *********************************/
	
/**************************** Event *********************************/
	@Override
	public long addEvent(Event event) {
		// TODO Auto-generated method stub
		return (long) hibernateUtil.create(event);
	}

	@Override
	public void deleteEvent(long id) {
		// TODO Auto-generated method stub
		Event event = new Event();
		event.setEventId(id);
		hibernateUtil.delete(event);
	}

	@Override
	public List<Event> getAllEvents() {
		// TODO Auto-generated method stub
		return hibernateUtil.fetchAll(Event.class);
	}

	@Override
	public Event getEvent(long id) {
		// TODO Auto-generated method stub
		return hibernateUtil.fetchById(id, Event.class);
	}

	
	
/**************************** End Of Event *********************************/
	
	/**************************** Exam  *********************************/

	@Override
	public long addExam(Exam exam) {
		// TODO Auto-generated method stub
		return (long) hibernateUtil.create(exam);
	}

	@Override
	public void deleteExam(long id) {
		// TODO Auto-generated method stub
		Exam exam = new Exam();
		exam.setExamId(id);
		hibernateUtil.delete(exam);
	}

	@Override
	public List<Exam> getAllExams() {
		// TODO Auto-generated method stub
		return hibernateUtil.fetchAll(Exam.class);
	}

	@Override
	public Exam getExam(long id) {
		// TODO Auto-generated method stub
		return hibernateUtil.fetchById(id, Exam.class);
	}
/**************************** End Of Exam  *********************************/

/**************************** By Query *********************************/

	@Override
	public <T> List<T> getCustomizedListOfEntity(String query) {
		// TODO Auto-generated method stub
		return hibernateUtil.getRecords(query);
	}

	@Override
	public <T> T getCustomizedEntity(String query) {
		// TODO Auto-generated method stub
		return hibernateUtil.getRecord(query);
	}

/**************************** End Of By Query *********************************/

}
