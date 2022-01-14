/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.admin.controller;

import com.accede.angel.admin.dao.AdminDao;
import com.accede.angel.admin.model.Admin;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Accede
 */
@WebServlet(name = "AdminLoginServlet", urlPatterns = {"/AdminLoginServlet"})
public class AdminLoginServlet extends HttpServlet {

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

            HttpSession session = request.getSession();
            Admin admin11 = (Admin) session.getAttribute("BRANCH_ADMIN");
            String adminPassword = (String) session.getAttribute("adminPassword");
           
            int otp = Integer.parseInt(request.getParameter("otp"));
            System.out.println("adminEmail==" + admin11.getAdminEmail());
            System.out.println("adminPassword==" + adminPassword);
            Admin admin = admin11;
            Admin admin1 = admin11;
         
            admin.setOtp(otp);
            admin.setAdminPassword(adminPassword);
            admin.setReceptionPassword(adminPassword);
            AdminDao ad = new AdminDao();
            admin1 = ad.getBranchReception1(admin);
            admin = ad.getAdmin1(admin);

            String msg = "Invalid Otp...!!!";
         

            if (admin != null) {
                if (admin.getAdminOfBranch() == null) {
                    admin.setImagepath("1");
                    ad.updateadminprofilepic(admin);
                    session.setAttribute("BRANCH_ADMIN", admin);
                    String Type = "Super_Admin";
                    session.setAttribute("Type", "1");
                    session.setAttribute("BRANCH_ADMIN1", Type);
                    response.sendRedirect("Admin/admin/adminIndex.jsp");
                } else {

                    admin.setImagepath("3");
                    ad.updateadminprofilepic(admin);
                    session.setAttribute("BRANCH_ADMIN", admin);
                    String Type = "Branch_Reception";
                    session.setAttribute("Type", "3");
                    session.setAttribute("BRANCH_ADMIN1", Type);
                    response.sendRedirect("Admin/branchReception/branchReceptionIndex.jsp");
                }

            } else {
                if (admin1 != null) {
                    admin1.setImagepath("2");
                    ad.updateadminprofilepic(admin1);
                    session.setAttribute("BRANCH_ADMIN", admin1);
                    String Type = "Branch_Admin";
                    session.setAttribute("Type", "2");
                    session.setAttribute("BRANCH_ADMIN1", Type);
                    response.sendRedirect("Admin/branchReception/branchReceptionIndex.jsp");
                } else {
                    int i = 2;

                    session.setAttribute("i", i);
                    session.setAttribute("msg", msg);
                    response.sendRedirect("Admin/Login/adminLogin.jsp");
                }
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
