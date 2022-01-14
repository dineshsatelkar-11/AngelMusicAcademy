/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.services;

import com.accede.angel.admin.dao.AdmissionDao;
import com.accede.angel.admin.dao.BarcodeDao;
import com.accede.angel.admin.dao.ExamApplicationDao;
import com.accede.angel.admin.dao.RentDao;
import com.accede.angel.admin.dao.RepairDao;
import com.accede.angel.admin.dao.SellDao;
import com.accede.angel.admin.dao.TempImageDao;
import com.accede.angel.admin.dao.UserDao;
import com.accede.angel.admin.model.Admission;
import com.accede.angel.admin.model.Rent;
import com.accede.angel.admin.model.Repair;
import com.accede.angel.admin.model.TempImage;
import com.accede.angel.sell.model.Barcode;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Accede
 */
public class DynamicGenerator {

    public String passwordGenerator() {
        // TODO Auto-generated method stub
        Random r = new Random();
        int min = 100000;
        int max = 999999;
        return String.valueOf(r.nextInt((max - min) + 1) + min);
    }

    public String imagenameGenerator() {
        // TODO Auto-generated method stub
        Random r = new Random();
        int min = 100000;
        int max = 999999;
        String imagename = String.valueOf(r.nextInt((max - min) + 1) + min);
//                  TempImage t=new TempImage();
//                  TempImageDao td=new TempImageDao();
//                  int id=1;
////                  t.setId(id);
//                  t.setImagename(imagename);
//                  t.setImagepath(imagename);
//                  td.saveTempImage(t);

        return imagename;
    }

    public String passwordGenerator1() {
        // TODO Auto-generated method stub
        Random r = new Random();
        int min = 10000;
        int max = 99999;
        return String.valueOf(r.nextInt((max - min) + 1) + min);
    }

    public String jrNoGenerator() {
        int size = new AdmissionDao().getAllAdmission().size();
        int no = 1001 + size;
        String generatedId = "CL" + Integer.toString(no);
        System.out.println("First Generated Id: " + generatedId);
        return generatedId;
    }

    public String examNoGenerator(String pre) {
        // TODO Auto-generated method stub
        String prefix = pre.toUpperCase();
        ExamApplicationDao ea = new ExamApplicationDao();
        List<String> examnos = ea.getAllExamApplicationnumbers();
        List<Integer> intIDS = new ArrayList<Integer>();

        if (examnos == null) {
            Random r = new Random();
            int Low = 111111;
            int High = 999999;
            int newID = r.nextInt(High - Low) + Low;
            String generatedId = prefix + "/EX-" + (newID);
            System.out.println("First Generated Id: " + generatedId);
            return generatedId;
        } else {
            for (String s : examnos) {
                intIDS.add(Integer.parseInt(s.split("-")[1]));
            }

            Boolean flag = Boolean.TRUE;
            String generatedId = "";
            while (flag) {
                Random r = new Random();
                int Low = 111111;
                int High = 999999;
                int newID = r.nextInt(High - Low) + Low;
                if (!intIDS.contains(newID)) {
                    generatedId = "AMAEX-" + (newID);
                    System.out.println("Generated Id: " + generatedId);
                    flag = Boolean.FALSE;
                }
            }
            return generatedId;
        }
    }
//Sell No Generator

    public String sellNoGenerator(String pre) {
        // TODO Auto-generated method stub
        String prefix = pre.toUpperCase();
        SellDao sd = new SellDao();

        List<String> sellNo = sd.getAllSellnumbers();
        List<Integer> intIDS = new ArrayList<Integer>();

        if (sellNo == null) {
            Random r = new Random();
            int Low = 111111;
            int High = 999999;
            int newID = r.nextInt(High - Low) + Low;
            String generatedId = "SE-" + (newID);
            System.out.println("First Generated Id: " + generatedId);
            return generatedId;
        } else {
            for (String s : sellNo) {
                intIDS.add(Integer.parseInt(s.split("-")[1]));
            }

            Boolean flag = Boolean.TRUE;
            String generatedId = "";
            while (flag) {
                Random r = new Random();
                int Low = 111111;
                int High = 999999;
                int newID = r.nextInt(High - Low) + Low;
                if (!intIDS.contains(newID)) {
                    generatedId = "SE-" + (newID);
                    System.out.println("Generated Id: " + generatedId);
                    flag = Boolean.FALSE;
                }
            }
            return generatedId;
        }
    }

//Sell No Generator
    public String repairNoGenerator() {
      
        RepairDao rd = new RepairDao();
        List<String> repairNo = rd.getAllRepairnumbers();
    
        int count = repairNo.size();
        if (repairNo.isEmpty() || count == 0) {
           
            String generatedId = "RP-" + 1;
            System.out.println("First Generated Id: " + generatedId);
            return generatedId;
        } else {
               int number = count + 1;
            String generatedId = "RP-" + (number);

            return generatedId;
        }
    }

    //Rent No Generator
    public String rentNoGenerator() {
      
        RentDao rd = new RentDao();
        List<Rent> rentNo = rd.getAllRentnumbers();
    
        int count = rentNo.size();

        if (rentNo.isEmpty()) {
         
            String generatedId = "RE-" + 1;
            System.out.println("First Generated Id: " + generatedId);
            return generatedId;
        } else {

           
            int number = count + 1;
            String generatedId = "RE-" + (number);

            return generatedId;
        }
    }

    public String Barcodegeneratot() {
        // TODO Auto-generated method stub
        Random r = new Random();
        int min = 10000000;
        int max = 999999999;
        String no = String.valueOf(r.nextInt((max - min) + 1) + min);

        return no;
    }

    public String barcodegeneration(String pre) {
        BarcodeDao rd = new BarcodeDao();
        String no = "";
        List<Barcode> barcodeno = rd.getAllBarcode();
        if (barcodeno.isEmpty()) {
            no = "1001";
        } else {
            int id = rd.getLastID();
            Barcode br = rd.getBarcodeByID(id);
            String barcode = br.getBarcode();
            int bar = Integer.parseInt(barcode);
            bar = bar + 1;
            no = Integer.toString(bar);

        }

        return no;

    }

}
