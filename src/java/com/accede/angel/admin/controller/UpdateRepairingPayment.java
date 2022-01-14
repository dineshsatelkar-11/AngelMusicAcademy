///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package com.accede.angel.admin.controller;
//
//import com.accede.angel.admin.dao.AdmissionDao;
//import com.accede.angel.admin.dao.PaymentDao;
//import com.accede.angel.admin.dao.RepairDao;
//import com.accede.angel.admin.model.Admin;
//import com.accede.angel.admin.model.Admission;
//import com.accede.angel.admin.model.Payment;
//import com.accede.angel.admin.model.Repair;
//import com.accede.angel.admin.model.RepairDetails;
//import com.accede.angel.admin.model.StudentAccount;
//import com.accede.angel.services.SendMail;
//import com.accede.angel.services.SendMessage;
//import java.io.IOException;
////import java.io.PrintWriter;
//import java.text.ParseException;
//import java.text.SimpleDateFormat;
//import java.util.ArrayList;
//import java.util.Date;
//import java.util.List;
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
//@WebServlet(name = "UpdateRepairingPayment", urlPatterns = {"/UpdateRepairingPayment"})
//public class UpdateRepairingPayment extends HttpServlet {
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
//            HttpSession session1 = request.getSession();
//            Admin Branch = (Admin) session1.getAttribute("BRANCH_ADMIN");
//            if (Branch != null) {
//
//              if (!(Branch.getAdminId() == 1)) {
//            long id = Long.parseLong(request.getParameter("studentid"));
//            System.out.println("id"+id);
//            Repair ad = new Repair();
//            RepairDao add = new RepairDao();
//            List<RepairDetails> account = new ArrayList<RepairDetails>();
//            ad = add.getRepairByID(id);
//             System.out.println("id"+ad);
//            account = ad.getRepairDetails();
//               System.out.println("id"+ad);
////            String Emailaddress = ad.getEmail();
//               System.out.println("id"+ad);
//            String mobile = ad.getCustomerMobileNo();
//               System.out.println("id"+ad);
//            int pbal = Integer.parseInt(request.getParameter("pbal"));
//               System.out.println("id"+ad);
//            int Course_fee = Integer.parseInt(request.getParameter("Course_fee"));
//               System.out.println("id"+ad);
//            
//            int totalAmount = Integer.parseInt(request.getParameter("totalAmount"));
//               System.out.println("id"+ad);
//            int paidAmount = Integer.parseInt(request.getParameter("paidAmount"));
//               System.out.println("id"+ad);
//            int Discount = Integer.parseInt(request.getParameter("Discount"));
//               System.out.println("id"+ad);
//            
//            int discAmount = Integer.parseInt(request.getParameter("discAmount"));
//               System.out.println("id"+ad);
//            int remaining_amount = Integer.parseInt(request.getParameter("remaining_amount"));
//               System.out.println("id"+ad);
//
////            String duedate = request.getParameter("duedate");
//            String bankname = request.getParameter("bankname");
//               System.out.println("id"+ad);
//            String chequeno = request.getParameter("chequeno");
//               System.out.println("id"+ad);
//            String paymode = request.getParameter("paymode");
//               System.out.println("id"+ad);
//            String amountinword = request.getParameter("amountinword");
//               System.out.println("id"+ad);
//            int noofcourse = ad.getNoofinstrument();
//               System.out.println("id"+ad);
//            
//            int admissionfee = Course_fee;
//               System.out.println("id"+ad);
//            ad.setRemaininFee(remaining_amount);
////            try {
////                ad.setReturnDate(new SimpleDateFormat("dd/MM/yyyy").parse(duedate));
////            } catch (ParseException ex) {
////                ex.printStackTrace();
////            }
//            ad.setReturnDate(new Date());
//            RepairDetails rdd = new RepairDetails();
//            rdd.setBankname(bankname);
//            rdd.setChequeno(chequeno);
//            rdd.setDiscper(Discount);
//            rdd.setDisamount(discAmount);
//            rdd.setInstrumenttotalfee(admissionfee);
//            rdd.setNoofinstument(noofcourse);
//            rdd.setPaymentMode(paymode);
//            rdd.setPreviousBalance(pbal);
//            rdd.setTotaladvancedfee(paidAmount);
//            rdd.setTotalremfee(remaining_amount);
//            rdd.setFinalamount(totalAmount);
//            rdd.setAmountinWord(amountinword);
//            
//            account.add(rdd);
//            ad.setRemaininFee(remaining_amount);
//            ad.setReturnDate(new Date());
////            try {
////                ad.setReturnDate(new SimpleDateFormat("dd/MM/yyyy").parse(duedate));
////            } catch (ParseException ex) {
////                ex.printStackTrace();
////            }
//            
//            ad.setRepairDetails(account);
//            boolean b = add.saveRepairDetails(rdd);
//               System.out.println("id"+ad);
//           
//          
//            add.update(ad);
//           
//            if (Branch.getAdminOfBranch() == null) {
//                if (b) {
//                    
//                    String Rent = "Repair No- ";
//                    String agains = Rent + ad.getRepairNo();
//                    Payment pay = new Payment();
//                    pay.setAmount(paidAmount);
//                    pay.setBankName(bankname);
//                    pay.setAdminOfBranch(Branch);
//                    pay.setPaymentMode(paymode);
//                    pay.setPaymentType("Credit");
//                    pay.setTransctionNo(chequeno);
//                    pay.setPaymentAgains(agains);
//                    new PaymentDao().savePayment(pay);
//                    int i = 1;
//                    long repeairdetailsid=add.getLastRepairDetailsID();
//                    HttpSession session = request.getSession();
//                    session.setAttribute("i", i);
//                    long admissionid = id;
//                    String Emailmsg = "Dear Customer," + "\n"
//                            + "Thanku for paying an amount of Rs. " + paidAmount + "\n";
//                    
//                    String subject = "Payment Details";
////                    SendMail.mailsend(Emailaddress, Emailmsg, subject);
//                    SendMessage.sendMobileMSG(mobile, Emailmsg);
//                    session.setAttribute("printInvoiceID", admissionid);
//                    session.setAttribute("invoicedetailsid", repeairdetailsid);
//                    session.setAttribute("msg", "Payment Save Successfully.");
////                out.println("<script type=\"text/javascript\">");
////                out.println("alert('Subject Added successfully');");
////                out.println("location='Admin/admin/addSubject.jsp';");
////                out.println("</script>");
//                    response.sendRedirect("Admin/admin/AllRepairing.jsp?asd="+id);
//                } else {
//                    int i = 2;
//                    HttpSession session = request.getSession();
//                    session.setAttribute("i", i);
//                    session.setAttribute("msg", "Something Went Wrong..");
//                    response.sendRedirect("Admin/admin/AllRepairing.jsp");
//                }
//            } else {
//                if (b) {
//                    
//                    String Rent = "Repair No- ";
//                    String agains = Rent + ad.getRepairNo();
//                    Payment pay = new Payment();
//                    pay.setAmount(paidAmount);
//                    pay.setBankName(bankname);
//                    pay.setAdminOfBranch(Branch);
//                    pay.setPaymentMode(paymode);
//                    pay.setPaymentType("Credit");
//                    pay.setTransctionNo(chequeno);
//                    pay.setPaymentAgains(agains);
//                    new PaymentDao().savePayment(pay);
//                    int i = 1;
//                    HttpSession session = request.getSession();
//                    session.setAttribute("i", i);
//                    long admissionid = id;
//                    String Emailmsg = "Dear Customer," + "\n"
//                            + "Thanku for paying an amount of Rs. " + paidAmount + "\n";
//                    
//                    String subject = "Payment Details";
////                    SendMail.mailsend(Emailaddress, Emailmsg, subject);
//                    SendMessage.sendMobileMSG(mobile, Emailmsg);
//                    session.setAttribute("printInvoiceID", admissionid);
//                    session.setAttribute("msg", "Payment Save Successfully.");
////                out.println("<script type=\"text/javascript\">");
////                out.println("alert('Subject Added successfully');");
////                out.println("location='Admin/admin/addSubject.jsp';");
////                out.println("</script>");
//                    response.sendRedirect("Admin/branchReception/AllRepairing.jsp?asd="+id);
//                } else {
//                    int i = 2;
//                    HttpSession session = request.getSession();
//                    session.setAttribute("i", i);
//                    session.setAttribute("msg", "Something Went Wrong..");
//                    response.sendRedirect("Admin/branchReception/AllRepairing.jsp");
//                }
//            }
//             } else {
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
