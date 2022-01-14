/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.admin.controller;

import com.accede.angel.admin.dao.AdmissionDao;
import com.accede.angel.admin.dao.CustomerAccountDao;
import com.accede.angel.admin.dao.EmployeeDao;
import com.accede.angel.admin.model.Admission;
import com.accede.angel.admin.model.CustomerAccount;
import com.accede.angel.admin.model.Employee;
import com.accede.angel.services.DynamicGenerator;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "UpdateProfileByCameraForEmployee", urlPatterns = {"/UpdateProfileByCameraForEmployee"})
public class UpdateProfileByCameraForEmployee extends HttpServlet {

    private static final String UPLOAD_DIRECTORY = "TempImages";
    private static final String UPLOAD_DIRECTORY1 = "EmployeeImages";

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            long studentid = Long.parseLong(request.getParameter("studentid"));
          
             EmployeeDao ad = new EmployeeDao();
        Employee a = ad.getEmployeeByID(studentid);
           
            DynamicGenerator dg = new DynamicGenerator();
            String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY + File.separator;
            String uploadPath1 = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY1 + File.separator;
            File sourceFile = new File(uploadPath + "/image.png");
//        File sourceFile = new File("E:\\Dinesh_update-28_07\\AngelMusicAcademy\\build\\web\\TempImages\\Student.jpg");
            String no = dg.imagenameGenerator();
            File destinationFile = new File(uploadPath1 + no + sourceFile.getName());
//        File destinationFile1 = new File("/home/angelmin/appservers/apache-tomcat-8x/webapps/ROOT/StudentImages/" + no + sourceFile.getName());
//        File destinationFile = new File("E:\\Dinesh_update-28_07\\AngelMusicAcademy\\build\\web\\StudentImages\\" + no + sourceFile.getName());

            FileInputStream fileInputStream = new FileInputStream(sourceFile);
            FileOutputStream fileOutputStream = new FileOutputStream(
                    destinationFile);

            int bufferSize;
            byte[] bufffer = new byte[512];
            while ((bufferSize = fileInputStream.read(bufffer)) > 0) {
                fileOutputStream.write(bufffer, 0, bufferSize);
            }
            fileInputStream.close();
            fileOutputStream.close();
            String imagename = no + "image.png";
            String imagepath = uploadPath1 + no + "image.png";
//        String imagepath = "E:\\Dinesh_update-28_07\\AngelMusicAcademy\\build\\web\\StudentImages\\" + no + "image.png";
            a.setImage(imagename);
            a.setImagepath(imagepath);

            boolean b = ad.updateEmployee(a);
            if (b) {

              

                int i = 1;
                HttpSession session = request.getSession();
                session.setAttribute("i", i);
                session.setAttribute("msg", "Profile Picture Change Succefully");

                response.sendRedirect("Admin/admin/EmployeeDetails.jsp?asd=" + a.getId());

            } else {
                int i = 2;
                HttpSession session = request.getSession();

                session.setAttribute("i", i);
                session.setAttribute("msg", "Something Went Wrong");
                response.sendRedirect("Admin/admin/EmployeeDetails.jsp?asd=" + a.getId());

            }

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
