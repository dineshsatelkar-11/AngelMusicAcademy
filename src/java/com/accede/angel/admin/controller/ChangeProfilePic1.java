/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.admin.controller;

import com.accede.angel.admin.dao.AdmissionDao;
import com.accede.angel.admin.dao.CourseDao;
import com.accede.angel.admin.dao.CustomerAccountDao;
import com.accede.angel.admin.dao.EnquiryDao;
import com.accede.angel.admin.dao.InstrumentDao;
import com.accede.angel.admin.dao.PaymentDao;
import com.accede.angel.admin.model.Admin;
import com.accede.angel.admin.model.Admission;
import com.accede.angel.admin.model.Course;
import com.accede.angel.admin.model.CustomerAccount;
import com.accede.angel.admin.model.Enquiry;
import com.accede.angel.admin.model.Instrument;
import com.accede.angel.admin.model.Payment;
import com.accede.angel.admin.model.StudentAccount;
import com.accede.angel.services.DynamicGenerator;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.hibernate.mapping.Array;

/**
 *
 * @author accede
 */
@WebServlet(name = "ChangeProfilePic1", urlPatterns = {"/ChangeProfilePic1"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)
public class ChangeProfilePic1 extends HttpServlet {

    private static final String UPLOAD_DIRECTORY = "StudentImages";
    private static final int THRESHOLD_SIZE = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB

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
        PrintWriter out = response.getWriter();
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
        System.out.println("upload directory is" + UPLOAD_DIRECTORY);

        HttpSession session = request.getSession();

        
        String image1Name ="";
              
        String imagePath1 = "";
        int id=0;

        if (ServletFileUpload.isMultipartContent(request)) {
            try {

                List<FileItem> multiparts = new ServletFileUpload(
                        new DiskFileItemFactory()).parseRequest(request);
                for (FileItem item : multiparts) {
                    //System.out.println("in for");
                    if (!item.isFormField()) {
Part image1 = request.getPart("img");
  extractFileName(image1);
                        item.write(new File(uploadPath + File.separator + image1Name));
                        System.err.println(item.getName());
                        imagePath1 = uploadPath + File.separator + image1Name;

                    } else {

                        System.err.println(item.getString() + item.getFieldName());
                        if (item.getFieldName().equals("customerAccountid")) {
                         String   customerAccountid = item.getString();
                         id=Integer.parseInt(customerAccountid);
                        }
                    }
                }

                AdmissionDao ad = new AdmissionDao();
 CustomerAccountDao CustomerAccountDao = new CustomerAccountDao();
 if(id != 0)
 {
        CustomerAccount CustomerAccount = CustomerAccountDao.getCustomerAccountById(id);
        Admission a = ad.getAdmissionByAccount(CustomerAccount);
        a.setImage(image1Name);
        a.setImagepath(imagePath1);
                boolean b = ad.updateAdmission(a);

                if (b) {

                   
                    CustomerAccount.setImage(image1Name);
                    new CustomerAccountDao().updateCustomerAccount(CustomerAccount);

                    int i = 1;

                     session.setAttribute("i", i);

                    session.setAttribute("msg", "Profile Picture Change Succefully");

                    response.sendRedirect("Admin/branchReception/StudentProfileDetails.jsp?accountid="+id);
               } else {
                    int i = 2;

                   session.setAttribute("i", i);
                    session.setAttribute("msg", "Something Went Wrong");
                    response.sendRedirect("Admin/branchReception/StudentProfileDetails.jsp?accountid="+id);
                  }
 }else
 {
 
  int i = 2;

                   session.setAttribute("i", i);
                    session.setAttribute("msg", "Something Went Wrong");
                    response.sendRedirect("Admin/branchReception/StudentProfileDetails.jsp?accountid="+id);
              
 }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
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
