/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.sell.controller;

import com.accede.angel.admin.dao.CustomerAccountDao;
import com.accede.angel.admin.model.Admin;
import com.accede.angel.admin.model.CustomerAccount;
import com.accede.angel.sell.dao.BranchProductDao;
import com.accede.angel.sell.dao.CustomerQuatationDAO;
import com.accede.angel.sell.dao.CustomerQuotDetailsDAO;
import com.accede.angel.sell.dao.CustomerSellDAO;
import com.accede.angel.sell.dao.ProductDao1;
import com.accede.angel.sell.model.BranchProduct;
import com.accede.angel.sell.model.CustomerQuatation;
import com.accede.angel.sell.model.CustomerQuatationDetails;
import com.accede.angel.sell.model.ProductModel;
import com.accede.angel.sell.model.TempCustomerSell;
import com.accede.angel.services.SendAttachmentInEmail;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
@WebServlet(name = "SendQuatation", urlPatterns = {"/SendQuatation"})
public class SendQuatation extends HttpServlet {

    private static final String UPLOAD_DIRECTORY = "PDFQuatation";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session1 = request.getSession();
        HttpSession session = request.getSession();
        String savePath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY + File.separator;

        Admin Branch = (Admin) session1.getAttribute("BRANCH_ADMIN");
        if (Branch != null) {
            int quatationid = Integer.parseInt(request.getParameter("quatationid"));
           
            CustomerQuatation cs = new CustomerQuatation();
            CustomerQuatationDAO csd1 = new CustomerQuatationDAO();
            cs=csd1.getpurchaseByID(quatationid);
           
                

                try {
                    Document document = new Document(PageSize.A4, 36, 36, 36, 36);
//          String savePath=    "/home/angelmin/appservers/apache-tomcat-8x/webapps/ROOT//PDFQuatation/" );

                    CustomerQuatation ad = cs;
                    PdfWriter.getInstance(document, new FileOutputStream(savePath + "Quatation.pdf"));
//                System.out.println("savePath2==" + savePath + File.separator + p.getUid() + ".pdf");

                    document.open();

                    Rectangle rect = new Rectangle(577, 825, 18, 15); // you can resize rectangle 
                    rect.enableBorderSide(1);
                    rect.enableBorderSide(2);
                    rect.enableBorderSide(4);
                    rect.enableBorderSide(8);
                    rect.setBorderColor(BaseColor.BLACK);
                    rect.setBorderWidth(1);
                    document.add(rect);

                    Font boldFont = new Font(Font.FontFamily.TIMES_ROMAN, 18, Font.BOLD);
                    Paragraph preface = new Paragraph("ANGEL MUSIC", boldFont);
                    Paragraph preface1 = new Paragraph("Shop No. 7, Shantiban Society , Near PNG, Chafekar Chowk, Chichwad , Pune - 411033." + "\n+91 9049976912 admin@angelm.in ");
                    Paragraph preface9 = new Paragraph("Quatation Details", boldFont);
                    Paragraph preface20 = new Paragraph("GENERAL INSTRUCTIONS FOR CANDIDATES", boldFont);
                    Paragraph preface22 = new Paragraph("Total Amount in words:-Rs " + ad.getAmount_inword() + " only");
                    Paragraph preface23 = new Paragraph("Note:Ones Goods sold will not return or Exchange.");
                    Paragraph preface24 = new Paragraph("Note:Quotation valid till 15 Days from given Date.");
                    Paragraph preface2 = new Paragraph("____________________________________________________________________________");
                    SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd-MM-yyyy");

                    String date = DATE_FORMAT.format(ad.getDate());
                    Paragraph preface31 = new Paragraph("Sell No:" + ad.getId() + "                                                                                                            " + "Date :" + date);
                    Paragraph preface3 = new Paragraph("Name :" + ad.getCustomername() + "                                                ");
                    Paragraph preface34 = new Paragraph("Invoice No :" + ad.getId());

                    Paragraph preface4 = new Paragraph("Mobile No:" + ad.getMobilenumber());

                    Paragraph preface12 = new Paragraph("");

                    Paragraph preface13 = new Paragraph("|");

                    preface.setAlignment(Element.ALIGN_CENTER);
                    preface1.setAlignment(Element.ALIGN_CENTER);
                    preface34.setAlignment(Element.ALIGN_RIGHT);
                    preface9.setAlignment(Element.ALIGN_CENTER);
                    preface2.setAlignment(Element.ALIGN_BASELINE);
                    preface3.setAlignment(Element.ALIGN_JUSTIFIED);
                    preface31.setAlignment(Element.ALIGN_JUSTIFIED);
                    preface4.setAlignment(Element.ALIGN_JUSTIFIED);

                    document.add(preface34);
                    document.add(preface);

                    document.add(preface1);
                    document.add(preface9);
                    document.add(preface2);

                    document.add(preface31);
                    document.add(preface3);

                    document.add(preface4);
                    document.add(preface2);

                    document.add(preface12);
                    document.add(preface2);

                    PdfPTable table = new PdfPTable(new float[]{1, 3, 3, 2, 2, 2, 2, 2, 2});
                    table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
                    table.addCell("No");
                    table.addCell("Category");
                    table.addCell("Sub Category");
                    table.addCell("Brand");
                    table.addCell("Model No");
                    table.addCell("Color");
                    table.addCell("Quantity");
                    table.addCell("MRP");
                    table.addCell("Net Amount");

                    table.setHeaderRows(1);
                    PdfPCell[] cells = table.getRow(0).getCells();
                    for (int j = 0; j < cells.length; j++) {
                        cells[j].setBackgroundColor(BaseColor.GRAY);
                    }
                    int i = 0;
                    for (CustomerQuatationDetails c : ad.getCustomerQuatationDetails()) {
                        i++;
                        table.addCell("" + i);

                        table.addCell("" + c.getProduct().getCategory().getCategory());
                        table.addCell("" + c.getProduct().getSubCategory().getSubCategory());
                        table.addCell("" + c.getProduct().getBrand().getBrand());
                        table.addCell("" + c.getProduct().getModel().getModelName());
                        table.addCell("" + c.getProduct().getColorModel().getColorName());
                        table.addCell("" + c.getProductquantity());
                        table.addCell("" + c.getMrpprice());
                        table.addCell("" + c.getGross_amount());

                    }
                    PdfPCell c1 = new PdfPCell(new Phrase(""));
                    if (ad.getDiscount_amount() > 0) {

                        c1.setColspan(6);
                        table.addCell(c1);
                        c1 = new PdfPCell(new Phrase("Discount"));
                        c1.setColspan(2);
                        table.addCell(c1);
                        table.addCell("" + ad.getDiscount_amount());
                    }

                    if (ad.getOther_charges() > 0) {

                        c1.setColspan(6);
                        table.addCell(c1);
                        c1 = new PdfPCell(new Phrase("Other Charges"));
                        c1.setColspan(2);
                        table.addCell(c1);
                        table.addCell("" + ad.getOther_charges());
                    }

                    c1.setColspan(6);
                    table.addCell(c1);
                    c1 = new PdfPCell(new Phrase("Gross Amount"));
                    c1.setColspan(2);
                    table.addCell(c1);
                    table.addCell("" + ad.getGrosstotal());
                    table.setWidthPercentage(100);
                    document.add(table);
                    document.add(preface2);

                    document.add(preface22);
                    document.add(preface23);
                    document.add(preface24);
                    document.close();
                    System.out.println("Done");

                    String email = cs.getCustomerAccount().getEmail();
//                String email = p.getEmail();
                    System.out.println("mail" + email);

                    String msg = "Your Quatation Invoice";
                    String filepath = savePath + "Quatation.pdf";

                    System.out.println(filepath);

                    String filename = "Quatation.pdf";

                    System.out.println(filename);

                    SendAttachmentInEmail.mailsend(email, msg, filepath, filename);

                    System.out.println("Done1");

                } catch (DocumentException exc) {
                    throw new IOException(exc.getMessage());
                }

                int i = 1;

                session.setAttribute("i", i);
                session.setAttribute("msg", "Product Quatation Send Successfully");
               
                response.sendRedirect("Admin/branchReception/CustomerQuatationReport.jsp?accountid=" + cs.getCustomerAccount().getId());
          
        } else {
            int i = 2;

            session.setAttribute("i", i);
            session.setAttribute("msg", "Your Session is Terminate......");
            response.sendRedirect("Admin/Login/adminLogin.jsp");

        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
