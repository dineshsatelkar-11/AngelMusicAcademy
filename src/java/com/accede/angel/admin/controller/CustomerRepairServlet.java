/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.admin.controller;

import com.accede.angel.admin.dao.AdminDao;
import com.accede.angel.admin.dao.CustomerAccountDao;
import com.accede.angel.admin.dao.InstrumentDao;
import com.accede.angel.admin.dao.InstrumentRepairdao;
import com.accede.angel.admin.dao.PaymentDao;
import com.accede.angel.admin.dao.PaymentFollowupDao;
import com.accede.angel.admin.dao.RentDao;
import com.accede.angel.admin.dao.RepairDao;
import com.accede.angel.admin.model.Admin;
import com.accede.angel.admin.model.CustomerAccount;
import com.accede.angel.admin.model.Instrument;
import com.accede.angel.admin.model.InstrumentRepair;
import com.accede.angel.admin.model.Payment;
import com.accede.angel.admin.model.PaymentFollowup;
import com.accede.angel.admin.model.PaymentFollowupMessage;
import com.accede.angel.admin.model.Rent;
import com.accede.angel.admin.model.RentDetails;
import com.accede.angel.admin.model.Repair;
import com.accede.angel.admin.model.RepairDetails;
import com.accede.angel.admin.model.SessionKey;
import com.accede.angel.services.Dates;
import com.accede.angel.services.DynamicGenerator;
import com.accede.angel.services.SendMessage;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
@WebServlet(name = "CustomerRepairServlet", urlPatterns = {"/CustomerRepairServlet"})
public class CustomerRepairServlet extends HttpServlet {

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
                System.out.println("sessionidd===" + sessionidd);
                boolean c = true;
                AdminDao AdminDao = new AdminDao();
                List<String> allSessionKey = AdminDao.getAllSessionKey();
                if (allSessionKey.size() > 0 && allSessionKey != null) {
                    if (allSessionKey.contains(sessionidd)) {
                        c = false;
                    } else {
                        SessionKey SessionKey = new SessionKey();
                        SessionKey.setSessionkey(sessionidd);
                        AdminDao.saveSessionKey(SessionKey);
                    }
                } else {
                    SessionKey SessionKey = new SessionKey();
                    SessionKey.setSessionkey(sessionidd);
                    AdminDao.saveSessionKey(SessionKey);
                }
                if (c) {

                    String fname = request.getParameter("fname");
                    String email = request.getParameter("email");
                    String address = request.getParameter("address");

                    CustomerAccount.setName(fname);
                    CustomerAccount.setAddress(address);
                    CustomerAccount.setEmail(email);

                    int totalamt = Integer.parseInt(request.getParameter("totalamt"));
                    int discper = Integer.parseInt(request.getParameter("discper"));
                    int discamt = Integer.parseInt(request.getParameter("discamt"));
                    int FinalAmount = Integer.parseInt(request.getParameter("FinalAmount"));
                    int Paid = Integer.parseInt(request.getParameter("Paid"));
                    String paymode = request.getParameter("paymode");
                    int Bal = Integer.parseInt(request.getParameter("Bal"));

                    String Return_by_Date = request.getParameter("Return_by_Date");
                    String amountinword = request.getParameter("amountinword");
                    String selectedchekbox = request.getParameter("selectedchekbox");
                    String selectedbrand = request.getParameter("selectedbrand");
                    System.out.println("==selectedbrand="+selectedbrand);
                    String selectedmodel = request.getParameter("selectedmodel");
                      System.out.println("==selectedmodel="+selectedmodel);
                    String selectedremark = request.getParameter("selectedremark");
                        System.out.println("==selectedremark="+selectedmodel);
                     Map<Integer, String> mybrand = new HashMap<Integer, String>();
                    Map<Integer, String> mymodel = new HashMap<Integer, String>();
                    Map<Integer, String> myremark = new HashMap<Integer, String>();

                    if (selectedbrand != "") {
                             System.out.println("==selectedbrand=:--"+selectedbrand);
                           if (selectedbrand != "0") {
                                    System.out.println("==selectedbrand="+selectedbrand);
                        String stringArr[] = selectedbrand.split(",");
                         for (int i = 0; i < stringArr.length; i++) {
                            String stringArr1[] = stringArr[i].split("&");
                            mybrand.put(Integer.parseInt(stringArr1[0]), stringArr1[1]);
                        }
                    }}
                    if (selectedmodel != "") {
                          if (selectedmodel != "0") {
                        String stringArr[] = selectedmodel.split(",");
                        System.out.println("******************************");
                        for (int i = 0; i < stringArr.length; i++) {
                            String stringArr1[] = stringArr[i].split("&");
                            mymodel.put(Integer.parseInt(stringArr1[0]), stringArr1[1]);
                        }
                             }}
                    if (selectedremark != "") {
                          if (selectedremark != "0") {
               
                        String stringArr[] = selectedremark.split(",");
                        System.out.println("******************************");
                        for (int i = 0; i < stringArr.length; i++) {
                            String stringArr1[] = stringArr[i].split("&");
                            myremark.put(Integer.parseInt(stringArr1[0]), stringArr1[1]);
                        }
                           }}
                    
                    
                  
                    String RepairNo = new DynamicGenerator().repairNoGenerator();
                    Repair Repair = new Repair();
                    RepairDao RepairDao = new RepairDao();
                    List<RepairDetails> allRepairDetails = new ArrayList<RepairDetails>();

                    Repair.setPaymode(paymode);
                    Repair.setCustomerAccount(CustomerAccount);
                    Repair.setAdminOfBranch(Branch);
                    Repair.setTotalamt(totalamt);

                    Repair.setPaid(Paid);
                    Repair.setDiscper(discper);
                    Repair.setDiscamt(discamt);
                    Repair.setFinalAmount(FinalAmount);
                    Repair.setBal(Bal);

                    Repair.setAmountinWord(amountinword);
                    Repair.setRepairNo(RepairNo);
                    Repair.setRequestClosedDate(new Date());

                    InstrumentRepairdao bd = new InstrumentRepairdao();

                    if (selectedchekbox != "") {
                        String stringArr[] = selectedchekbox.split(",");
                        System.out.println("******************************");
                        for (int i = 0; i < stringArr.length; i++) {
                            int id = Integer.parseInt(stringArr[i]);
                            System.out.println("id========***" + id);
                            InstrumentRepair p = bd.getInstrumentByID(id);

                            RepairDetails RepairDetails = new RepairDetails();
                            RepairDetails.setInstrumentName(p.getInstrumentName());
                            RepairDetails.setInstrumentRepairCost(p.getInstrumentRepairCost());

                            String brand = "NA";
                            String model = "NA";
                            String remark = "NA";
                            if (mybrand.containsKey(p.getInstrumentId())) {
                                brand = (String) mybrand.get(p.getInstrumentId());
                            }
                            if (mymodel.containsKey(p.getInstrumentId())) {
                                model = (String) mymodel.get(p.getInstrumentId());
                            }
                            if (myremark.containsKey(p.getInstrumentId())) {
                                remark = (String) myremark.get(p.getInstrumentId());
                            }

                            RepairDetails.setInstrumentBrand(brand);
                            RepairDetails.setInstrumentModel(model);
                            RepairDetails.setInstrumentRemark(remark);
                            RepairDao.saveRepairDetails(RepairDetails);
                            allRepairDetails.add(RepairDetails);
                        }

                    }

                    Date FollowpDate = new Date();

                    try {
                        FollowpDate = new SimpleDateFormat("yyyy-MM-dd").parse(Return_by_Date);

                    } catch (ParseException ex) {
                        ex.printStackTrace();
                    }
                    Date FollowpDate1 = new Date();
                    long diff = Dates.getDifferenceDays(FollowpDate, new Date());
                    if (diff > 3) {
                        FollowpDate1 = Dates.getEndingDate1(FollowpDate, -2);
                    }

                    Repair.setReceivedDate(FollowpDate);
                    Repair.setDuedateSmsdate(FollowpDate);
                    Repair.setRepairDetails(allRepairDetails);
                    System.out.print("Repair=" + Repair);
                    boolean b = RepairDao.saveRepair(Repair);
                    if (b) {

                        String Repairr = "Repair No- ";
                        String agains = Repairr + RepairNo;
                        Payment pay = new Payment();
                        pay.setAmount(Paid);
                        pay.setAdminOfBranch(Branch);
                        pay.setPaymentMode(paymode);
                        pay.setDescription("Customer Repair Payment");
                        pay.setPaymentType("Credit");
                        pay.setPaymentAgains(agains);
                        pay.setCustomerAccount(CustomerAccount);
                        new PaymentDao().savePayment(pay);

                        CustomerAccountDao.updateCustomerAccount(CustomerAccount);

                        int i = 1;
                        session.setAttribute("i", i);
//                    Repair r = RepairDao.getbyRepairtNo(RepairNo);
//                    System.out.println("RepairNo=="+RepairNo);
//                    System.out.println("Repair=="+Repair);
//                    long rentid = r.getRepairId();

                        String Emailmsg = "Dear Customer," + "\n"
                                + "Thanku for paying an amount of Rs. " + Paid + "\n"
                                + "Balance Amount is  " + Bal + "\n"
                                + "Return Date is" + FollowpDate + "\n";

                        PaymentFollowup PaymentFollowup = new PaymentFollowup();

                        PaymentFollowup.setCustomerAccount(CustomerAccount);

                        PaymentFollowup.setRequestDate(new Date());
                        PaymentFollowup.setNextfollowupdate(FollowpDate1);
                        String message = "Customer Repair," + "\n"
                                + "repair No:-. " + RepairNo + "\n"
                                + "Mobile No:-. " + CustomerAccount.getMobileNo() + "\n"
                                + "Total Repair  Amount. " + FinalAmount + "\n"
                                + "Paid Amount. " + Paid + "\n"
                                + "Return Date . " + FollowpDate + "\n";

                        PaymentFollowup.setAdminOfBranch(Branch);
                        PaymentFollowupDao PaymentFollowupDao = new PaymentFollowupDao();
                         PaymentFollowup.setTypeofoffollowup("Repair");
                        PaymentFollowupDao.savePaymentFollowup(PaymentFollowup);
                       
                        int paymentId = new PaymentFollowupDao().getLastPaymentFollowupID();
                        if (paymentId != 0) {
                            PaymentFollowupMessage PaymentFollowupMessage = new PaymentFollowupMessage();
                            PaymentFollowup = PaymentFollowupDao.getPaymentFollowupByID(paymentId);
                            PaymentFollowupMessage.setDescription(message);
                            PaymentFollowupMessage.setFollowupdate(FollowpDate1);
                            PaymentFollowupMessage.setPaymentFollowup(PaymentFollowup);
                            PaymentFollowupDao.savePaymentFollowupMessage(PaymentFollowupMessage);
                        }

                        String subject = "Payment Details";
//                    SendMail.mailsend(email, Emailmsg, subject);
                        String msg = "Dear " + CustomerAccount.getName().toUpperCase() + "," + "\n"
                                + "Thank you for Choosing Angel Music for Insrument Repair.For any queries visit our website www.angelm.co.in";
                        SendMessage.sendMobileMSG(CustomerAccount.getMobileNo(), msg, Branch);
                        SendMessage.sendMobileMSG(CustomerAccount.getMobileNo(), Emailmsg, Branch);
                        session.setAttribute("printInvoiceID", "Repair");
                        session.setAttribute("repairid", Repair.getRepairId());
                        session.setAttribute("msg", "Repair Request Added  Successfully.");

                        System.out.println("session.getAttribute(\"printInvoiceID\")===" + session.getAttribute("printInvoiceID"));
                        System.out.println("repairid===" + session.getAttribute("repairid"));
                        response.sendRedirect("Admin/branchReception/CustRepair.jsp?accountid=" + CustomerAccount.getId());

                    } else {

                        int i = 2;
                        session.setAttribute("i", i);
                        session.setAttribute("msg", "Something Went Wrong......");
                        response.sendRedirect("Admin/branchReception/CustRepair.jsp?accountid=" + CustomerAccount.getId());
                    }
                } else {

                    int i = 2;
                    session.setAttribute("i", i);
                    session.setAttribute("msg", "Check That Product Entry Save or Not......");
                    response.sendRedirect("Admin/branchReception/CustRepair.jsp?accountid=" + CustomerAccount.getId());
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
