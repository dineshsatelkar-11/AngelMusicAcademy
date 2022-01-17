/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.admin.controller;

import com.accede.angel.admin.dao.AdminDao;
import com.accede.angel.admin.model.Admin;
import com.accede.angel.admin.model.Branch;
import com.accede.angel.services.DynamicGenerator;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Accede
 */
@WebServlet(name = "SaveSuperAdmin", urlPatterns = {"/SaveSuperAdmin"})
public class SaveSuperAdmin extends HttpServlet {

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
            String adminEmail = request.getParameter("adminEmail");
            String adminMobileNo = request.getParameter("adminMobileNo");
            String adminName = request.getParameter("adminName");
            String adminPassword = request.getParameter("adminPassword");
            String otp = request.getParameter("otp");
            String receptionPassword = request.getParameter("receptionPassword");

            Admin a = new Admin();

            AdminDao aa = new AdminDao();
            a.setAdminEmail(adminEmail);
            a.setAdminMobileNo(adminMobileNo);
            a.setAdminName(adminName);
            a.setAdminPassword(adminPassword);
            a.setReceptionPassword(receptionPassword);
            a.setRegisteredDate(new Date());
            a.setAdminOfBranch(null);
            a.setImagename("admin.jpg");

            boolean c = aa.saveadmin1(a);
            if (c) {
                response.sendRedirect("Admin/admin/adminLogin.jsp");
            } else {
                response.sendRedirect("Admin/admin/SuperAdmin.jsp");
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
