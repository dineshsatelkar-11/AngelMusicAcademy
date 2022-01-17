/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.admin.controller;

import com.accede.angel.admin.dao.AdmissionDao;
import com.accede.angel.admin.dao.CustomerAccountDao;
import com.accede.angel.admin.model.Admission;
import com.accede.angel.admin.model.CustomerAccount;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Acer
 */
@WebServlet(name = "UploadImagesServlet", urlPatterns = {"/UploadImagesServlet"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)
public class UploadImagesServlet extends HttpServlet {

    private static final String SAVE_DIR = "StudentImages";
    private static final int THRESHOLD_SIZE = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        int id = Integer.valueOf(request.getParameter("customerAccountid"));
        try (PrintWriter out = response.getWriter()) {
            String savePath = getServletContext().getRealPath("") + File.separator + SAVE_DIR;
            File fileSaveDir = new File(savePath);
            if (!fileSaveDir.exists()) {
                fileSaveDir.mkdir();
            }

            AdmissionDao ad = new AdmissionDao();
            CustomerAccountDao CustomerAccountDao = new CustomerAccountDao();

            Part image1 = request.getPart("img");
            String image1Name = extractFileName(image1);
            String imagePath1 = savePath + File.separator + image1Name;
            System.out.println("image1 path " + imagePath1 + "\nid=" + id + "\nimage1Name=" + image1Name);
            image1.write(savePath + File.separator + image1Name);

            try {
                CustomerAccount CustomerAccount = CustomerAccountDao.getCustomerAccountById(id);
                Admission a = ad.getAdmissionByAccount(CustomerAccount);

                a.setImage(image1Name);
                a.setImagepath(imagePath1);
                boolean b = ad.updateAdmission(a);

                if (b) {

                    CustomerAccount.setImage(image1Name);
                    new CustomerAccountDao().updateCustomerAccount(CustomerAccount);

                    int i = 1;
                    HttpSession session = request.getSession();
                    session.setAttribute("i", i);

                    session.setAttribute("msg", "Profile Picture Change Succefully");

                    response.sendRedirect("Admin/branchReception/StudentProfileDetails.jsp?accountid=" + id);

//                    
                } else {
                    int i = 2;
                    HttpSession session = request.getSession();

                    session.setAttribute("i", i);
                    session.setAttribute("msg", "Something Went Wrong");
                    response.sendRedirect("Admin/branchReception/StudentProfileDetails.jsp?accountid=" + id);

                }

            } catch (Exception e) {
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
