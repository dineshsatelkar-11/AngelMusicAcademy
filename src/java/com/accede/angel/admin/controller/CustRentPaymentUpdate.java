/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.admin.controller;

import com.accede.angel.admin.dao.CustomerAccountDao;
import com.accede.angel.admin.dao.InstrumentDao;
import com.accede.angel.admin.dao.PaymentDao;
import com.accede.angel.admin.dao.PaymentFollowupDao;
import com.accede.angel.admin.dao.RentDao;
import com.accede.angel.admin.model.Admin;
import com.accede.angel.admin.model.CustomerAccount;
import com.accede.angel.admin.model.Instrument;
import com.accede.angel.admin.model.Payment;
import com.accede.angel.admin.model.PaymentFollowup;
import com.accede.angel.admin.model.PaymentFollowupMessage;
import com.accede.angel.admin.model.Rent;
import com.accede.angel.admin.model.RentDetails;
import com.accede.angel.services.Dates;
import com.accede.angel.services.DynamicGenerator;
import com.accede.angel.services.SendMessage;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
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
@WebServlet(name = "CustRentPaymentUpdate", urlPatterns = {"/CustRentPaymentUpdate"})
public class CustRentPaymentUpdate extends HttpServlet {

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

                long rentid = Long.parseLong(request.getParameter("rentid"));
                RentDao RentDao = new RentDao();
                Rent Rent = RentDao.getRentByID(rentid);

                String extraday = request.getParameter("extraDays");
                int extramt = 0;
                String other = request.getParameter("other");
                int otheramt = 0;
                if (!other.equals("")) {
                    otheramt = Integer.parseInt(other);
                }
                if (!extraday.equals("")) {
                    extramt = Integer.parseInt(extraday);
                }
                int noofdays = Integer.parseInt(request.getParameter("noofdays"));
                int totalamt = Integer.parseInt(request.getParameter("totalamt"));
                int discper = Integer.parseInt(request.getParameter("discper"));
                int discamt = Integer.parseInt(request.getParameter("discamt"));
                int FinalAmount = Integer.parseInt(request.getParameter("FinalAmount"));
                int Deposit = Integer.parseInt(request.getParameter("Deposit"));
              
                String paymode = request.getParameter("paymode");
                int Paid_ByCust = Integer.parseInt(request.getParameter("Paid_ByCust"));
                int Return_by_Shop = Integer.parseInt(request.getParameter("Return_by_Shop"));

                String amountinword = request.getParameter("amountinword");

              

                List<RentDetails> allrentDetails = new ArrayList<RentDetails>();

                Rent.setPaymode(paymode);

                Rent.setAdminOfBranch(Branch);
                Rent.setTotalamt(totalamt);
                Rent.setNoOfDays(noofdays);
                Rent.setSecurityDeposite(Paid_ByCust+Deposit);
                Rent.setDiscper(discper);
                Rent.setDiscamt(discamt);
                Rent.setFinalAmount(FinalAmount);
                int alreadypaid=Rent.getPaid_ByCust();
               if(Rent.getPaid_ByCust() > 0)
               {
                   if(Rent.getPaid_ByCust()== Paid_ByCust)
                   {
                Rent.setPaid_ByCust(0);
                 Rent.setCloseRequest(false);
                   }else
                   {
                      Rent.setPaid_ByCust(Rent.getPaid_ByCust()-Paid_ByCust);
                  
                   }
               }else
               {
               Rent.setCloseRequest(false);
               }
                Rent.setReturn_by_Shop(0);
                Rent.setAmountinWord(amountinword);
           
                Rent.setOther(otheramt);
Rent.setExtraDays(extramt);
               
                Rent.setReceivedDate(new Date());

                boolean b = RentDao.saveRent(Rent);
                if (b) {

                    String RentNoo = "Rent No- ";
                    String agains = RentNoo + Rent.getRentNo();
                    Payment pay = new Payment();
                  
                    pay.setAdminOfBranch(Branch);
                    pay.setPaymentMode(paymode);
                    pay.setDescription("Customer Rent Payment");
                    if (Return_by_Shop > 0) {
                        pay.setPaymentType("Debit");
                          pay.setAmount(Return_by_Shop);
                    } else {
                        pay.setPaymentType("Credit");
                          pay.setAmount(Paid_ByCust);
                    }

                    pay.setPaymentAgains(agains);
                    pay.setCustomerAccount(Rent.getCustomerAccount());
                    new PaymentDao().savePayment(pay);

                    int i = 1;
                    session.setAttribute("i", i);
                    Rent r = RentDao.getbyRentNo(Rent.getRentNo());
 Date d = Dates.getEndingDate1(new Date(), 0);
                    String Emailmsg = "";
                    if (Return_by_Shop > 0) {
                        Emailmsg = "Dear Customer," + "\n"
                                + "Thank you for Paying an amount of Rs. " + Deposit + "\n"
                                + "Return Amount by Shop after submitting Instrument on or before " + d + "\n"
                                + " is" + Return_by_Shop + "\n";
                    } else {
                        Emailmsg = "Dear Customer," + "\n"
                                + "Thank you for paying an amount of Rs." + Deposit + "\n"
                                + "You have to Pay an Amount of " + Paid_ByCust + "\n"
                                + " on or before " + d + "\n";

                    }
  if(alreadypaid > 0)
               {
                   if(alreadypaid== Paid_ByCust)
                   {
                     PaymentFollowup PaymentFollowup = new PaymentFollowup();
 d = Dates.getEndingDate1(new Date(), 2);
                    PaymentFollowup.setCustomerAccount(Rent.getCustomerAccount());
                    PaymentFollowup.setTypeofoffollowup("Rent");
                    PaymentFollowup.setRequestDate(new Date());
                    PaymentFollowup.setNextfollowupdate(d);
                    String message = "Customer Rent," + "\n"
                            + "Rent No:-. " + Rent.getId() + "\n"
                            + "Mobile No:-. " + Rent.getCustomerAccount().getMobileNo() + "\n"
                            + "Total Rent  Amount. " + FinalAmount + "\n"
                            + "Paid Amount. " + Deposit + "\n"
                            + "Balance Amount. " + Deposit + "\n"
                            + "Due Date . " + d + "\n";

                    PaymentFollowup.setAdminOfBranch(Branch);
                    PaymentFollowupDao PaymentFollowupDao = new PaymentFollowupDao();
                    PaymentFollowupDao.savePaymentFollowup(PaymentFollowup);
                    int paymentId = new PaymentFollowupDao().getLastPaymentFollowupID();
                    if (paymentId != 0) {
                        PaymentFollowupMessage PaymentFollowupMessage = new PaymentFollowupMessage();
                        PaymentFollowup = PaymentFollowupDao.getPaymentFollowupByID(paymentId);
                        PaymentFollowupMessage.setDescription(message);
                        PaymentFollowupMessage.setFollowupdate(d);
                        PaymentFollowupMessage.setPaymentFollowup(PaymentFollowup);

                        PaymentFollowupDao.savePaymentFollowupMessage(PaymentFollowupMessage);
                    }
                   }}
                    
                    String subject = "Payment Details";
//                    SendMail.mailsend(email, Emailmsg, subject);
                    SendMessage.sendMobileMSG(Rent.getCustomerAccount().getMobileNo(), Emailmsg);
                    session.setAttribute("Rentid", rentid);
                       session.setAttribute("printInvoiceID", "Rent");
                    session.setAttribute("msg", "Rent Request Added  Successfully.");

                    response.sendRedirect("Admin/branchReception/CustRent.jsp?accountid="+Rent.getCustomerAccount().getId() );

                } else {
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
