/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.admin.controller;

import com.accede.angel.admin.dao.AdminDao;
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
import com.accede.angel.admin.model.SessionKey;
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
@WebServlet(name = "CustomerRentServlet", urlPatterns = {"/CustomerRentServlet"})
public class CustomerRentServlet extends HttpServlet {

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
 String sessionidd = request.getParameter("sessionidd");
  int customerAccountid = Integer.parseInt(request.getParameter("customerAccountid"));
                CustomerAccountDao CustomerAccountDao = new CustomerAccountDao();
                CustomerAccount CustomerAccount = CustomerAccountDao.getCustomerAccountById(customerAccountid);
            System.out.println("sessionidd==="+sessionidd);
            boolean c=true;
            AdminDao AdminDao=new AdminDao();
            List<String> allSessionKey=AdminDao.getAllSessionKey();
            if(allSessionKey.size()>0 && allSessionKey != null )
            {
            if(allSessionKey.contains(sessionidd))
            {
                c=false;
            }else
            {
            SessionKey SessionKey=new SessionKey();
            SessionKey.setSessionkey(sessionidd);
            AdminDao.saveSessionKey(SessionKey);
            }
            }else
            {
            SessionKey SessionKey=new SessionKey();
            SessionKey.setSessionkey(sessionidd);
            AdminDao.saveSessionKey(SessionKey);
            }
            if(c)
            {
               

                String fname = request.getParameter("fname");
                String email = request.getParameter("email");
                String address = request.getParameter("address");
                String proof = request.getParameter("proof");
                String idnumber = request.getParameter("idnumber");
                CustomerAccount.setName(fname);
                CustomerAccount.setAddress(address);
                CustomerAccount.setEmail(email);
                CustomerAccount.setCustomerIdProof(idnumber);
                CustomerAccount.setIdProofType(proof);
                

                int noofdays = Integer.parseInt(request.getParameter("noofdays"));
                int totalamt = Integer.parseInt(request.getParameter("totalamt"));
                int discper = Integer.parseInt(request.getParameter("discper"));
                int discamt = Integer.parseInt(request.getParameter("discamt"));
                int FinalAmount = Integer.parseInt(request.getParameter("FinalAmount"));
                int Deposit = Integer.parseInt(request.getParameter("Deposit"));
                String paymode = request.getParameter("paymode");
                int Paid_ByCust = Integer.parseInt(request.getParameter("Paid_ByCust"));
                int Return_by_Shop = Integer.parseInt(request.getParameter("Return_by_Shop"));
                String Return_by_Date = request.getParameter("Return_by_Date");
                String amountinword = request.getParameter("amountinword");
 String selectedchekbox = request.getParameter("selectedchekbox");
                String RentNo = new DynamicGenerator().rentNoGenerator();
                Rent Rent = new Rent();
                RentDao RentDao = new RentDao();
                List<RentDetails> allrentDetails = new ArrayList<RentDetails>();

                Rent.setIdProofType(proof);
                Rent.setCustomerIdProof(proof);
                Rent.setPaymode(paymode);
                Rent.setCustomerAccount(CustomerAccount);
                Rent.setAdminOfBranch(Branch);
                Rent.setTotalamt(totalamt);
                Rent.setNoOfDays(noofdays);
                Rent.setSecurityDeposite(Deposit);
                Rent.setDiscper(discper);
                Rent.setDiscamt(discamt);
                Rent.setFinalAmount(FinalAmount);
                Rent.setPaid_ByCust(Paid_ByCust);
                Rent.setReturn_by_Shop(Return_by_Shop);
                Rent.setAmountinWord(amountinword);
                Rent.setRentNo(RentNo);
                Rent.setRequestClosedDate(new Date());

                InstrumentDao bd = new InstrumentDao();

                List<Instrument> c1 = bd.getAllInstrumene();
                 if (selectedchekbox != "") {
                        String stringArr[] = selectedchekbox.split(",");
                        System.out.println("******************************");
                        for (int i = 0; i < stringArr.length; i++) {
                            int id = Integer.parseInt(stringArr[i]);
                            System.out.println("id========***" + id);
                            Instrument p = bd.getInstrumentByID(id);

                            RentDetails RentDetails = new RentDetails();
                        RentDetails.setInstrumentName(p.getInstrumentName());
                        RentDetails.setInstrumentRentCost(p.getInstrumentRentCost());
                        RentDetails.setNoofdays(noofdays);
                        RentDetails.setTotalamount(noofdays * p.getInstrumentRentCost());
                        RentDao.saveRentDetails(RentDetails);
                        allrentDetails.add(RentDetails);
                        }

                    }
                
               

                Date d = Dates.getEndingDate1(new Date(), noofdays);
                Rent.setReceivedDate(d);
                Rent.setRentDetails(allrentDetails);
                boolean b = RentDao.saveRent(Rent);
                if (b) {

                    String RentNoo = "Rent No- ";
                    String agains = RentNoo + RentNo;
                    Payment pay = new Payment();
                    pay.setAmount(Deposit);
                    pay.setAdminOfBranch(Branch);
                    pay.setPaymentMode(paymode);
                    pay.setDescription("Customer Rent Payment");
                    pay.setPaymentType("Credit");
                    pay.setPaymentAgains(agains);
                    pay.setCustomerAccount(CustomerAccount);
                    new PaymentDao().savePayment(pay);
                    float bal = CustomerAccount.getAccountBalance();
                    CustomerAccount.setAccountBalance(bal + Deposit);
                    CustomerAccountDao.updateCustomerAccount(CustomerAccount);

                    int i = 1;
                    session.setAttribute("i", i);
                    Rent r = RentDao.getbyRentNo(RentNo);
                    long rentid = r.getId();
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

                    PaymentFollowup PaymentFollowup = new PaymentFollowup();

                    PaymentFollowup.setCustomerAccount(CustomerAccount);
                    PaymentFollowup.setTypeofoffollowup("Rent");
                    PaymentFollowup.setRequestDate(new Date());
                    PaymentFollowup.setNextfollowupdate(d);
                    String message = "Customer Rent," + "\n"
                            + "Rent No:-. " + RentNo + "\n"
                            + "Mobile No:-. " + CustomerAccount.getMobileNo() + "\n"
                            + "Total Rent  Amount. " + FinalAmount + "\n"
                            + "Deposite Amount. " + Deposit + "\n"
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

                    String subject = "Payment Details";
//                    SendMail.mailsend(email, Emailmsg, subject);
                    String  msg="Dear "+CustomerAccount.getName().toUpperCase()+ ","+ "\n"
                     + "Thank you for Choosing Angel Music for Insrument Rent.For any queries visit our website www.angelm.co.in";
                SendMessage.sendMobileMSG(CustomerAccount.getMobileNo(), msg,Branch);
                    SendMessage.sendMobileMSG(CustomerAccount.getMobileNo(), Emailmsg,Branch);
                     session.setAttribute("printInvoiceID", "Rent");
                    session.setAttribute("Rentid", Rent.getId());
                    session.setAttribute("msg", "Rent Request Added  Successfully.");

                    response.sendRedirect("Admin/branchReception/CustRent.jsp?accountid=" + CustomerAccount.getId());

                } else {
                    
                      int i = 2;

                session.setAttribute("i", i);
                session.setAttribute("msg", "Something went Wrong......");
                response.sendRedirect("Admin/branchReception/CustRent.jsp?accountid="+CustomerAccount.getId());
                }
                
                
                 } else {
                int i = 2;

                session.setAttribute("i", i);
                session.setAttribute("msg", "Check That Product Entry Save or Not......");
                response.sendRedirect("Admin/branchReception/CustRent.jsp?accountid="+CustomerAccount.getId());
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
