/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.sell.controller;

import com.accede.angel.admin.dao.PaymentDao;
import com.accede.angel.admin.dao.PaymentFollowupDao;
import com.accede.angel.admin.model.Admin;
import com.accede.angel.admin.model.Payment;
import com.accede.angel.admin.model.PaymentFollowup;
import com.accede.angel.admin.model.PaymentFollowupMessage;
import com.accede.angel.sell.dao.CustomerSaleDAO;
import com.accede.angel.sell.dao.SellPaymentHistoryDao;
import com.accede.angel.sell.model.CustomerSale;
import com.accede.angel.sell.model.SellPaymentHistory;
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
@WebServlet(name = "AddPayment", urlPatterns = {"/AddPayment"})
public class AddPayment extends HttpServlet {

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

                CustomerSale cs = new CustomerSale();
                CustomerSaleDAO csd1 = new CustomerSaleDAO();
                String sellid = request.getParameter("sellid");
                String PaidAmount = request.getParameter("PaidAmount");

                int selllid = Integer.parseInt(sellid);
                float paidamtamt = Float.parseFloat(PaidAmount);
                cs = csd1.getpurchaseByID(selllid);
                float alreadypaid = cs.getPaidamt();
                float advance = cs.getAdvance_Amount();
                float netpaymentamout = cs.getNet_Advance_Amount();

                alreadypaid = alreadypaid + paidamtamt;
                float balanceamount = netpaymentamout - alreadypaid;
                cs.setPaidamt(alreadypaid);
                cs.setBalamt(balanceamount);
                if(balanceamount>0)
                {
                    cs.setCloseRequest(false);
                }
                Boolean b = csd1.saveBrachsaleupdate(cs);
                if (b) {
                    SellPaymentHistory SellPaymentHistory = new SellPaymentHistory();
                    SellPaymentHistory.setCustomerAccount(cs.getCustomerAccount());
                    SellPaymentHistory.setCustomerSale(cs);
                    SellPaymentHistory.setPaidamt(paidamtamt);
                    new SellPaymentHistoryDao().saveSellPaymentHistory(SellPaymentHistory);
                    String message = "";

                    if (balanceamount > 0) {
                        PaymentFollowup PaymentFollowup = new PaymentFollowup();

                        PaymentFollowup.setCustomerAccount(cs.getCustomerAccount());
                        Date nextdate = new Date();
                        try {

                            nextdate = (new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("nextpaymentdate")));
                        } catch (ParseException ex) {
                            ex.printStackTrace();
                        }

                        PaymentFollowup.setRequestDate(new Date());
                        PaymentFollowup.setNextfollowupdate(nextdate);
                        PaymentFollowup.setTypeofoffollowup("Sell");
                        message = "Customer Sell," + "\n"
                                + "Sell No:-. " + cs.getId() + "\n"
                                + "Mobile No:-. " + cs.getCustomerAccount().getMobileNo() + "\n"
                                + "Total Billing Amount. " + netpaymentamout + "\n"
                                + "Paid Amount. " + (alreadypaid + advance) + "\n"
                                + "Balance Amount. " + balanceamount + "\n";

                        PaymentFollowup.setAdminOfBranch(Branch);
                        PaymentFollowupDao PaymentFollowupDao = new PaymentFollowupDao();
                        PaymentFollowupDao.savePaymentFollowup(PaymentFollowup);
                        int paymentId = new PaymentFollowupDao().getLastPaymentFollowupID();
                        if (paymentId != 0) {
                            PaymentFollowupMessage PaymentFollowupMessage = new PaymentFollowupMessage();
                            PaymentFollowup = PaymentFollowupDao.getPaymentFollowupByID(paymentId);
                            PaymentFollowupMessage.setDescription(message);
                            PaymentFollowupMessage.setFollowupdate(nextdate);
                            PaymentFollowupMessage.setPaymentFollowup(PaymentFollowup);
                            PaymentFollowupDao.savePaymentFollowupMessage(PaymentFollowupMessage);
                        }
                    }

                    Payment pay = new Payment();
                    pay.setAmount((int) (paidamtamt));

                    pay.setAdminOfBranch(Branch);
                    pay.setPaymentMode("Cash");
                    pay.setPaymentType("Credit");
                    pay.setCustomerAccount(cs.getCustomerAccount());
                    pay.setDescription(message);
                    pay.setPaymentAgains("Sell No:-. " + cs.getId());
                    new PaymentDao().savePayment(pay);
  
                    int i = 1;
                    session.setAttribute("i", i);
                    session.setAttribute("msg", "Payment Receive Successfully......");
 session.setAttribute("printInvoiceID", "Sell");
                session.setAttribute("Sellid", cs.getId());
                response.sendRedirect("Admin/branchReception/CustomerSaleReport.jsp?accountid="+cs.getCustomerAccount().getId());
          
                  
                  
                } else {

                    int i = 2;

                    session.setAttribute("i", i);
                    session.setAttribute("msg", "Something Went wrong......");
                    response.sendRedirect("Admin/branchReception/PaymentHistory.jsp?purchaseid=" + selllid);
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
