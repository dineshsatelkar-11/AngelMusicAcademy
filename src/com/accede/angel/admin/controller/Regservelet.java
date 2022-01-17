/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.accede.angel.admin.controller;

import com.accede.angel.admin.dao.AdminDao;
import com.accede.angel.admin.dao.EnquiryDao;
import com.accede.angel.admin.model.Admin;
import com.accede.angel.admin.model.Enquiry;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author asd
 */
@WebServlet(name = "Regservelet", urlPatterns = {"/Regservelet"})
public class Regservelet extends HttpServlet {

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
          String cfname = request.getParameter("cfname");
          String cmname = request.getParameter("cmname");
          String clname = request.getParameter("clname");
          String Branch = request.getParameter("Branch");
          int branchid=Integer.parseInt(Branch);
            String mobile = request.getParameter("mobile");
            String email = request.getParameter("email");
            String enquiryfor = request.getParameter("enquirycategory");
            String requirement = request.getParameter("message");
            System.out.println(enquiryfor);
         
           
            String name=cfname+" "+cmname+" "+clname; 
            Enquiry en = new Enquiry();
            en.setEnquiryDate(new Date());
            en.setName(name);
            en.setEmail(email);
            en.setEnquiryType(enquiryfor);
            en.setMobile(mobile);
            en.setOfferGivenByShop("Online Enquiry");
            en.setCustRequirement(requirement);
            HttpSession session1 = request.getSession();
          AdminDao ad=new AdminDao();
          Admin Branchs=ad.getAdminByID(branchid);
            en.setAdminOfBranch(Branchs);
           en.setFollowupDate(new Date());
            EnquiryDao ed = new EnquiryDao();
             boolean b = ed.saveEnquiry(en);
           if (b) {
                    int i = 1;
                    HttpSession session = request.getSession();
                    session.setAttribute("i", i);
                    session.setAttribute("msg", "Inquiry Request Added  Successfully.");
                    response.sendRedirect("Contact_Us.jsp");
                } else {
                    int i = 2;
                    HttpSession session = request.getSession();
                    session.setAttribute("i", i);
                    session.setAttribute("msg", "Something Went Wrong.");
                    response.sendRedirect("Contact_Us.jsp");

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
