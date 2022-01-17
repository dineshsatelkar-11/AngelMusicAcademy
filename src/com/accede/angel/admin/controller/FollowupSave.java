/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.admin.controller;

import com.accede.angel.admin.dao.CustomerAccountDao;
import com.accede.angel.admin.dao.PaymentFollowupDao;
import com.accede.angel.admin.model.Admin;
import com.accede.angel.admin.model.CustomerAccount;
import com.accede.angel.admin.model.PaymentFollowup;
import com.accede.angel.admin.model.PaymentFollowupMessage;
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
 * @author Admin
 */
@WebServlet(name = "FollowupSave", urlPatterns = {"/FollowupSave"})
public class FollowupSave extends HttpServlet {

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
                PaymentFollowupDao PaymentFollowupDao = new PaymentFollowupDao();
                int srrequestid = Integer.parseInt(request.getParameter("srrequestid"));
                PaymentFollowup PaymentFollowup = PaymentFollowupDao.getPaymentFollowupByID(srrequestid);

                String type_remark = request.getParameter("type_remark");
                String nxtdate = request.getParameter("nxtdate");
                String Remark = request.getParameter("Remark");

                PaymentFollowupMessage PaymentFollowupMessage = new PaymentFollowupMessage();
                PaymentFollowupMessage.setDescription(Remark);
                PaymentFollowupMessage.setPaymentFollowup(PaymentFollowup);
                boolean b = PaymentFollowupDao.savePaymentFollowupMessage(PaymentFollowupMessage);
                if (b) {
                    if (type_remark.equals("Followup Remark")) {

                        try {

                            PaymentFollowup.setNextfollowupdate(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("nxtdate")));
                        } catch (ParseException ex) {
                            ex.printStackTrace();
                        }
                    } else {

                        PaymentFollowup.setRequeststatus(false);
                        PaymentFollowup.setRequestClosedDate(new Date());
                    }
                    
                    System.out.println(PaymentFollowup);
                    b = PaymentFollowupDao.updatePaymentFollowup(PaymentFollowup);
                    if (b) {
                         int i = 1;
                    session.setAttribute("i", i);
                    session.setAttribute("msg", "Remark save successfully......");
                    response.sendRedirect("Admin/branchReception/ViewFollowup.jsp?paymentfollowId=" + srrequestid);
               
                    } else {
                        
                         int i = 2;
                    session.setAttribute("i", i);
                    session.setAttribute("msg", "Something went wrong......");
                    response.sendRedirect("Admin/branchReception/ViewFollowup.jsp?paymentfollowId=" + srrequestid);
               
                    }
                } else {
                    int i = 2;
                    session.setAttribute("i", i);
                    session.setAttribute("msg", "Something went wrong......");
                    response.sendRedirect("Admin/branchReception/ViewFollowup.jsp?paymentfollowId=" + srrequestid);
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
