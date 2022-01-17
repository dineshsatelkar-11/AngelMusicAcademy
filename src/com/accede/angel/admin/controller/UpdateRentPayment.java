///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package com.accede.angel.admin.controller;
//
//import com.accede.angel.admin.dao.PaymentDao;
//import com.accede.angel.admin.dao.RentDao;
//import com.accede.angel.admin.dao.RepairDao;
//import com.accede.angel.admin.model.Admin;
//import com.accede.angel.admin.model.Payment;
//import com.accede.angel.admin.model.Rent;
//import com.accede.angel.admin.model.RentDetails;
//import com.accede.angel.admin.model.Repair;
//import com.accede.angel.admin.model.RepairDetails;
//import com.accede.angel.services.SendMail;
//import com.accede.angel.services.SendMessage;
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.text.ParseException;
//import java.text.SimpleDateFormat;
//import java.util.ArrayList;
//import java.util.List;
//import java.util.Date;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
///**
// *
// * @author Accede
// */
//@WebServlet(name = "UpdateRentPayment", urlPatterns = {"/UpdateRentPayment"})
//public class UpdateRentPayment extends HttpServlet {
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
//          HttpSession session1 = request.getSession();
//            Admin Branch = (Admin) session1.getAttribute("BRANCH_ADMIN");
//            if (Branch != null) {
//
//              if (!(Branch.getAdminId() == 1)) {
//            long id = Long.parseLong(request.getParameter("studentid"));
//            Rent ad = new Rent();
//            RentDao add = new RentDao();
//            List<RentDetails> account = new ArrayList<RentDetails>();
//            ad = add.getRentByID(id);
//            account = ad.getRentDetails();
//            int days = ad.getNoOfDays();
////            String Emailaddress = ad.getEmail();
//            String mobile = ad.getCustomerMobileNo();
//            int rentamount = Integer.parseInt(request.getParameter("rentamount"));
//            int depositeamount = Integer.parseInt(request.getParameter("depositeamount"));
//
//            int prepaidamount = Integer.parseInt(request.getParameter("prepaidamount"));
//            int extradays = Integer.parseInt(request.getParameter("extradays"));
//            int extradaysAmount = Integer.parseInt(request.getParameter("extradaysAmount"));
//            int Charges = Integer.parseInt(request.getParameter("Charges"));
//
//            int Discount = Integer.parseInt(request.getParameter("Discount"));
//            int discAmount = Integer.parseInt(request.getParameter("discAmount"));
//            int totalAmount = Integer.parseInt(request.getParameter("totalAmount"));
//            int paidAmount = Integer.parseInt(request.getParameter("paidAmount"));
//            int Return_amount = Integer.parseInt(request.getParameter("Return_amount"));
//
//            String bankname = request.getParameter("bankname");
//            String chequeno = request.getParameter("chequeno");
//            String paymode = request.getParameter("paymode");
//            String amountinword = request.getParameter("amountinword");
//            int finalrentamount = extradaysAmount + rentamount;
//            days = extradays + days;
//            int noofcourse = ad.getNoofinstrument();
//
//            ad.setReceivedDate(new Date());
//
//            RentDetails rdd = new RentDetails();
//            rdd.setBankname(bankname);
//            rdd.setChequeno(chequeno);
//            rdd.setDiscper(Discount);
//            rdd.setDisamount(discAmount);
//            rdd.setInstrumenttotalfee(finalrentamount);
//            rdd.setNoofinstument(noofcourse);
//            rdd.setPaymentMode(paymode);
//            rdd.setPreviousBalance(0);
//            rdd.setTotaladvancedfee(paidAmount);
//            rdd.setTotalremfee(0);
//            rdd.setFinalamount(totalAmount);
//            rdd.setReturnAmount(Return_amount);
//            rdd.setOthers(Charges);
//            rdd.setNoofdays(days);
//          
//            rdd.setAmountinWord(amountinword);
//            rdd.setReturn_date(new Date());
//            account.add(rdd);
//           int paidamountt= ad.getPaidAmount();
//            ad.setRemaininFee(0);
//            ad.setPaidAmount(paidamountt+paidAmount);
//
//            ad.setRentDetails(account);
//            
//            boolean b = add.saveRentDetails(rdd);
//          
//         
//            add.update(ad);
//          
//            if (Branch.getAdminOfBranch() == null) {
//                if (b) {
//
//                    String Rent = "Rent No- ";
//                    String agains = Rent + ad.getRentNo();
//                    Payment pay = new Payment();
//                    if (Return_amount > 0) {
//                        pay.setAmount(Return_amount);
//                        pay.setPaymentType("Debit");
//                    } else {
//                        pay.setAmount(paidAmount);
//                        pay.setPaymentType("Credit");
//                    }
//
//                    pay.setBankName(bankname);
//                    pay.setAdminOfBranch(Branch);
//                    pay.setPaymentMode(paymode);
//
//                    pay.setTransctionNo(chequeno);
//                    pay.setPaymentAgains(agains);
//                    new PaymentDao().savePayment(pay);
//                    int i = 1;
//                    HttpSession session = request.getSession();
//                    session.setAttribute("i", i);
//                    long admissionid = id;
//                     String Emailmsg="";
//                    if(paidAmount>0)
//                    {
//                        
//                    
//                     Emailmsg = "Dear Customer," + "\n"
//                            + "Thanku for paying an amount of Rs. " + paidAmount + "\n";
//                    }else
//                    {
//                        Emailmsg = "Dear Customer," + "\n"
//                            + "Thanku for paying an amount of Rs. " + Return_amount + "\n";
//                   
//                    }
//                    String subject = "Payment Details";
////                    SendMail.mailsend(Emailaddress, Emailmsg, subject);
//                    SendMessage.sendMobileMSG(mobile, Emailmsg);
//                    session.setAttribute("printInvoiceID", admissionid);
//                    session.setAttribute("msg", "Payment Save Successfully.");
////                out.println("<script type=\"text/javascript\">");
////                out.println("alert('Subject Added successfully');");
////                out.println("location='Admin/admin/addSubject.jsp';");
////                out.println("</script>");
//                    response.sendRedirect("Admin/admin/AllRentRequest.jsp");
//                } else {
//                    int i = 2;
//                    HttpSession session = request.getSession();
//                    session.setAttribute("i", i);
//                    session.setAttribute("msg", "Something Went Wrong..");
//                    response.sendRedirect("Admin/admin/AllRentRequest.jsp");
//                }
//            } else {
//                if (b) {
//
//                    String Rent = "Rent No- ";
//                    String agains = Rent + ad.getRentNo();
//                    Payment pay = new Payment();
//                    if (Return_amount > 0) {
//                        pay.setAmount(Return_amount);
//                        pay.setPaymentType("Debit");
//                    } else {
//                        pay.setAmount(paidAmount);
//                        pay.setPaymentType("Credit");
//                    }
//
//                    pay.setBankName(bankname);
//                    pay.setAdminOfBranch(Branch);
//                    pay.setPaymentMode(paymode);
//
//                    pay.setTransctionNo(chequeno);
//                    pay.setPaymentAgains(agains);
//                    new PaymentDao().savePayment(pay);
//                    int i = 1;
//                    HttpSession session = request.getSession();
//                    session.setAttribute("i", i);
//                    long admissionid = id;
//                    long rentdetailsid=add. getLastRentDetailsID();
//                    String Emailmsg = "Dear Customer," + "\n"
//                            + "Thanku for paying an amount of Rs. " + paidAmount + "\n";
//
//                    String subject = "Payment Details";
////                    SendMail.mailsend(Emailaddress, Emailmsg, subject);
//                    SendMessage.sendMobileMSG(mobile, Emailmsg);
//                    session.setAttribute("printInvoiceID", admissionid);
//                    session.setAttribute("rentdetailsid", rentdetailsid);
//                    session.setAttribute("msg", "Payment Save Successfully.");
////                out.println("<script type=\"text/javascript\">");
////                out.println("alert('Subject Added successfully');");
////                out.println("location='Admin/admin/addSubject.jsp';");
////                out.println("</script>");
//                    response.sendRedirect("Admin/branchReception/AllRentRequest.jsp");
//                } else {
//                    int i = 2;
//                    HttpSession session = request.getSession();
//                    session.setAttribute("i", i);
//                    session.setAttribute("msg", "Something Went Wrong..");
//                    response.sendRedirect("Admin/branchReception/AllRentRequest.jsp");
//                }
//            }
//            
//              } else {
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
//
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
