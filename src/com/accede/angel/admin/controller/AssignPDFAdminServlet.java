/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.admin.controller;

import com.accede.angel.admin.dao.AdminDao;
import com.accede.angel.admin.dao.AssignPDFAdminDao;
import com.accede.angel.admin.dao.SuperAdminPaymentDao;
import com.accede.angel.admin.model.Admin;
import com.accede.angel.admin.model.AssignPDFAdmin;
import com.accede.angel.admin.model.AssignPaymentHistory;
import com.accede.angel.admin.model.SuperAdminPayment;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
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
@WebServlet(name = "AssignPDFAdminServlet", urlPatterns = {"/AssignPDFAdminServlet"})
public class AssignPDFAdminServlet extends HttpServlet {

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
                String coursename = request.getParameter("course");

                int Amount = Integer.parseInt(request.getParameter("Amount"));
                int BranchAdmin = Integer.parseInt(request.getParameter("Branch"));
                Admin Admin = new AdminDao().getAdminByID(BranchAdmin);
                AssignPDFAdminDao AssignPDFAdminDao = new AssignPDFAdminDao();
                AssignPDFAdmin AssignPDFAdmin = new AssignPDFAdmin();
                AssignPDFAdmin = AssignPDFAdminDao.getAssignPDFAdmin(Admin);
                List<AssignPaymentHistory> allAssignPaymentHistory = new ArrayList<AssignPaymentHistory>();
                AssignPaymentHistory AssignPaymentHistory = new AssignPaymentHistory();
                AssignPaymentHistory.setAdmin(Admin);
                AssignPaymentHistory.setAmount(Amount);
                AssignPaymentHistory.setCourse(coursename);
                AssignPDFAdminDao.saveAssignPDFAdmin(AssignPaymentHistory);

                if (AssignPDFAdmin == null) {
                    AssignPDFAdmin = new AssignPDFAdmin();
                    allAssignPaymentHistory.add(AssignPaymentHistory);
                    AssignPDFAdmin.setAdmin(Admin);
                    AssignPDFAdmin.setCourse(coursename);
                    AssignPDFAdmin.setTotalAmount(Amount);
                    AssignPDFAdmin.setAssignPaymentHistory(allAssignPaymentHistory);
                    Boolean b = AssignPDFAdminDao.saveAssignPDFAdmin(AssignPDFAdmin);

                    if (b) {

                         SuperAdminPayment SuperAdminPayment=new SuperAdminPayment();
            SuperAdminPayment.setAmount(Amount);
            SuperAdminPayment.setDescription("Assign PDF to Branch");
            SuperAdminPayment.setPaymentAgainsType("Branch");
            SuperAdminPayment.setPaymentAgains(request.getParameter("Branch"));
            SuperAdminPayment.setPaymentMode("Cash");
            SuperAdminPayment.setPaymentType("Credit");
           new SuperAdminPaymentDao().saveSuperAdminPayment(SuperAdminPayment);
                        
                        
                        int i = 1;
                        session.setAttribute("i", i);
                        session.setAttribute("msg", "Course Added Successfully......");
                        response.sendRedirect("Admin/admin/AssignPDFtoAdmin.jsp");
                    } else {

                        int i = 2;
                        session.setAttribute("i", i);
                        session.setAttribute("msg", "Something Went Wrong......");
                        response.sendRedirect("Admin/admin/AssignPDFtoAdmin.jsp");

                    }
                } else {

                    String coursenamesave = AssignPDFAdmin.getCourse();
                    System.out.println(coursenamesave);
                    coursenamesave = coursenamesave.concat(" ").concat(coursename);
                    int saveamount = AssignPDFAdmin.getTotalAmount();
                    AssignPDFAdmin.setCourse(coursenamesave);
                    AssignPDFAdmin.setTotalAmount(saveamount + Amount);
                    allAssignPaymentHistory = AssignPDFAdmin.getAssignPaymentHistory();

                    allAssignPaymentHistory.add(AssignPaymentHistory);
                    AssignPDFAdmin.setAssignPaymentHistory(allAssignPaymentHistory);
                    Boolean b = AssignPDFAdminDao.update(AssignPDFAdmin);

                    if (b) {
                        
      SuperAdminPayment SuperAdminPayment=new SuperAdminPayment();
            SuperAdminPayment.setAmount(Amount);
            SuperAdminPayment.setDescription("Assign PDF to Branch");
            SuperAdminPayment.setPaymentAgainsType("Branch");
            SuperAdminPayment.setPaymentAgains(request.getParameter("Branch"));
            SuperAdminPayment.setPaymentMode("Cash");
            SuperAdminPayment.setPaymentType("Credit");
           new SuperAdminPaymentDao().saveSuperAdminPayment(SuperAdminPayment);
                        int i = 1;
                        session.setAttribute("i", i);
                        session.setAttribute("msg", "Course Added Successfully......");
                        response.sendRedirect("Admin/admin/AssignPDFtoAdmin.jsp");
                    } else {

                        int i = 2;
                        session.setAttribute("i", i);
                        session.setAttribute("msg", "Something Went Wrong......");
                        response.sendRedirect("Admin/admin/AssignPDFtoAdmin.jsp");

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
