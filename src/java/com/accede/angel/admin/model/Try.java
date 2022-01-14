/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.accede.angel.admin.model;

import com.accede.angel.services.Dates;
import java.util.Date;
import java.util.concurrent.TimeUnit;

/**
 *
 * @author Admin
 */
public class Try {
    public static void main(String[] args) {
       Date d2=new Date();
       Date d1=new Dates().getEndingDate(d2,6666);
    long diff = d2.getTime() - d1.getTime();
        System.out.println( TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS));
  double a=5855/2;
System.out.println(a);
    }
}
