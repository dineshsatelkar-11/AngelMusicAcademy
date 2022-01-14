 package com.angel.musicacademy;

import org.jboss.logging.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.text.DateFormatSymbols;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.angel.musicacademy.model.Event;
import com.angel.musicacademy.model.EventApplication;
import com.angel.musicacademy.model.Exam;
import com.angel.musicacademy.model.ExamApplication;
import com.angel.musicacademy.model.Instrument;
import com.angel.musicacademy.model.PhotosVideos;
import com.angel.musicacademy.model.User;
import com.angel.musicacademy.service.AdminService;
import com.angel.musicacademy.service.DynamicGenerator;
import com.angel.musicacademy.service.UserService;
import com.angel.musicacademy.util.Cons;
import javax.servlet.http.HttpSession;

@Controller
public class UserController {
    
    private static final Logger logger = Logger.getLogger(UserController.class);

      @Autowired 
    private HttpSession httpSession; 
    @Autowired
    private UserService userService;

    @Autowired
    private AdminService adminService;
 
    @Autowired
    private DynamicGenerator dynamicGenerator;
    
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        sdf.setLenient(true);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
    }
    

	private static BufferedImage resizeImage(BufferedImage originalImage, int type, int IMG_WIDTH, int IMG_HEIGHT){
    	BufferedImage resizedImage = new BufferedImage(IMG_WIDTH, IMG_HEIGHT, type);
    	Graphics2D g = resizedImage.createGraphics();
    	g.drawImage(originalImage, 0, 0, IMG_WIDTH, IMG_HEIGHT, null);
    	g.dispose();

    	return resizedImage;
    }
	 /*******************USER Module****************************************************/
      
	
	@RequestMapping(value="userLogout", method = RequestMethod.GET)
    public ModelAndView getUserLogout()
    {           
             
             
		httpSession.removeAttribute("User_Login");
		httpSession.invalidate();
		return new ModelAndView("redirect:index");
    } 
	@RequestMapping("list")
    public ModelAndView getList() {
        
        String list = dynamicGenerator.jrNoGenerator();
        return new ModelAndView("test","list",list);
    }
	
    
    @RequestMapping(value="userLogin", method = RequestMethod.GET)
    public ModelAndView getUserLoginPage(@ModelAttribute User user)
    {
        return new ModelAndView("user/userLogin");
    }
    
	@RequestMapping(value = "authonticateUser", method = RequestMethod.POST)
    public ModelAndView authonticateUser(@ModelAttribute User user) {
        logger.info("Authonticating User: "+user.getUserEmail());
        user = userService.getUserByUserEmailAndPassword(user);
        String msg = "Invalid Credentials...!!!";
        
       
        if(user!=null)
        	{
        	
        		 logger.info("Authonticating User: "+user.getUserEmail());
        		 httpSession.setAttribute("User_Login", user);
             	List<Instrument> instruments = adminService.getAllInstruments();
      	        ModelAndView modelAndView = new ModelAndView("user/userHome");
      	        modelAndView.addObject("instruments",instruments);
      	        List<Event> events = adminService.getAllEvents();
      	        modelAndView.addObject("events",events);
      		return modelAndView;
                }
        else
        	return new ModelAndView("user/userLogin","msg",msg);
    }
	
    @RequestMapping("createUser")
    public ModelAndView createUser(@ModelAttribute User user) {
        logger.info("Creating User. Data: "+user);
        return new ModelAndView("userForm");
    }
    
    @RequestMapping("registerUser")
    public ModelAndView getUserRegistration(@ModelAttribute User user) {
        logger.info("Getting User Registration page");
        ModelAndView modelAndView = new ModelAndView("user/userRegistration");
        modelAndView.addObject("branchs",adminService.getAllBranch());
        modelAndView.addObject("days",initDaysList());
        modelAndView.addObject("subjects",adminService.getAllSubjects());
        modelAndView.addObject("time",adminService.getAllBatchTiming());
        return modelAndView;
    }
    
    @RequestMapping(value = {"index", "/"})
    public ModelAndView index(HttpServletRequest request) {
    	String rootPath = request.getSession().getServletContext().getRealPath("/");
        logger.info("Getting index page rootPath: "+rootPath);
//        List<Instrument> instruments = adminService.getAllInstruments();
        ModelAndView modelAndView = new ModelAndView("index");
//        modelAndView.addObject("instruments",instruments);
//        List<Event> events = adminService.getAllEvents();
//        modelAndView.addObject("events",events);
        
        return modelAndView;
    }
    
    @RequestMapping("editUser")
    public ModelAndView editUser(@RequestParam long id, @ModelAttribute User user) {
        logger.info("Updating the User for the Id "+id);
        user = userService.getUser(id);
        return new ModelAndView("userForm", "userObject", user);
    }
    
    @RequestMapping(value = "addUser", method = RequestMethod.POST)
    public ModelAndView saveUser(@ModelAttribute User user) {
        logger.info("Saving the User. Data : "+user);
        if(user.getUserId() == 0){ // if user id is 0 then creating the user other updating the user
             user.setAdmissionMode(Cons.STUDENT_ADMISSION_ONLINE);
            userService.createUser(user);
           
        } else {
                       userService.updateUser(user);
           
        }
        return new ModelAndView("index");
    }
    
     @RequestMapping(value = "addUserOffline", method = RequestMethod.POST)
    public ModelAndView saveUserOffline(@ModelAttribute User user) {
        logger.info("Saving the User. Data : "+user);
        if(user.getUserId() == 0){ // if user id is 0 then creating the user other updating the user
            user.setAdmissionMode(Cons.STUDENT_ADMISSION_OFFLINE);
            userService.createUser(user);
           
        } else {
                     userService.updateUser(user);
           
        }
        return new ModelAndView("branchReception/inquiry");
    }
    
    @RequestMapping("deleteUser")
    public ModelAndView deleteUser(@RequestParam long id) {
        logger.info("Deleting the User. Id : "+id);
        userService.deleteUser(id);
        return new ModelAndView("redirect:getAllUsers");
    }
    
    @RequestMapping("getAllUsers")
    public ModelAndView getAllUsers() {
        logger.info("Getting the all Users.");
        List<User> userList = userService.getAllUsers();
       
        return new ModelAndView("userList", "userList", userList);
    }
    
    @RequestMapping("searchUser")
    public ModelAndView searchUser(@RequestParam("searchName") String searchName) {  
        logger.info("Searching the User. User Names: "+searchName);
        List<User> userList = userService.getAllUsers(searchName);
        return new ModelAndView("userList", "userList", userList);      
    }

    private List<String> initDaysList() {
        List<String> daysList = new ArrayList<String>();
               daysList.addAll(Arrays.asList(new DateFormatSymbols().getWeekdays()));
               daysList.remove("Sunday");
               daysList.remove(0);
    	 return daysList;
    }
    
   
    /*******************EVENT Module****************************************************/
  
    @RequestMapping(value = "events",method=RequestMethod.GET)
    public ModelAndView getAllEvents() {  
        logger.info("Getting All Events");
        List<Event> events = adminService.getAllEvents();
        return new ModelAndView("events", "events", events);      
    }
    
    @RequestMapping(value = "applyForEvent/{eventId}", method=RequestMethod.GET)
    public ModelAndView getEventApplicationForm(@ModelAttribute Event event,@PathVariable("eventId") long eventId)
    {
        logger.info("Getting Event Application Form For Event ID "+eventId);
        event = adminService.getEvent(eventId);
        if(event==null)
        	return new ModelAndView("events","msg","Invalid Event...!!!");
        
        ModelAndView modelAndView = new ModelAndView("user/eventApplicationForm");
        modelAndView.addObject("event",event);
        List<String> ageCategories = Arrays.asList(event.getEventAgeCategory().split(","));
        modelAndView.addObject("ageCategories",ageCategories);
        Map<String,List<String>> subs = new HashMap<String,List<String>>();
        List<String> voice = new ArrayList<String>();
        voice.add("VOICE-1");
        voice.add("VOICE-2");
        List<String> winds = new ArrayList<String>();
        winds.add("WINDS-1");
        winds.add("WINDS-2");
        subs.put("voice", voice);
        subs.put("winds", winds);
        modelAndView.addObject("subs",subs);
        modelAndView.addObject("eventApplication",new EventApplication());
        return modelAndView;      
    }
    
    @RequestMapping(value = "saveEventApplication", method = RequestMethod.POST)
    public ModelAndView saveEventApplication(@ModelAttribute EventApplication eventApplication,@RequestParam long eventID,@RequestParam("applicantPhoto") MultipartFile file, HttpServletRequest request) throws IOException{
    	if (!file.isEmpty()) {

            try{
            	 String rootPath = request.getSession().getServletContext().getRealPath("/");
                 File dir = new File(rootPath + File.separator + "eventapplicantphotos");
                 if (!dir.exists()) {
                     dir.mkdirs();
                 }
               	 
                 File destination = new File(dir.getAbsolutePath() + File.separator + file.getOriginalFilename());
	     	       	logger.info("Uploaded Photo Path is : "+destination.getPath()); 
	     	     BufferedImage originalImage = ImageIO.read(new ByteArrayInputStream(file.getBytes()));
     			 int type = originalImage.getType() == 0? BufferedImage.TYPE_INT_ARGB : originalImage.getType();

     			 BufferedImage resizeImagePng = resizeImage(originalImage, type, 257, 257);
     			 ImageIO.write(resizeImagePng, "png", destination);
                 
                
    			 
    	       	 eventApplication.setApplicantPhotoName(file.getOriginalFilename());	
        		}catch(Exception exception)
        		{
        			exception.printStackTrace();
        		}
           	
        	}
        User user = (User) httpSession.getAttribute("User_Login");
          logger.info("user:  "+user);
    	 String eventNo = dynamicGenerator.eventNoGenerator();
    	 eventApplication.setEventNo(eventNo);
         eventApplication.setUser(user);
       eventApplication.setEvent(adminService.getEvent(eventID));
       logger.info("Saving the Event Application By:  "+eventApplication.getApplicantName());
       userService.addEventApplication(eventApplication);
     
       ModelAndView modelAndView = new ModelAndView("user/events");
      
       
     
        modelAndView.addObject("eventno", eventNo);
       return modelAndView;  
     
       
      
    }
    
    @RequestMapping(value = "EventHallTicketPrint/{eventno}", method = RequestMethod.GET)
    public ModelAndView getEventHallPrint(@ModelAttribute User value, @PathVariable("eventno") String eventno) {
        User user = (User) httpSession.getAttribute("User_Login");
        EventApplication eventApplication = userService.getUserForApplyEvent(eventno);
       

        ModelAndView modelAndView = new ModelAndView("user/EventHallTicketPrint");
        modelAndView.addObject("user", user);
         modelAndView.addObject("eventApplication", eventApplication);
        return modelAndView;
    }
    
    /*******************EXAM Module****************************************************/
    
    
    @RequestMapping(value = "getExamForm/{examID}", method=RequestMethod.GET)
    public ModelAndView getExamForm(@PathVariable("examID") long examID)
    {
    	User user = (User) httpSession.getAttribute("User_Login");
        logger.info("Getting Exam Application Form For User : "+user.getUserName());
        Exam exam = adminService.getExam(examID);
               
        ModelAndView modelAndView = new ModelAndView("user/examForm");
        modelAndView.addObject("examApplication",new ExamApplication());
        modelAndView.addObject("user",user);
        modelAndView.addObject("exam",exam);
        
        return modelAndView;      
    }
    
    @RequestMapping(value = "saveExamApplicationForm", method=RequestMethod.POST)
    public ModelAndView saveExamApplicationForm(@ModelAttribute ExamApplication examApplication,@RequestParam("examID") long examID,@RequestParam("userID") long userID)
    {
    	User user = userService.getUser(userID);
        logger.info("Saving Exam Application Form For User : "+user.getUserName());
        Exam exam = adminService.getExam(examID);
        String newJrNo = dynamicGenerator.examNoGenerator();
        examApplication.setUser(user);
        examApplication.setExam(exam);
        examApplication.setExamno(newJrNo);
        userService.addExamApplication(examApplication);       
        ModelAndView modelAndView = new ModelAndView("user/exams");
        List<ExamApplication> examApplications = userService.getAllExamApplications();
        modelAndView.addObject("examApplications",examApplications);
         modelAndView.addObject("examno", newJrNo);
        return modelAndView;      
    }
    
  
     @RequestMapping(value = "ExamHallTicketPrint/{examno}", method = RequestMethod.GET)
    public ModelAndView getAdmissionPrint(@ModelAttribute User value, @PathVariable("examno") String examno) {
        User user = (User) httpSession.getAttribute("User_Login");
        ExamApplication examApplication = userService.getUserForApplyExam(examno);
       

        ModelAndView modelAndView = new ModelAndView("user/ExamHallTicketPrint");
        modelAndView.addObject("user", user);
         modelAndView.addObject("examApplication", examApplication);
        return modelAndView;
    }
     
     
   
    
    
    @RequestMapping(value="exams", method = RequestMethod.GET)
    public ModelAndView getExams()
    {
		List<Exam> exams = adminService.getAllExams();
		ModelAndView modelAndView = new ModelAndView("user/exams");
		modelAndView.addObject("exams",exams);
		List<ExamApplication> examApplications = userService.getAllExamApplications();
        modelAndView.addObject("examApplications",examApplications);
		return modelAndView;
    } 
    
    
    
    
    /************************************************** Static Pages **********************************************************/
    
	    @RequestMapping(value = "contactus", method=RequestMethod.GET)
	    public String contactUs()
	    {
	    	return "contactus";      
	    }
	    
	    @RequestMapping(value = "gallery",method=RequestMethod.GET)
	    public ModelAndView gallery() {
	        List<PhotosVideos> photosVideos = adminService.getAllphotosVideos();
	        return new ModelAndView("gallery","photosVideos",photosVideos);
	     }
	    
	 
	    
	    @RequestMapping(value = "aboutus", method=RequestMethod.GET)
	    public String aboutUs()
	    {
	    	return "aboutus";      
	    }
	    
	    @RequestMapping(value = "products",method=RequestMethod.GET)
	    public ModelAndView getAllProducts() {  
	        List<Instrument> instruments = adminService.getAllInstruments();
	        return new ModelAndView("products", "instruments", instruments);      
	    }
    /************************************************** End Of Static Pages **********************************************************/
}