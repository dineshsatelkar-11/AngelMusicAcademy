/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.admin.controller;

import com.accede.angel.admin.dao.EnquiryDao;
import com.accede.angel.admin.model.Admin;
import com.accede.angel.admin.model.Enquiry;
import com.accede.angel.services.SendMessage;
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
 * @author Accede
 */
@WebServlet(name = "EnquryServlet", urlPatterns = {"/EnquryServlet"})
public class EnquryServlet extends HttpServlet {

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
            Admin Branch = (Admin) session1.getAttribute("BRANCH_ADMIN");
            if (Branch != null) {
                String name = request.getParameter("Inquiry_Name");
                String mobile = request.getParameter("Inquiry_Mobile_No");
                String email = request.getParameter("Inquiry_Email_Id");
                String enquiryfor = request.getParameter("Inquiry_Type");
                String ref = request.getParameter("ref");
                String requirement = request.getParameter("requirement");
                String offer = request.getParameter("offer");
                String follow = request.getParameter("nxtdate1");
                Enquiry en = new Enquiry();
                en.setEnquiryDate(new Date());
                en.setName(name);
                en.setEmail(email);
                en.setEnquiryType(enquiryfor);
                en.setMobile(mobile);
                en.setOfferGivenByShop(offer);
                en.setCustRequirement(requirement);
                en.setReference(ref);

                en.setAdminOfBranch(Branch);
                try {
                    en.setFollowupDate(new SimpleDateFormat("yyyy-MM-dd").parse(follow));
                } catch (ParseException ex) {
                    ex.printStackTrace();
                }
                EnquiryDao ed = new EnquiryDao();
                boolean b = ed.saveEnquiry(en);
                if (b) {
                    String type1 = (String) session1.getAttribute("BRANCH_ADMIN1");
                    if (type1.equals("Branch_Admin")) {
                     
                         String message = "Thanks for Visiting us.!!" + "\n"
                             +    "For More Details "+"\n" 
                       +  "https://www.angelm.in"+"\n"
                       +  "Angel Music";
                        
                         SendMessage.sendMobileMSG(mobile, message,Branch);
                        
                        int i = 1;
                        HttpSession session = request.getSession();
                        session.setAttribute("i", i);
                        session.setAttribute("msg", "Inquiry Request Added  Successfully.");
                        response.sendRedirect("Admin/branchReception/branchReceptionIndex.jsp");
                    } else {
                        
                         String message = "Thanks for Visiting us.!!" + "\n"
                             +    "For More Details "+"\n" 
                       +  "https://www.angelm.in"+"\n"
                       +  "Angel Music";
                        
                         SendMessage.sendMobileMSG(mobile, message,Branch);
                        int i = 1;
                        HttpSession session = request.getSession();
                        session.setAttribute("i", i);
                        session.setAttribute("msg", "Inquiry Request Added  Successfully.");
                        response.sendRedirect("Admin/branchReception/branchReceptionIndex.jsp");

                    }
                } else {
                    String type1 = (String) session1.getAttribute("BRANCH_ADMIN1");
                    if (type1.equals("Branch_Admin")) {
                        int i = 2;
                        HttpSession session = request.getSession();
                        session.setAttribute("i", i);
                        response.sendRedirect("Admin/branchReception/branchReceptionIndex.jsp");
                    } else {
                        int i = 2;
                        HttpSession session = request.getSession();
                        session.setAttribute("i", i);
                        response.sendRedirect("Admin/branchReception/branchReceptionIndex.jsp");
                    }
                }
            } else {

                int i = 2;
                HttpSession session = request.getSession();
                session.setAttribute("i", i);
                session.setAttribute("msg", "Your Session is Log Out.Please Login ones Again.");
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
