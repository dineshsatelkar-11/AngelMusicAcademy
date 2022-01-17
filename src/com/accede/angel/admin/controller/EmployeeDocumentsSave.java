/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.accede.angel.admin.controller;

import com.accede.angel.admin.dao.EmployeeDao;
import com.accede.angel.admin.dao.EmployeeDocumentsDao;
import com.accede.angel.admin.model.Employee;
import com.accede.angel.admin.model.EmployeeDocuments;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Admin
 */
@WebServlet(name = "EmployeeDocumentsSave", urlPatterns = {"/EmployeeDocumentsSave"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)
public class EmployeeDocumentsSave extends HttpServlet {
 private static final String SAVE_DIR = "EmployeeDocument";
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

        int id = Integer.valueOf(request.getParameter("empid"));
        String Documenttype  = request.getParameter("docname");
        try (PrintWriter out = response.getWriter()) {
            String savePath = getServletContext().getRealPath("") + File.separator + SAVE_DIR;
            File fileSaveDir = new File(savePath);
            if (!fileSaveDir.exists()) {
                fileSaveDir.mkdir();
            }

              EmployeeDao bd = new EmployeeDao();
        Employee a1 = bd.getEmployeeByID(id);
          EmployeeDocuments a=new EmployeeDocuments();
          EmployeeDocumentsDao EmployeeDocumentsDao=new EmployeeDocumentsDao();
a.setDocumentType(Documenttype);
a.setEmployee(a1);
            Part image1 = request.getPart("img");
            String image1Name = extractFileName(image1);
            String imagePath1 = savePath + File.separator + image1Name;
            System.out.println("image1 path " + imagePath1 + "\nid=" + id + "\nimage1Name=" + image1Name);
            image1.write(savePath + File.separator + image1Name);

            try {
               

                a.setImage(image1Name);
                a.setImagepath(imagePath1);
                boolean b = EmployeeDocumentsDao.saveEmployeeDocuments(a);

                if (b) {

                   

                    int i = 1;
                    HttpSession session = request.getSession();
                    session.setAttribute("i", i);

                    session.setAttribute("msg", "Employee Document Upload Succefully");

                    response.sendRedirect("Admin/admin/EmployeeDetails.jsp?asd=" + id);

//                    
                } else {
                    int i = 2;
                    HttpSession session = request.getSession();

                    session.setAttribute("i", i);
                    session.setAttribute("msg", "Something Went Wrong");
                    response.sendRedirect("Admin/admin/EmployeeDetails.jsp?asd=" + id);

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
