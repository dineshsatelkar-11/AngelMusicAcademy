/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.admin.controller;

import com.accede.angel.admin.dao.AccountHistoryDao;
import com.accede.angel.admin.dao.ExternalAccountDao;
import com.accede.angel.admin.dao.PaymentDao;
import com.accede.angel.admin.model.AccountHistory;
import com.accede.angel.admin.model.Admin;
import com.accede.angel.admin.model.ExternalAccount;
import com.accede.angel.admin.model.Payment;
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
 * @author asd
 */
@WebServlet(name = "AddAccountHistory", urlPatterns = {"/AddAccountHistory"})
public class AddAccountHistory extends HttpServlet {

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
            String paymentAgains = request.getParameter("paymentAgains");
            String paymentAgains1 = request.getParameter("paymentAgains1");
            int amount = Integer.parseInt(request.getParameter("amount"));
            int accountid = Integer.parseInt(request.getParameter("accountid"));
               ExternalAccountDao ed = new ExternalAccountDao();
                ExternalAccount es = ed.getExternalAccountByID(accountid);
            String PaymentType = request.getParameter("PaymentType");
            String bankName = request.getParameter("bankName");
            String transctionno = request.getParameter("transctionno");
            
            
            
            HttpSession session1 = request.getSession();
            Admin Branch = (Admin) session1.getAttribute("BRANCH_ADMIN");
            Payment pay = new Payment();
            pay.setAmount(amount);
          
            pay.setAdminOfBranch(Branch);
            pay.setPaymentMode(PaymentType);
            pay.setPaymentType("Debit");
            pay.setDescription("Vendor Amount");
            pay.setCustomerAccount(es.getCustomerAccount());
            pay.setPaymentAgains(paymentAgains1+paymentAgains);
            boolean b = new PaymentDao().savePayment(pay);
            
            if (b) {
                
             
                AccountHistory ah = new AccountHistory();
                
                ah.setAmount(amount);
                ah.setBankName(bankName);
                ah.setAdminOfBranch(Branch);
                ah.setPaymentMode(PaymentType);
                
                ah.setTransctionNo(transctionno);
                ah.setPaymentAgains(paymentAgains);
                ah.setExternalAccount(es);
                AccountHistoryDao ad=new AccountHistoryDao();
                ad.saveAccountHistory(ah);
                int i = 1;
                HttpSession session = request.getSession();
                session.setAttribute("i", i);
                session.setAttribute("msg", "Expense Added Succefully !!!");
                
                response.sendRedirect("Admin/branchReception/CreateAccount.jsp");
            } else {
                int i = 2;
                HttpSession session = request.getSession();
                session.setAttribute("i", i);
                session.setAttribute("msg", "Something Went Wrong !!!");
                response.sendRedirect("Admin/branchReception/CreateAccount.jsp");
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
