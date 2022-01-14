/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.admin.controller;

import com.accede.angel.admin.dao.AdmissionDao;
import com.accede.angel.admin.dao.EnquiryDao;
import com.accede.angel.admin.model.Admission;
import com.accede.angel.admin.model.Enquiry;
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
@WebServlet(name = "DeleteInquiry", urlPatterns = {"/DeleteInquiry"})
public class DeleteInquiry extends HttpServlet {

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
            Enquiry ad = new Enquiry();
            EnquiryDao add = new EnquiryDao();
            int custid = Integer.parseInt(request.getParameter("studentidd"));
            ad = add.getEnquiryByID(custid);
            ad.setDeleteEnquiry(false);
            boolean b = add.update(ad);
            HttpSession session = request.getSession();
            HttpSession session1 = request.getSession();
            if (b) {
                int i = 1;
                String type1 = (String) session1.getAttribute("BRANCH_ADMIN1");
                if (type1.equals("Branch_Admin")) {

                    session.setAttribute("i", i);
                    session.setAttribute("msg", "Inquiry Deleted Successfully");
//                out.println("<script type=\"text/javascript\">");
//                out.println("alert('Subject Added successfully');");
//                out.println("location='Admin/admin/addSubject.jsp';");
//                out.println("</script>");
                    response.sendRedirect("Admin/branchReception/Followupinquiry.jsp");
                } else {

                    session.setAttribute("i", i);
                    session.setAttribute("msg", "Inquiry Deleted Successfully");
//                out.println("<script type=\"text/javascript\">");
//                out.println("alert('Subject Added successfully');");
//                out.println("location='Admin/admin/addSubject.jsp';");
//                out.println("</script>");
                    response.sendRedirect("Admin/branchAdmin/Followupinquiry.jsp");
                }
            } else {
                String type1 = (String) session1.getAttribute("BRANCH_ADMIN1");
                if (type1.equals("Branch_Admin")) {
                    int i = 2;

                    session.setAttribute("i", i);
                    session.setAttribute("msg", "Something Went Wrong..");
                    response.sendRedirect("Admin/branchReception/Followupinquiry.jsp");
                } else {
                    int i = 2;
                    session.setAttribute("i", i);
                    session.setAttribute("msg", "Something Went Wrong..");
                    response.sendRedirect("Admin/branchAdmin/Followupinquiry.jsp");

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
