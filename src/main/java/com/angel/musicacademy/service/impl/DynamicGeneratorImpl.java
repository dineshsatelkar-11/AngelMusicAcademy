package com.angel.musicacademy.service.impl;

import com.angel.musicacademy.service.AdminService;
import com.angel.musicacademy.service.DynamicGenerator;
import com.angel.musicacademy.service.ReceptionService;
import com.angel.musicacademy.service.UserService;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DynamicGeneratorImpl implements DynamicGenerator {

	@Autowired
    private UserService userService;
        @Autowired
    private AdminService adminService;
        @Autowired
        private ReceptionService receptionService;
        
	@Override
	public String passwordGenerator() {
		// TODO Auto-generated method stub
		Random r = new Random();
		int min = 100000;
		int max = 999999;
		return String.valueOf(r.nextInt((max - min) + 1) + min);
	}

	@Override
	public String jrNoGenerator() {
		// TODO Auto-generated method stub
		List<String> jrnos = userService.getAllExestingJRnumbers();
		List<Integer> intIDS = new ArrayList<Integer>();
       
        if(jrnos==null)
        {
            Random r = new Random();
            int Low = 111111;
            int High = 999999;
            int newID = r.nextInt(High-Low) + Low;
            String generatedId = "AMA-" + (newID);
            System.out.println("First Generated Id: " + generatedId);
            return generatedId;
        }
        else
        {
        	 for(String s:jrnos)
                 intIDS.add(Integer.parseInt(s.split("-")[1]));
        	 
            Boolean flag = Boolean.TRUE;
            String generatedId ="";
            while(flag)
            {
                Random r = new Random();
                int Low = 111111;
                int High = 999999;
                int newID = r.nextInt(High-Low) + Low;
                if(!intIDS.contains(newID))
                {
                    generatedId = "AMA-" + (newID);
                    System.out.println("Generated Id: " + generatedId);
                    flag = Boolean.FALSE;
                }
            }
        return generatedId;
        }
	}
     
	public String eventNoGenerator() {
		// TODO Auto-generated method stub
		List<String> eventNo = userService.getAllExestingJRnumbers();
		List<Integer> intIDS = new ArrayList<Integer>();
       
        if(eventNo==null)
        {
            Random r = new Random();
            int Low = 111111;
            int High = 999999;
            int newID = r.nextInt(High-Low) + Low;
            String generatedId = "AMAEV-" + (newID);
            System.out.println("First Generated Id: " + generatedId);
            return generatedId;
        }
        else
        {
        	 for(String s:eventNo)
                 intIDS.add(Integer.parseInt(s.split("-")[1]));
        	 
            Boolean flag = Boolean.TRUE;
            String generatedId ="";
            while(flag)
            {
                Random r = new Random();
                int Low = 111111;
                int High = 999999;
                int newID = r.nextInt(High-Low) + Low;
                if(!intIDS.contains(newID))
                {
                    generatedId = "AMAEV-" + (newID);
                    System.out.println("Generated Id: " + generatedId);
                    flag = Boolean.FALSE;
                }
            }
        return generatedId;
        }
	}
    
        @Override
	public String examNoGenerator() {
		// TODO Auto-generated method stub
		List<String> examnos = userService.getAllExestingExamnumbers();
		List<Integer> intIDS = new ArrayList<Integer>();
       
        if(examnos==null)
        {
            Random r = new Random();
            int Low = 111111;
            int High = 999999;
            int newID = r.nextInt(High-Low) + Low;
            String generatedId = "AMAEX-" + (newID);
            System.out.println("First Generated Id: " + generatedId);
            return generatedId;
        }
        else
        {
        	 for(String s:examnos)
                 intIDS.add(Integer.parseInt(s.split("-")[1]));
        	 
            Boolean flag = Boolean.TRUE;
            String generatedId ="";
            while(flag)
            {
                Random r = new Random();
                int Low = 111111;
                int High = 999999;
                int newID = r.nextInt(High-Low) + Low;
                if(!intIDS.contains(newID))
                {
                    generatedId = "AMAEX-" + (newID);
                    System.out.println("Generated Id: " + generatedId);
                    flag = Boolean.FALSE;
                }
            }
        return generatedId;
        }
	}
//Sell No Generator
        public String sellNoGenerator() {
		// TODO Auto-generated method stub
		List<String> sellNo = receptionService.getAllExistingSellnumbers();
		List<Integer> intIDS = new ArrayList<Integer>();
       
        if(sellNo==null)
        {
            Random r = new Random();
            int Low = 111111;
            int High = 999999;
            int newID = r.nextInt(High-Low) + Low;
            String generatedId = "AMASELL-" + (newID);
            System.out.println("First Generated Id: " + generatedId);
            return generatedId;
        }
        else
        {
        	 for(String s:sellNo)
                 intIDS.add(Integer.parseInt(s.split("-")[1]));
        	 
            Boolean flag = Boolean.TRUE;
            String generatedId ="";
            while(flag)
            {
                Random r = new Random();
                int Low = 111111;
                int High = 999999;
                int newID = r.nextInt(High-Low) + Low;
                if(!intIDS.contains(newID))
                {
                    generatedId = "AMASELL-" + (newID);
                    System.out.println("Generated Id: " + generatedId);
                    flag = Boolean.FALSE;
                }
            }
        return generatedId;
        }
	}
        
//Sell No Generator
        public String repairNoGenerator() {
		// TODO Auto-generated method stub
		List<String> repairNo = receptionService.getAllExistingRepairnumbers();
		List<Integer> intIDS = new ArrayList<Integer>();
       
        if(repairNo==null)
        {
            Random r = new Random();
            int Low = 111111;
            int High = 999999;
            int newID = r.nextInt(High-Low) + Low;
            String generatedId = "AMARE-" + (newID);
            System.out.println("First Generated Id: " + generatedId);
            return generatedId;
        }
        else
        {
        	 for(String s:repairNo)
                 intIDS.add(Integer.parseInt(s.split("-")[1]));
        	 
            Boolean flag = Boolean.TRUE;
            String generatedId ="";
            while(flag)
            {
                Random r = new Random();
                int Low = 111111;
                int High = 999999;
                int newID = r.nextInt(High-Low) + Low;
                if(!intIDS.contains(newID))
                {
                    generatedId = "AMARE-" + (newID);
                    System.out.println("Generated Id: " + generatedId);
                    flag = Boolean.FALSE;
                }
            }
        return generatedId;
        }
	}
        //Rent No Generator
        public String rentNoGenerator() {
    		// TODO Auto-generated method stub
    		List<String> rentNo = receptionService.getAllExistingRentnumbers();
    		List<Integer> intIDS = new ArrayList<Integer>();
           
            if(rentNo==null)
            {
                Random r = new Random();
                int Low = 111111;
                int High = 999999;
                int newID = r.nextInt(High-Low) + Low;
                String generatedId = "AMARENT-" + (newID);
                System.out.println("First Generated Id: " + generatedId);
                return generatedId;
            }
            else
            {
            	 for(String s:rentNo)
                     intIDS.add(Integer.parseInt(s.split("-")[1]));
            	 
                Boolean flag = Boolean.TRUE;
                String generatedId ="";
                while(flag)
                {
                    Random r = new Random();
                    int Low = 111111;
                    int High = 999999;
                    int newID = r.nextInt(High-Low) + Low;
                    if(!intIDS.contains(newID))
                    {
                        generatedId = "AMARENT-" + (newID);
                        System.out.println("Generated Id: " + generatedId);
                        flag = Boolean.FALSE;
                    }
                }
            return generatedId;
            }
    	}
        
	public static void main(String[] args) {
		new DynamicGeneratorImpl().jrNoGenerator();
	}
}
