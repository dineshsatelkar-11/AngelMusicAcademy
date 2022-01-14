/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.services;

import com.accede.angel.admin.dao.BarcodeDao;
import com.accede.angel.sell.dao.ProductDao1;
import com.accede.angel.sell.model.Barcode;
import com.onbarcode.barcode.Code11;
import java.util.List;

/**
 *
 * @author Admin
 */
public class BarcodeImageGenerate {

    private static final String UPLOAD_DIRECTORY = "Barcode";

    public  void barcodeupdate() {
        ProductDao1 ProductDao1 = new ProductDao1();
        List<Barcode> allbarcode = ProductDao1.getAllBarcode();
        if (allbarcode.size() > 0 && allbarcode != null) {
            for (Barcode b : allbarcode) {

                String imagename = b.getBarcode() + "image.png";
                b.setImagename(imagename);

                ProductDao1.UpdateBarcode(b);
                BarcodeGenerator bg = new BarcodeGenerator();

                GenerateBarcode(b);

            }
        }
    }

    public  void GenerateBarcode(Barcode bb) {
        try {

            String imagename = bb.getImagename();
            String barcodeee = bb.getBarcode();
            imagename = imagename;
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
//            Barcode br1 = bb;
//          
//            br1.setBarcodePath("F:\\Dinesh_Project\\AngelMusicAcademy\\AngelMusicAcademy\\build\\web\\Barcode\\" + imagename);
////            br1.setBarcodePath("/home/angelmin/appservers/apache-tomcat-8x/webapps/ROOT//Barcode/" + imagename);
//           
//            Barcode bbb = bd.UpdateBarcode(br1);

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
