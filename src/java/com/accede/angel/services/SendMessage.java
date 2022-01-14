package com.accede.angel.services;

import com.accede.angel.admin.model.Admin;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

/**
 *
 * @author Accede
 */
public class SendMessage {
    
    
 public static String  sendMobileMSG(String mobileNo, String message ){   
  //////////Message Sending
		String authkey = "213197AuxQK2YjR0B85ae805a1";
		
		String senderId = "ANGELM";
		
		String route="4"; //3
		
		//Prepare Url
		URLConnection myURLConnection=null;     
		URL myURL=null;
		BufferedReader reader=null;
		
		//encoding message 
		@SuppressWarnings("deprecation")
		String encoded_message=URLEncoder.encode(message);
		
		//Send SMS API
		String mainUrl="http://login.wishbysms.com/sendhttp.php?";   
		
		//Prepare parameter string 
		StringBuilder sbPostData= new StringBuilder(mainUrl);
		sbPostData.append("authkey="+authkey); 
		sbPostData.append("&mobiles="+mobileNo);
		sbPostData.append("&message="+encoded_message);
		sbPostData.append("&route="+route);
		sbPostData.append("&sender="+senderId);   
		
		//final string
		mainUrl = sbPostData.toString();
		   //prepare connection
		    String response1 = ""; 
		    try{
		        myURL = new URL(mainUrl);
		        myURLConnection = myURL.openConnection();
		        
		        myURLConnection.connect();
		        reader= new BufferedReader(new InputStreamReader(myURLConnection.getInputStream()));
		        while ((response1 = reader.readLine()) != null) 
		            System.out.println(response1 = response1 +response1);
		        System.out.println("Message Successfully Sent To : "+mobileNo);
		    }
		    catch(Exception e){
		    e.printStackTrace();
		    }   
		    return response1;
 }   
    
 public static String  sendMobileMSG(String message ){   
  //////////Message Sending
		String authkey = "213197AuxQK2YjR0B85ae805a1";
		
		String senderId = "ANGELM";
		
		String route="4"; //3
		
		//Prepare Url
		URLConnection myURLConnection=null;     
		URL myURL=null;
		BufferedReader reader=null;
		
		//encoding message 
		@SuppressWarnings("deprecation")
		String encoded_message=URLEncoder.encode(message);
		
		//Send SMS API
		String mainUrl="http://login.wishbysms.com/sendhttp.php?";   
		String mobileNo="9049976912";
		//Prepare parameter string 
		StringBuilder sbPostData= new StringBuilder(mainUrl);
		sbPostData.append("authkey="+authkey); 
		sbPostData.append("&mobiles="+mobileNo);
		sbPostData.append("&message="+encoded_message);
		sbPostData.append("&route="+route);
		sbPostData.append("&sender="+senderId);   
		
		//final string
		mainUrl = sbPostData.toString();
		   //prepare connection
		    String response1 = ""; 
		    try{
		        myURL = new URL(mainUrl);
		        myURLConnection = myURL.openConnection();
		        
		        myURLConnection.connect();
		        reader= new BufferedReader(new InputStreamReader(myURLConnection.getInputStream()));
		        while ((response1 = reader.readLine()) != null) 
		            System.out.println(response1 = response1 +response1);
		        System.out.println("Message Successfully Sent To : "+mobileNo);
		    }
		    catch(Exception e){
		    e.printStackTrace();
		    }   
		    return response1;
 }   
 
 
 
 public static String  sendMobileMSG(String mobileNo, String message ,Admin admin){   
  //////////Message Sending
     
		String authkey = admin.getMsgKey();
		
		String senderId = "ANGELM";
		
		String route="4"; //3
		
		//Prepare Url
		URLConnection myURLConnection=null;     
		URL myURL=null;
		BufferedReader reader=null;
		
		//encoding message 
		@SuppressWarnings("deprecation")
		String encoded_message=URLEncoder.encode(message);
		
		//Send SMS API
		String mainUrl="http://login.wishbysms.com/sendhttp.php?";   
		
		//Prepare parameter string 
		StringBuilder sbPostData= new StringBuilder(mainUrl);
		sbPostData.append("authkey="+authkey); 
		sbPostData.append("&mobiles="+mobileNo);
		sbPostData.append("&message="+encoded_message);
		sbPostData.append("&route="+route);
		sbPostData.append("&sender="+senderId);   
		
		//final string
		mainUrl = sbPostData.toString();
		   //prepare connection
		    String response1 = ""; 
		    try{
		        myURL = new URL(mainUrl);
		        myURLConnection = myURL.openConnection();
		        
		        myURLConnection.connect();
		        reader= new BufferedReader(new InputStreamReader(myURLConnection.getInputStream()));
		        while ((response1 = reader.readLine()) != null) 
		            System.out.println(response1 = response1 +response1);
		        System.out.println("Message Successfully Sent To : "+mobileNo);
		    }
		    catch(Exception e){
		    e.printStackTrace();
		    }   
		    return response1;
 }   
 
 public static void main(String args[])
 {
    SendMessage.sendMobileMSG("8308238755","AMA Testing");
 }
}