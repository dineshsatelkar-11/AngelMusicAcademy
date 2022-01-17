/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.accede.angel.services;

import java.util.Calendar;
import java.util.Date;
import java.util.concurrent.TimeUnit;

/**
 *
 * @author asd
 */
public class Dates {
   public static Date getStartingDate(Date startingDate)
    {
        // today    
        Calendar start_date = Calendar.getInstance();
        start_date.setTime(startingDate);
        // reset hour, minutes, seconds and millis
        start_date.set(Calendar.HOUR_OF_DAY, 0);
        start_date.set(Calendar.MINUTE, 0);
        start_date.set(Calendar.SECOND, 0);
        start_date.set(Calendar.MILLISECOND, 0);
        Date java_start_date =  start_date.getTime();
        System.err.println(java_start_date);
        return java_start_date;
    }
    public static Date getEndingDate(Date startingDate, int dayBefore)
    {
        // ending day
        Calendar end_date =  Calendar.getInstance();
        end_date.setTime(startingDate);
        // reset hour, minutes, seconds and millis
        end_date.set(Calendar.HOUR_OF_DAY, 0);
        end_date.set(Calendar.MINUTE, 0);
        end_date.set(Calendar.SECOND, 0);
        end_date.set(Calendar.MILLISECOND, 0);
        end_date.add(Calendar.DAY_OF_MONTH, dayBefore);
        Date java_end_date =  end_date.getTime();
        System.err.println("-----------------------------------");
        System.err.println(java_end_date);
          System.err.println("-----------------------------------");
        return java_end_date;
    }   
    
      public static Date getEndingDate1(Date startingDate, int dayBefore)
    {
        // ending day
        Calendar end_date =  Calendar.getInstance();
//        end_date.setTime(startingDate);
//        // reset hour, minutes, seconds and millis
//        end_date.set(Calendar.HOUR_OF_DAY, 0);
//        end_date.set(Calendar.MINUTE, 0);
//        end_date.set(Calendar.SECOND, 0);
//        end_date.set(Calendar.MILLISECOND, 0);
        end_date.add(Calendar.DAY_OF_MONTH, dayBefore);
        Date java_end_date =  end_date.getTime();
        System.err.println(java_end_date);
        return java_end_date;
    }   
    
    public static long getDifferenceDays(Date d1, Date d2) {
    long diff = d2.getTime() - d1.getTime();
    return TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS);
}  
    
    
     public  double getAge(Date d1) {
    long diff = new Date().getTime() - d1.getTime();
    double a=diff/365;
    return a;
}  
}
