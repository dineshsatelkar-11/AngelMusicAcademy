package com.angel.musicacademy;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.angel.musicacademy.model.Admin;
import com.angel.musicacademy.model.Product;
import com.angel.musicacademy.model.Rent;
import com.angel.musicacademy.model.Repair;
import com.angel.musicacademy.model.Sell;
import com.angel.musicacademy.model.User;
import com.angel.musicacademy.service.AdminService;
import com.angel.musicacademy.service.DynamicGenerator;
import com.angel.musicacademy.service.ReceptionService;
import com.angel.musicacademy.service.UserService;
import com.angel.musicacademy.util.Cons;



@Controller
public class ReceptionController {
	  private static final Logger logger = Logger.getLogger(UserController.class);

	    @Autowired
	    private AdminService adminService;
	    
	    @Autowired
	    private UserService userService;
	    
	    @Autowired
	    private ReceptionService receptionService;

	    @Autowired
	    ServletContext context;

	    @Autowired
	    private DynamicGenerator dynamicGenerator;
	    
	    @Autowired
	    private HttpSession httpSession;

	    @InitBinder
	    public void initBinder(WebDataBinder binder) {
	        SimpleDateFormat sdf = new SimpleDateFormat("DD-MMMM-YYYY hh:mm aa");
	        sdf.setLenient(true);
	        binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
	    }

	    private static BufferedImage resizeImage(BufferedImage originalImage, int type, int IMG_WIDTH, int IMG_HEIGHT) {
	        BufferedImage resizedImage = new BufferedImage(IMG_WIDTH, IMG_HEIGHT, type);
	        Graphics2D g = resizedImage.createGraphics();
	        g.drawImage(originalImage, 0, 0, IMG_WIDTH, IMG_HEIGHT, null);
	        g.dispose();

	        return resizedImage;
	    }
	    /**************************** Repair *********************************/
	@RequestMapping(value = "addInstrumentRepair", method = RequestMethod.POST)
	    public ModelAndView saveInstrumentRepair(@ModelAttribute Repair repair) {
	        logger.info("Saving the Sell Data : "+repair);
	        String newSellNo=dynamicGenerator.repairNoGenerator();
	        repair.setRepairNo(newSellNo);
	        receptionService.addRepair(repair);
	  
	        ModelAndView modelAndView = new ModelAndView("branchReception/repairWork");
	        modelAndView.addObject("repairNo", newSellNo);
	         modelAndView.addObject("instruments", adminService.getAllInstruments());
	        modelAndView.addObject("repair", repair);
	         return modelAndView;     
	    }
	
	 @RequestMapping(value = "RepairPrint/{repairNo}", method=RequestMethod.GET)
	    public ModelAndView InstrumentRepairPrint(@ModelAttribute Repair value,@PathVariable("repairNo") String repairNo)
	    {
	    	
	        logger.info("Getting Instrument Sell form : "+repairNo);
	        Repair repair = receptionService.getRepair(repairNo);
	               
	        ModelAndView modelAndView = new ModelAndView("branchReception/repairPrint");
	      
	        modelAndView.addObject("repair",repair);
	        
	        return modelAndView;      
	    }
	 
	 
	  @RequestMapping("repairing")
	    public ModelAndView getInstrumentRepairing(@ModelAttribute Repair repair) {
	        logger.info("Getting Instrument Sell page");
	        ModelAndView modelAndView = new ModelAndView("branchReception/repairWork");
	        modelAndView.addObject("instruments", adminService.getAllInstruments());
	        modelAndView.addObject("repair", repair);
	        return modelAndView;
	    }
	  
	  @RequestMapping(value = "viewRepair", method = RequestMethod.GET)
	    public ModelAndView getviewRepair() {
	        List<Repair> repairList = receptionService.getAllRepair();
	        Admin branch_admin = (Admin) httpSession.getAttribute("BRANCH_ADMIN");
	        
	        ModelAndView modelAndView = new ModelAndView("branchReception/viewRepair");
	        modelAndView.addObject("repairList", repairList);
	       
	        return modelAndView;

	    }

	  @RequestMapping(value = "viewRepairBranch", method = RequestMethod.GET)
	    public ModelAndView getviewRepairBranch() {
	        List<Repair> repairList = receptionService.getAllRepair();
	        Admin branch_admin = (Admin) httpSession.getAttribute("BRANCH_ADMIN");
	        
	        ModelAndView modelAndView = new ModelAndView("branchAdmin/viewRepair");
	        modelAndView.addObject("repairList", repairList);
	       
	        return modelAndView;

	    }
	    
	  /**************************** End of Repair *********************************/

	  
	  /**************************** Rent *********************************/

	  @RequestMapping("rent")
	    public ModelAndView getInstrumentRent(@ModelAttribute Rent rent) {
	        logger.info("Getting Instrument Rent page");
	        ModelAndView modelAndView = new ModelAndView("branchReception/instrumentRent");
	        modelAndView.addObject("instruments", adminService.getAllInstruments());
	        modelAndView.addObject("rent", rent);
	        return modelAndView;
	    }
	    
	      @RequestMapping(value = "addInstrumentRent", method = RequestMethod.POST)
	    public ModelAndView addInstrumentRent(@ModelAttribute Rent rent) {
	        logger.info("Saving the Rent Data : "+rent);
	        String newRentNo=dynamicGenerator.rentNoGenerator();
	        rent.setRentNo(newRentNo);
	        receptionService.createInstrumentRent(rent);
	  
	        ModelAndView modelAndView = new ModelAndView("branchReception/instrumentRent");
	        modelAndView.addObject("rentno", newRentNo);
	         return modelAndView;     
	    }
	     @RequestMapping(value = "InstrumentRentPrint/{rentno}", method=RequestMethod.GET)
	    public ModelAndView InstrumentRentPrint(@ModelAttribute Rent value,@PathVariable("rentno") String rentno)
	    {
	    	
	        logger.info("Getting Instrument Sell form : "+rentno);
	        Rent rent = receptionService.getRent(rentno);
	               
	        ModelAndView modelAndView = new ModelAndView("branchReception/instrumentRentPrint");
	      
	        modelAndView.addObject("rent",rent);
	        
	        return modelAndView;      
	    }
	     
	     @RequestMapping(value = "viewRent", method = RequestMethod.GET)
		    public ModelAndView getviewRent() {
		        List<Rent> rentList = receptionService.getAllRent();
		        Admin branch_admin = (Admin) httpSession.getAttribute("BRANCH_ADMIN");
		        
		        ModelAndView modelAndView = new ModelAndView("branchReception/viewRent");
		        modelAndView.addObject("rentList", rentList);
		       
		        return modelAndView;

		    }
	     
	     @RequestMapping(value = "viewRentBranch", method = RequestMethod.GET)
		    public ModelAndView getviewRentBranch() {
		        List<Rent> rentList = receptionService.getAllRent();
		        Admin branch_admin = (Admin) httpSession.getAttribute("BRANCH_ADMIN");
		        
		        ModelAndView modelAndView = new ModelAndView("branchAdmin/viewRent");
		        modelAndView.addObject("rentList", rentList);
		       
		        return modelAndView;

		    }
		  /**************************** End of Rent *********************************/

		  /**************************** Sell *********************************/

	     @RequestMapping("sell")
	     public ModelAndView getInstrumentSell(@ModelAttribute Sell sell) {
	         logger.info("Getting Instrument Sell page");
	         ModelAndView modelAndView = new ModelAndView("branchReception/instrumentSell");
	         modelAndView.addObject("instruments", adminService.getAllInstruments());
	         modelAndView.addObject("prod", adminService.getAllProducts());
	         modelAndView.addObject("sell", sell);
	         return modelAndView;
	     }
	     
	       @RequestMapping(value = "addInstrumentSell", method = RequestMethod.POST)
	     public ModelAndView saveInstrumentSell(@ModelAttribute Sell sell) {
	         logger.info("Saving the Sell Data : "+sell);
	         Product prd=sell.getProductId();
	    	   int id=prd.getProductId();
	    	   int quantity1=sell.getQuentity();
	    	  Product productt=adminService.getProduct(id);
	    	  float sellPrice=productt.getSellPrice();
	    	  int quantity2=productt.getQuentity();
	    	  int quant=(int)quantity2-(int)quantity1;
	    	  productt.setQuentity(quant);
	         String newSellNo=dynamicGenerator.sellNoGenerator();
	         sell.setSellNo(newSellNo);
	         sell.setSellPrice(sellPrice);
	         receptionService.createInstrumentSell(sell);
	         adminService.updateProduct(productt);
	         ModelAndView modelAndView = new ModelAndView("branchReception/instrumentSell");
	         modelAndView.addObject("sellno", newSellNo);
	         modelAndView.addObject("prod", adminService.getAllProducts());
	         modelAndView.addObject("sell", sell);

	          return modelAndView;     
	     }
	     
	     
	     @RequestMapping(value = "InstrumentSellPrint/{sellno}", method=RequestMethod.GET)
	     public ModelAndView InstrumentSellPrint(@ModelAttribute Sell value,@PathVariable("sellno") String sellno)
	     {
	     	
	         logger.info("Getting Instrument Sell form : "+sellno);
	         Sell sell = receptionService.getSell(sellno);
	                
	         ModelAndView modelAndView = new ModelAndView("branchReception/instrumentSellPrint");
	       
	         modelAndView.addObject("sell",sell);
	         
	         return modelAndView;      
	     }
	     
	     @RequestMapping(value = "viewSell", method = RequestMethod.GET)
		    public ModelAndView getviewSell() {
		        List<Sell> sellList = receptionService.getAllSell();
		        Admin branch_admin = (Admin) httpSession.getAttribute("BRANCH_ADMIN");
		        
		        ModelAndView modelAndView = new ModelAndView("branchReception/viewSell");
		        modelAndView.addObject("sellList", sellList);
		       
		        return modelAndView;

		    }
	     
	     @RequestMapping(value = "viewSellBranch", method = RequestMethod.GET)
		    public ModelAndView getviewSellBranch() {
		        List<Sell> sellList = receptionService.getAllSell();
		        Admin branch_admin = (Admin) httpSession.getAttribute("BRANCH_ADMIN");
		        
		        ModelAndView modelAndView = new ModelAndView("branchAdmin/viewSell");
		        modelAndView.addObject("sellList", sellList);
		       
		        return modelAndView;

		    }
		  /**************************** End of Sell *********************************/

		  /**************************** Admission Approval *********************************/
	    
	     @RequestMapping(value = "newAdmission", method = RequestMethod.GET)
	     public ModelAndView getnewAdmissions() {
	         List<User> userList = userService.getAllWatingUsers();
	         Admin branch_admin = (Admin) httpSession.getAttribute("BRANCH_RECEPTION");
	         if (branch_admin.getAdminOfBranch() != null) {
	             userList = userService.getAllWatingUsersByBranch(branch_admin.getAdminOfBranch());
	         }
	         ModelAndView modelAndView = new ModelAndView("branchReception/newAdmissions");
	         modelAndView.addObject("userList", userList);
	         if (branch_admin.getAdminOfBranch() == null) {
	             modelAndView.addObject("headerFile", "../comman_files/adminHeaderFile.jsp");
	         } else {
	             modelAndView.addObject("headerFile", "../comman_files/branchReceptionHeader.jsp");
	         }

	         return modelAndView;

	     }

	     @RequestMapping(value = "newAdmissionApproval/{userID}", method = RequestMethod.GET)
	     public ModelAndView getAdmissionDetails(@PathVariable("userID") long userID) {
	         Admin branch_reception = (Admin) httpSession.getAttribute("BRANCH_RECEPTION");
	         User user = userService.getUser(userID);
	         ModelAndView modelAndView = new ModelAndView("branchReception/newAdmissionApproval");
	         if (branch_reception.getAdminOfBranch() == null) {
	             modelAndView.addObject("headerFile", "../comman_files/adminHeaderFile.jsp");
	         } else {
	             modelAndView.addObject("headerFile", "../comman_files/branchReceptionHeader.jsp");
	         }

	         String newJrNo = dynamicGenerator.jrNoGenerator();
	         user.setJrno(newJrNo);
	         modelAndView.addObject("user", user);

	         return modelAndView;
	     }
	     
	     @RequestMapping(value = "admissionPrintReception/{jrno}", method = RequestMethod.GET)
	     public ModelAndView getAdmissionPrint(@ModelAttribute User value, @PathVariable("jrno") long jrno) {
	         Admin branch_reception = (Admin) httpSession.getAttribute("BRANCH_RECEPTION");
	         User user = userService.getUser(jrno);
	         if (branch_reception == null) {
	             return new ModelAndView("admin/adminLogin");
	         }

	         ModelAndView modelAndView = new ModelAndView("branchReception/admissionPrintReception");
	         modelAndView.addObject("user", user);
	         return modelAndView;
	     }
	     @RequestMapping("allUser")
	     public ModelAndView getAllUsers() {

	         List<User> userList = userService.getAllActiveUsers();
	         Admin branch_reception = (Admin) httpSession.getAttribute("BRANCH_RECEPTION");
	         logger.info("admin " + branch_reception.getAdminName());
	         if (branch_reception.getAdminOfBranch() != null) {
	             userList = userService.getAllActiveUsersByBranch(branch_reception.getAdminOfBranch());
	         }

	         ModelAndView modelAndView = new ModelAndView("admin/allUsers");

	         if (branch_reception.getAdminOfBranch() == null) {
	             modelAndView.addObject("headerFile", "../comman_files/adminHeaderFile.jsp");
	         } else {
	             modelAndView.addObject("headerFile", "../comman_files/branchReceptionHeader.jsp");
	         }

	         modelAndView.addObject("userList", userList);
	         return modelAndView;
	     }
	     @RequestMapping(value = "confirmAdmissionReception", method = RequestMethod.POST)
	     public ModelAndView confirmAdmissionReception(
	             @ModelAttribute User user,
	             @RequestParam(value = "d1", required = false) String d1,
	             @RequestParam(value = "d2", required = false) String d2
	     ) throws ParseException {
	         if (user.getSecondInstallment() > 0) {
	             user.setSecondInstallmentDate(new SimpleDateFormat("dd/MM/yyyy").parse(d1));
	         }
	         if (user.getLastInstallment() > 0) {
	             user.setLastInstallmentDate(new SimpleDateFormat("dd/MM/yyyy").parse(d2));
	         }

	         user.setFirstInstallmentDate(new Date());

	         User oldUser = userService.getUser(user.getUserId());
	         oldUser.setJrno(user.getJrno());
	         oldUser.setBalance(user.getBalance());
	         oldUser.setFirstInstallment(user.getFirstInstallment());
	         oldUser.setFirstInstallmentDate(new Date());
	         oldUser.setLastInstallment(user.getLastInstallment());
	         oldUser.setLastInstallmentDate(user.getLastInstallmentDate());
	         oldUser.setSecondInstallment(user.getSecondInstallment());
	         oldUser.setSecondInstallmentDate(user.getSecondInstallmentDate());
	         oldUser.setTotalFees(user.getTotalFees());
	         oldUser.setUserRegisteredDate(new Date());
	         oldUser.setStatus(Cons.STUDENT_STATUS_ACTIVE);
	         logger.info("User ID: " + oldUser.getUserId());

	         userService.updateUser(oldUser);

	         List<User> userList = userService.getAllWatingUsers();
	         Admin branch_reception = (Admin) httpSession.getAttribute("BRANCH_RECEPTION");
	         if (branch_reception.getAdminOfBranch() != null) {
	             userList = userService.getAllWatingUsersByBranch(branch_reception.getAdminOfBranch());
	         }
	         ModelAndView modelAndView = new ModelAndView("branchReception/newAdmissions");
	         modelAndView.addObject("userList", userList);
	         if (branch_reception.getAdminOfBranch() == null) {
	             modelAndView.addObject("headerFile", "../comman_files/adminHeaderFile.jsp");
	         } else {
	             modelAndView.addObject("headerFile", "../comman_files/branchReceptionHeader.jsp");
	         }
	         //send sms and mail
	         userService.sendAdmissionConfirmSMS(oldUser);
	         userService.sendAdmissionConfirmMail(oldUser);

	         modelAndView.addObject("jrno", oldUser.getUserId());
	         return modelAndView;
	     }
	     
		  /**************************** Admission Approval End*********************************/

}
