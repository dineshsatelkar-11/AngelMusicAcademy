/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.sell.controller;

import java.io.*;
import java.net.*;
import java.util.Date;

class DateClient
{
    public static void main(String args[]) throws Exception
    {
        
        
        ServerSocket s=new ServerSocket(5217);

        while(true)
        {
            System.out.println("Waiting For Connection ...");
            Socket soc=s.accept();
            DataOutputStream out=new DataOutputStream(soc.getOutputStream());
            out.writeBytes("Server Date" + (new Date()).toString() + "\n");
            out.close();
            soc.close();
            
        }
        
    }    
}



