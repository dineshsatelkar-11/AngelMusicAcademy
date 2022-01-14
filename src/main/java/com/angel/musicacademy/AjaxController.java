/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.angel.musicacademy;



import com.angel.musicacademy.model.Course;
import com.angel.musicacademy.model.Instrument;
import com.angel.musicacademy.model.InstrumentSubcategory;
import com.angel.musicacademy.model.Product;
import com.angel.musicacademy.model.Purchase;
import com.angel.musicacademy.model.Sell;
import com.angel.musicacademy.model.User;
import com.angel.musicacademy.service.AdminService;
import com.angel.musicacademy.service.DynamicGenerator;
import com.angel.musicacademy.service.UserService;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("ajax")
public class AjaxController {

	 private static final Logger logger = Logger.getLogger(AjaxController.class);
	 @Autowired
    private HttpSession httpSession;

    @Autowired
    private UserService userService;

    @Autowired
    private AdminService adminService;

    @Autowired
    ServletContext context;

    @Autowired
    private DynamicGenerator dynamicGenerator;

	
         @SuppressWarnings("unchecked")
	@RequestMapping(value = "/listofcourse", method = RequestMethod.POST)
	public ModelAndView listofcourse(HttpSession session,@ModelAttribute User user ,@RequestParam("subjectId") long subjectId) 
	{
		 List<Course> courseList = adminService.getAllCoursebysubject(subjectId);

            ModelAndView modelAndView = new ModelAndView("branchReception/fetchcourse");
		 modelAndView.addObject("courseList",courseList);
                  modelAndView.addObject("userObject",user);
		 
		return modelAndView;
	}

         
         @SuppressWarnings({ "unchecked"})
     	@RequestMapping(value = "/listofsubcategory", method = RequestMethod.POST)
     	public ModelAndView listofsubcategory(HttpSession session,@ModelAttribute Product product ,@RequestParam("instrumentId") int instrumentId) 
     	{
        	 long idd=instrumentId;
        	  logger.info("Authonticating Admin2: " + instrumentId); 
     		 List<InstrumentSubcategory> inst = adminService.getAllInstrumentSubcategorybyinstrumentid(instrumentId);

                 ModelAndView modelAndView = new ModelAndView("admin/fetchsubcategory");
     		 modelAndView.addObject("instrumentSubcategory",inst);
                       modelAndView.addObject("product",product);
     		 
     		return modelAndView;
     	}
         
         
         @SuppressWarnings({ "unchecked"})
     	@RequestMapping(value = "/fetchproduct", method = RequestMethod.POST)
     	public ModelAndView fetchproduct(HttpSession session,@ModelAttribute Purchase  purchase ,@RequestParam("Productid") int Productid) 
     	{
        	 int idd=Productid;
        	  logger.info("Authonticating Admin2: " + Productid); 
        	  Product pd=adminService.getProduct(idd);
     		

                 ModelAndView modelAndView = new ModelAndView("admin/fetchProduct");
     		 
                       modelAndView.addObject("purchase",purchase);
                       modelAndView.addObject("pd",pd);
     		 
     		return modelAndView;
     	}
         
         @SuppressWarnings({ "unchecked"})
       	@RequestMapping(value = "/fetchsell", method = RequestMethod.POST)
       	public ModelAndView fetchsell(HttpSession session,@ModelAttribute Sell sell ,@RequestParam("Productid") int Productid) 
       	{
          	 int idd=Productid;
          	  logger.info("Authonticating Admin2: " + Productid); 
          	  Product pd=adminService.getProduct(idd);
       		

                   ModelAndView modelAndView = new ModelAndView("branchReception/fetchSell");
       		 
                         modelAndView.addObject("sell",sell);
                         modelAndView.addObject("pd",pd);
       		 
       		return modelAndView;
       	}
	 
	  
	

}
