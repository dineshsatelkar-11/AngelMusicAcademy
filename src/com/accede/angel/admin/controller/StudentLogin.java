/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.admin.controller;

import com.accede.angel.admin.dao.AdmissionDao;
import com.accede.angel.admin.model.Admission;
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
 * @author Accede
 */
@WebServlet(name = "StudentLogin", urlPatterns = {"/StudentLogin"})
public class StudentLogin extends HttpServlet {

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
            String adminEmail = request.getParameter("email").trim();
            String adminPassword = request.getParameter("password").trim();

            String msg = "Invalid Credentials...!!!";
            HttpSession session = request.getSession();
            session.invalidate();
            session = request.getSession();
            if (adminEmail != null && adminPassword != null) {
                System.out.println("adminEmail==" + adminEmail);
                System.out.println("adminPassword==" + adminPassword);
                Admission ad1 = new Admission();
                ad1.setAdmissionNo(adminEmail);
                ad1.setStudentPassword(adminPassword);
                AdmissionDao ad = new AdmissionDao();
                ad1 = ad.getAdmission(ad1);

                if (ad1 != null) {
                    session.setAttribute("Student", ad1);

                    response.sendRedirect("Admin/Student/StudentIndex.jsp");
                } else {
                    int i = 2;

                    session.setAttribute("i", i);
                    session.setAttribute("msg", msg);
                    response.sendRedirect("Admin/Login/StudentLogin.jsp");

                    out.print("Failed");
                }
            } else {

                int i = 2;
                session.setAttribute("i", i);
                session.setAttribute("msg", msg);
//                    response.sendRedirect("index1.jsp");
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
