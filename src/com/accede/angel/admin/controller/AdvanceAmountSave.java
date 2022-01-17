/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.admin.controller;

import com.accede.angel.admin.dao.CustomerAccountDao;
import com.accede.angel.admin.dao.PaymentDao;
import com.accede.angel.admin.model.Admin;
import com.accede.angel.admin.model.CustomerAccount;
import com.accede.angel.admin.model.Payment;
import com.accede.angel.sell.dao.AdvanceAmountDao;
import com.accede.angel.sell.model.AdvanceAmount;
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
 * @author Admin
 */
@WebServlet(name = "AdvanceAmountSave", urlPatterns = {"/AdvanceAmountSave"})
public class AdvanceAmountSave extends HttpServlet {

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
                
                int customerAccountid = Integer.parseInt(request.getParameter("customerAccountid"));
                CustomerAccountDao CustomerAccountDao = new CustomerAccountDao();
                CustomerAccount CustomerAccount = CustomerAccountDao.getCustomerAccountById(customerAccountid);
                
                String DueDate = request.getParameter("DueDate");
                int amount = Integer.parseInt(request.getParameter("amount"));
                String Reason = request.getParameter("Reason");
                AdvanceAmountDao AdvanceAmountDao = new AdvanceAmountDao();
                AdvanceAmount AdvanceAmount = new AdvanceAmount();
                AdvanceAmount.setAmount(amount);
                AdvanceAmount.setCustomerAccount(CustomerAccount);
                AdvanceAmount.setReason(Reason);
                Date dusdate = new Date();
                try {
                    dusdate = new SimpleDateFormat("yyyy-MM-dd").parse(DueDate);
                    
                } catch (ParseException ex) {
                    ex.printStackTrace();
                }
                
                AdvanceAmount.setDueDate(dusdate);
                
                Boolean b = AdvanceAmountDao.saveAdvanceAmount(AdvanceAmount);
                if (b) {
                    float advanceamount = CustomerAccount.getAdvanceAmount();
                    advanceamount = advanceamount + amount;
                    CustomerAccount.setAdvanceAmount(advanceamount);
                    CustomerAccountDao.updateCustomerAccount(CustomerAccount);
                     String  message = "Customer Advance Payment," + "\n"
                            + "Thanku for paying an amount of Rs. " + amount + "\n";
   SendMessage.sendMobileMSG(CustomerAccount.getMobileNo(), message,Branch);
   
   
  
                        String agains = Reason;
                        Payment pay = new Payment();
                        pay.setAmount(amount);
                        pay.setDescription(Reason);
                        pay.setAdminOfBranch(Branch);
                        pay.setPaymentMode("Cash");
                        pay.setPaymentType("Credit");
                        pay.setCustomerAccount(CustomerAccount);
                        pay.setPaymentAgains(agains);
                        new PaymentDao().savePayment(pay);
                    int i = 1;
                    session.setAttribute("i", i);
                    session.setAttribute("msg", "Advance Take Succssfully......");
                    response.sendRedirect("Admin/branchReception/AllAccounts.jsp");
                    
                    
                    
                } else {
                    
                    int i = 2;
                    session.setAttribute("i", i);
                    session.setAttribute("msg", "Something Went Wrong......");
                    response.sendRedirect("Admin/branchReception/AllAccounts.jsp");
                    
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
