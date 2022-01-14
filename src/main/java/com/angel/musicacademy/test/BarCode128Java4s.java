package com.angel.musicacademy.test;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
 
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.Barcode128;
import com.itextpdf.text.pdf.PdfWriter;

public class BarCode128Java4s {

	
	  public static void barcodegenerate(String ProductName,String key) throws FileNotFoundException, DocumentException {
		     
		    String Key = key;    
		   
		    Document document = new Document(new Rectangle(PageSize.A4));    
		    PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream("D:/Dinesh/Java4s_BarCode_128.pdf"));    
		 
		    document.open();
			    document.add(new Paragraph(ProductName));
		 
				    Barcode128 code128 = new Barcode128();
				    code128.setGenerateChecksum(true);
				    code128.setCode(Key);    
		 
			    document.add(code128.createImageWithBarcode(writer.getDirectContent(), null, null));
		    document.close();
		 
		    System.out.println("Document Generated...!!!!!!");
		  }
}
