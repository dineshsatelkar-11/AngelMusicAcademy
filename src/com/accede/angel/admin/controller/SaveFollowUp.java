/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.admin.controller;

import com.accede.angel.admin.dao.EnquiryDao;
import com.accede.angel.admin.model.Enquiry;
import com.accede.angel.admin.model.EnquiryDetail;
import com.accede.angel.admin.model.StudentAccount;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Accede
 */
@WebServlet(name = "SaveFollowUp", urlPatterns = {"/SaveFollowUp"})
public class SaveFollowUp extends HttpServlet {

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
            int enquiryid = Integer.parseInt(request.getParameter("enquiryid"));
           
            String Remark = request.getParameter("remark");
            String counsellorname = request.getParameter("counsellorname");
            String type_remark = request.getParameter("type_remark");
            String follow = request.getParameter("follow");
            EnquiryDao ed = new EnquiryDao();
            Enquiry en = new Enquiry();
            en = ed.getEnquiryByID(enquiryid);
            List<EnquiryDetail> end = new ArrayList<EnquiryDetail>();
            EnquiryDetail enquiryDetail = new EnquiryDetail();
            end = en.getEnquiryDetail();
            enquiryDetail.setCounsellorName(counsellorname);
            enquiryDetail.setFollowupDate(new Date());
            enquiryDetail.setRemark(Remark);
            ed.saveEnquiryDetail(enquiryDetail);
            end.add(enquiryDetail);
            en.setCustRequirement(en.getCustRequirement() );
            en.setOfferGivenByShop(en.getOfferGivenByShop() );

            try {
                en.setFollowupDate(new SimpleDateFormat("yyyy-MM-dd").parse(follow));
            } catch (ParseException ex) {
                ex.printStackTrace();
            }
            en.setEnquiryDetail(end);
            if(type_remark.equals("Closure Remark"))
            {
                en.setRemove(false);
            }
            HttpSession session1 = request.getSession();
            boolean b = ed.saveEnquiry(en);
            if (b) {
                int i = 1;

                String type1 = (String) session1.getAttribute("BRANCH_ADMIN1");
                if (type1.equals("Branch_Admin")) {
                    HttpSession session = request.getSession();
                    session.setAttribute("i", i);
                      session.setAttribute("msg", "Followup  Request Added  Successfully.");
                    response.sendRedirect("Admin/branchReception/Followupinquiry.jsp?srrequestid="+enquiryid);
                } else {
                    HttpSession session = request.getSession();
                    session.setAttribute("i", i);
                     session.setAttribute("msg", "Followup  Request Added  Successfully.");
                    response.sendRedirect("Admin/branchReception/Followupinquiry.jsp?srrequestid="+enquiryid);

                }
            } else {
                 String type1 = (String) session1.getAttribute("BRANCH_ADMIN1");
                if (type1.equals("Branch_Admin")) {
                int i = 2;
                HttpSession session = request.getSession();
                session.setAttribute("i", i);
                session.setAttribute("msg", "Something Went Wrong");
                response.sendRedirect("Admin/branchReception/Followupinquiry.jsp?srrequestid="+enquiryid);
                }
            else
                {
                      int i = 2;
                HttpSession session = request.getSession();
                session.setAttribute("i", i);
                    session.setAttribute("msg", "Something Went Wrong");
                response.sendRedirect("Admin/branchReception/Followupinquiry.jsp?srrequestid="+enquiryid);
                }}

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
