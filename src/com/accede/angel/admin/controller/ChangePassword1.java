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
@WebServlet(name = "ChangePassword1", urlPatterns = {"/ChangePassword1"})
public class ChangePassword1 extends HttpServlet {

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
            HttpSession session1 = request.getSession();
            HttpSession session = request.getSession();
            Admin Branch = (Admin) session1.getAttribute("BRANCH_ADMIN");
            if (Branch != null) {

                String oldpassword = request.getParameter("oldpassword");
                String newpassword = request.getParameter("newpassword");

                AdminDao ad = new AdminDao();
                if (oldpassword.equals(Branch.getReceptionPassword())) {

                    if (Branch.getAdminOfBranch() == null) {
                        int i = 1;
                        session.setAttribute("i", i);
                        session.setAttribute("msg", "Password Update Succssfully......");
                        response.sendRedirect("Admin/admin/ChangePassword.jsp");
                    } else {
                        if (newpassword.equals(Branch.getAdminPassword())) {
                            Branch.setReceptionPassword(newpassword);
                            ad.updateAdminid(Branch);
                            int i = 1;
                            session.setAttribute("i", i);
                            session.setAttribute("msg", "Password Update Succssfully......");
                            response.sendRedirect("Admin/branchReception/ChangePassword.jsp");
                        } else {

                            int i = 1;
                            session.setAttribute("i", i);
                            session.setAttribute("msg", "Branch Admin and Reception Password Should Not Same.....");
                            response.sendRedirect("Admin/branchReception/ChangePassword.jsp");

                        }
                    }

                } else {
                    if (Branch.getAdminOfBranch() == null) {
                        int i = 2;
                        session.setAttribute("i", i);
                        session.setAttribute("msg", "Enter Correct Old Password......");
                        response.sendRedirect("Admin/admin/ChangePassword.jsp");
                    } else {

                        int i = 2;
                        session.setAttribute("i", i);
                        session.setAttribute("msg", "Enter Correct Old Password......");
                        response.sendRedirect("Admin/branchReception/ChangePassword.jsp");
                    }
                }
            } else {
                int i = 2;
                session.setAttribute("i", i);
                session.setAttribute("msg", "Your Session is Terminate......");
                response.sendRedirect("Admin/Login/adminLogin.jsp");
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
