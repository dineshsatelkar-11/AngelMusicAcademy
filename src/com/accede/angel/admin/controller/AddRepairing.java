///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package com.accede.angel.admin.controller;
//
//import com.accede.angel.admin.dao.EnquiryDao;
//import com.accede.angel.admin.dao.PaymentDao;
//import com.accede.angel.admin.dao.RentDao;
//import com.accede.angel.admin.dao.RepairDao;
//import com.accede.angel.admin.model.Admin;
//import com.accede.angel.admin.model.Enquiry;
//import com.accede.angel.admin.model.Payment;
//import com.accede.angel.admin.model.Rent;
//import com.accede.angel.admin.model.Repair;
//import com.accede.angel.admin.model.RepairDetails;
//import com.accede.angel.admin.model.StudentAccount;
//import com.accede.angel.services.DynamicGenerator;
//import com.accede.angel.services.SendMail;
//import com.accede.angel.services.SendMessage;
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.text.ParseException;
//import java.text.SimpleDateFormat;
//import java.util.ArrayList;
//import java.util.List;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//import org.apache.catalina.tribes.util.Arrays;
//
///**
// *
// * @author Accede
// */
//@WebServlet(name = "AddRepairing", urlPatterns = {"/AddRepairing"})
//public class AddRepairing extends HttpServlet {
//
//    /**
//     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
//     * methods.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//   HttpSession session1 = request.getSession();
//            Admin Branch = (Admin) session1.getAttribute("BRANCH_ADMIN");
//            System.out.println("Branch="+Branch);
//            if (Branch != null) {
//    System.out.println("Branch=="+Branch);
//                if (!(Branch.getAdminId() == 1)) {
//            int inquiryid = Integer.parseInt(request.getParameter("inquiryid"));
//            if (inquiryid != 0) {
//                Enquiry en = new Enquiry();
//                EnquiryDao ed = new EnquiryDao();
//                en = ed.getEnquiryByID(inquiryid);
//                en.setRemove(false);
//                ed.update(en);
//
//            }
//            String fname = request.getParameter("fname");
//            String contact = request.getParameter("contact");
////            String email = request.getParameter("email");
//            String customerAddress = request.getParameter("customerAddress");
////            String IdProofType = request.getParameter("IdProofType");
////            String customerIdProof = request.getParameter("customerIdProof");
//            String Problem = request.getParameter("Problem");
//            String returndate = request.getParameter("joindate");
//            String rowcount = request.getParameter("rowcount");
//            String paymode = request.getParameter("paymode");
//            String chequeno = request.getParameter("chequeno");
//            String bankname = request.getParameter("bankname");
//            String amountinword = request.getParameter("amountinword");
//            String[] instrument = request.getParameterValues("InstrumentName");
//            int count = Integer.parseInt(rowcount);
//
//            Repair a = new Repair();
//            RepairDao rd = new RepairDao();
//            RepairDetails rdd = new RepairDetails();
//            String str = Arrays.toString(instrument);
//            for (int i = 0; i < count; i++) {
//
////                if (i == 0) {
////                    a.setInstrumentName1(request.getParameter("Coursename0"));
////                    a.setBrandname1(request.getParameter("Brandname0"));
////                    a.setModelnumber1(request.getParameter("Modelname0"));
////                    a.setProblem1(request.getParameter("Problem0"));
////                    a.setInstrumentFee1(Integer.parseInt(request.getParameter("CourseFee0")));
////                } else if (i == 1) {
////                    a.setInstrumentName2(request.getParameter("Coursename1"));
////                    a.setBrandname2(request.getParameter("Brandname1"));
////                    a.setModelnumber2(request.getParameter("Modelname1"));
////                    a.setProblem2(request.getParameter("Problem1"));
////                    a.setInstrumentFee2(Integer.parseInt(request.getParameter("CourseFee1")));
////
////                } else if (i == 2) {
////                    a.setInstrumentName3(request.getParameter("Coursename2"));
////                    a.setBrandname3(request.getParameter("Brandname2"));
////                    a.setModelnumber3(request.getParameter("Modelname2"));
////                    a.setProblem3(request.getParameter("Problem2"));
////                    a.setInstrumentFee3(Integer.parseInt(request.getParameter("CourseFee2")));
////
////                } else if (i == 3) {
////                    a.setInstrumentName4(request.getParameter("Coursename3"));
////                    a.setBrandname4(request.getParameter("Brandname3"));
////                    a.setModelnumber4(request.getParameter("Modelname3"));
////                    a.setProblem4(request.getParameter("Problem3"));
////                    a.setInstrumentFee4(Integer.parseInt(request.getParameter("CourseFee3")));
////
////                } else {
////                    a.setInstrumentName5(request.getParameter("Coursename4"));
////                    a.setBrandname5(request.getParameter("Brandname4"));
////                    a.setModelnumber5(request.getParameter("Modelname4"));
////                    a.setProblem5(request.getParameter("Problem4"));
////                    a.setInstrumentFee5(Integer.parseInt(request.getParameter("CourseFee4")));
////
////                }
//            }
//            int instrumenttotalfee = Integer.parseInt(request.getParameter("coursetotalfee"));
//
//            int discper = Integer.parseInt(request.getParameter("discper"));
//            int disamount = Integer.parseInt(request.getParameter("disamount"));
//            int finalamount = Integer.parseInt(request.getParameter("finalamount"));
//            int totaladvancedfee = Integer.parseInt(request.getParameter("totaladvancedfee"));
//            int totalremfee = Integer.parseInt(request.getParameter("totalremfee"));
//            int noofinstument = Integer.parseInt(request.getParameter("rowcount"));
////            rdd.setBankname(bankname);
////            rdd.setDiscper(discper);
////            rdd.setChequeno(chequeno);
////            rdd.setDisamount(disamount);
////            rdd.setInstrumenttotalfee(instrumenttotalfee);
////            rdd.setNoofinstument(noofinstument);
////            rdd.setPaymentMode(paymode);
////            rdd.setPreviousBalance(0);
////            rdd.setTotaladvancedfee(totaladvancedfee);
////            rdd.setAmountinWord(amountinword);
////            rdd.setTotalremfee(totalremfee);
////            rdd.setFinalamount(finalamount);
//
//            rd.saveRepairDetails(rdd);
//
//            List<RepairDetails> repairDetails = new ArrayList<RepairDetails>();
//            repairDetails.add(rdd);
//
//         
//
////            String Branchname = Branch.getAdminOfBranch().getBranchName();
////            String[] branch = Branchname.split("");
////            String pre = branch[0] + branch[1];
////            String RepairNo = new DynamicGenerator().repairNoGenerator(pre);
////            a.setAdminOfBranch(Branch);
////            a.setRepairDetails(repairDetails);
////            a.setCustomerAddress(customerAddress);
////            a.setCustomerFirstName(fname);
////            a.setCustomerMobileNo(contact);
////            a.setNoofinstrument(noofinstument);
////
////            a.setInstrumentName(str);
////            try {
////                a.setReturnDate(new SimpleDateFormat("dd/MM/yyyy").parse(returndate));
////            } catch (ParseException ex) {
////                ex.printStackTrace();
////            }
//////            a.setCustomerIdProof(customerIdProof);
////            a.setRemaininFee(totalremfee);
//////            a.setIdProofType(IdProofType);
////            a.setRepairNo(RepairNo);
////            a.setEmail(email);
//            boolean b = rd.saveRepair(a);
//
//            if (b) {
//
//                String Rent = "Repair No- ";
//                String agains = Rent + RepairNo;
//                Payment pay = new Payment();
//                pay.setAmount(totaladvancedfee);
//              
//                pay.setAdminOfBranch(Branch);
//                pay.setPaymentMode(paymode);
//                pay.setPaymentType("Credit");
//              
//                pay.setPaymentAgains(agains);
//                new PaymentDao().savePayment(pay);
//                String type1 = (String) session1.getAttribute("BRANCH_ADMIN1");
//                if (type1.equals("Branch_Admin")) {
//                    int i = 1;
//                    HttpSession session = request.getSession();
//                    session.setAttribute("i", i);
//                    long repairid = rd.getLastRepairID();
//                    String Emailmsg = "Dear Customer," + "\n"
//                            + "Thanku for paying an amount of Rs. " + totaladvancedfee + "\n"
//                            + "Balance Amount is  " + totalremfee + "\n"
//                            + "Return Date is" + returndate + "\n";
//
//                    String subject = "Payment Details";
////                    SendMail.mailsend(email, Emailmsg, subject);
//                    SendMessage.sendMobileMSG(contact, Emailmsg);
//
//                    session.setAttribute("msg", "Payment Save Successfully.");
//                    session.setAttribute("printInvoiceID", repairid);
//                    session.setAttribute("msg", "Repair Request Added  Successfully.");
//
//                    response.sendRedirect("Admin/branchReception/BranchRepairing.jsp");
//                } else {
//                    int i = 1;
//                    HttpSession session = request.getSession();
//                    session.setAttribute("i", i);
//                    String Emailmsg = "Dear Customer," + "\n"
//                            + "Thanku for paying an amount of Rs. " + totaladvancedfee + "\n"
//                            + "Balance Amount is  " + totalremfee + "\n"
//                            + "Return Date is" + returndate + "\n";
//
//                    String subject = "Payment Details";
////                    SendMail.mailsend(email, Emailmsg, subject);
//                    SendMessage.sendMobileMSG(contact, Emailmsg);
//                    session.setAttribute("msg", "Repair Request Added  Successfully.");
//
//                    response.sendRedirect("Admin/branchAdmin/BranchRepairing.jsp");
//
//                }
//            } else {
//                String type1 = (String) session1.getAttribute("BRANCH_ADMIN1");
//                if (type1.equals("Branch_Admin")) {
//                    int i = 2;
//                    HttpSession session = request.getSession();
//                    session.setAttribute("i", i);
//                    session.setAttribute("msg", "Something Went Wrong..");
//                    response.sendRedirect("Admin/branchReception/BranchRepairing.jsp");
//                } else {
//                    int i = 2;
//                    HttpSession session = request.getSession();
//                    session.setAttribute("i", i);
//                    session.setAttribute("msg", "Something Went Wrong..");
//                    response.sendRedirect("Admin/branchAdmin/BranchRepairing.jsp");
//                }
//            }
//  } else {
//                    int i = 2;
//                    HttpSession session = request.getSession();
//                    session.setAttribute("i", i);
//                    session.setAttribute("msg", "Your Session is Terminate......");
//                    response.sendRedirect("Admin/Login/adminLogin.jsp");
//
//                }
//            } else {
//                int i = 2;
//                HttpSession session = request.getSession();
//                session.setAttribute("i", i);
//                session.setAttribute("msg", "Your Session is Terminate......");
//                response.sendRedirect("Admin/Login/adminLogin.jsp");
//
//            }
//        }
//    }
//
//    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
//    /**
//     * Handles the HTTP <code>GET</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    /**
//     * Handles the HTTP <code>POST</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    /**
//     * Returns a short description of the servlet.
//     *
//     * @return a String containing servlet description
//     */
//    @Override
//    public String getServletInfo() {
//        return "Short description";
//    }// </editor-fold>
//
//}
