/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.accede.angel.services;

import java.io.File;


/**
 *
 * @author Accede
 */
public class RenameFile {
    
    
   
    public static void main(String[] args)
    {
    	try{

    	   File afile =new File("C:\\Users\\Accede\\Desktop\\Picture\\test-0.jpg");

    	   if(afile.renameTo(new File("C:\\Users\\Accede\\Desktop\\Dinesh" + afile.getName()))){
    		System.out.println("File is moved successful!");
    	   }else{
    		System.out.println("File is failed to move!");
    	   }

    	}catch(Exception e){
    		e.printStackTrace();
    	}
    }
}
