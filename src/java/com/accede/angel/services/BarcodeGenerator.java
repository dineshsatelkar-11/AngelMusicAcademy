/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.services;


import com.accede.angel.admin.dao.BarcodeDao;
import com.accede.angel.sell.model.Barcode;
import com.onbarcode.barcode.Code11;
import java.io.File;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;

/**
 *
 * @author Admin
 */
public class BarcodeGenerator {
 private static final String UPLOAD_DIRECTORY = "Barcode";
    public void GenerateBarcode(Barcode bb) {
        try {
           
        
            String imagename = bb.getImagename();
            String barcodeee = bb.getBarcode();
            imagename=imagename;
            BarcodeDao bd = new BarcodeDao();
//            List<Barcode> b = null;
//            b = bd.getAllBarcode();
//            int size = b.size();
//            String imagepath = "";
//            if (size > 0) {
//                int id = bd.getLastID();
//                Barcode br = new Barcode();
//                br = bd.getBarcodeByID(id);
//                String image = br.getImagename();
//                
//               
//                
//                imagepath = imagename + "-" + ".png";
//            } else {
//                imagepath = imagename + "-.png";
//
//            }
            Code11 barcode = new Code11();
            barcode.setData(barcodeee);

            barcode.setX(2);
            barcode.setY(60);
            
            barcode.setBarcodeWidth(150);
            barcode.setBarcodeHeight(50);
            barcode.setTextMargin(0);

            barcode.setLeftMargin(0);
            barcode.setRightMargin(0);
            barcode.setTopMargin(0);
        


//            barcode.drawBarcode("F:\\Dinesh_Project\\AngelMusicAcademy\\AngelMusicAcademy\\build\\web\\Barcode\\" + imagename);
            
            
            barcode.drawBarcode("/home/angelmin/appservers/apache-tomcat-8x/webapps/ROOT//Barcode/" + imagename);
//AdminImages/Chrysanthemum.jpg
            Barcode br1 = new Barcode();
            br1.setBarcode(barcodeee);
//            br1.setBarcodePath("F:\\Dinesh_Project\\AngelMusicAcademy\\AngelMusicAcademy\\build\\web\\Barcode\\" + imagename);
            br1.setBarcodePath("/home/angelmin/appservers/apache-tomcat-8x/webapps/ROOT//Barcode/" + imagename);
            br1.setImagename(imagename);
            Barcode bbb = bd.SaveBarcode(br1);

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
