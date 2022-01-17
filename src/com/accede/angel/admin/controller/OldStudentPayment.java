///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package com.accede.angel.admin.controller;
//
//import com.accede.angel.admin.dao.AdmissionDao;
//import com.accede.angel.admin.dao.PaymentDao;
//import com.accede.angel.admin.model.Admin;
//import com.accede.angel.admin.model.Admission;
//import com.accede.angel.admin.model.Payment;
//import com.accede.angel.admin.model.StudentAccount;
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
//
///**
// *
// * @author Accede
// */
//@WebServlet(name = "OldStudentPayment", urlPatterns = {"/OldStudentPayment"})
//public class OldStudentPayment extends HttpServlet {
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
//            long id = Long.parseLong(request.getParameter("studentid"));
//            Admission ad = new Admission();
//            AdmissionDao add = new AdmissionDao();
//            List<StudentAccount> account = new ArrayList<StudentAccount>();
//            ad = add.getAdmissionByID(id);
//               String coursename1 = ad.getCourseName1() ;
//        String coursename2 = ad.getCourseName2() ;
//        String coursename3 =ad.getCourseName3() ;
//        String coursename4 = ad.getCourseName4() ;
//        String coursename5 = ad.getCourseName5() ;
//        String courses = ad.getCourseName() ;
//        int noofcoursee = ad.getNoofCourse();
//        int paymentmodecount = ad.getPaymentmodecount();
//        
//        int coursefee1 = ad.getCourseFee1();
//        int coursefee2 = ad.getCourseFee2();
//        int coursefee3 = ad.getCourseFee3();
//        int coursefee4 =ad.getCourseFee4();
//        int coursefee5 = ad.getCourseFee5();
//          
//            account = ad.getStudentAccount();
//  String Emailaddress = ad.getEmail();
//            String mobile = ad.getContactNo();
//            
//            int pbal = Integer.parseInt(request.getParameter("pbal"));
//            int Course_fee = Integer.parseInt(request.getParameter("Course_fee"));
//            int paymenttype = Integer.parseInt(request.getParameter("paymenttype"));
//            int totalAmount = Integer.parseInt(request.getParameter("totalAmount"));
//            int paidAmount = Integer.parseInt(request.getParameter("paidAmount"));
//            int Discount = Integer.parseInt(request.getParameter("Discount"));
//            int beforedisc = Integer.parseInt(request.getParameter("beforedisc"));
//            int discAmount = Integer.parseInt(request.getParameter("discAmount"));
//            int remaining_amount = Integer.parseInt(request.getParameter("remaining_amount"));
//            String duedate = request.getParameter("duedate");
//            String bankname = request.getParameter("bankname");
//            String chequeno = request.getParameter("chequeno");
//            String paymode = request.getParameter("paymode");
//            String paymentDate = request.getParameter("paymentDate");
//            int noofcourse = ad.getNoofCourse();
//            int duration = ad.getDuration();
//            int admissionfee = 0;
//            ad.setRemaininFee(remaining_amount);
//            try {
//                ad.setDueDate(new SimpleDateFormat("dd/MM/yyyy").parse(duedate));
//            } catch (ParseException ex) {
//                ex.printStackTrace();
//            }
//           
//
//            StudentAccount acc = new StudentAccount();
//            acc.setCourse(noofcourse);
//            acc.setCourseDuration(duration);
//            try {
//                acc.setDueDate(new SimpleDateFormat("dd/MM/yyyy").parse(duedate));
//            } catch (ParseException ex) {
//                ex.printStackTrace();
//            }
//            try {
//                acc.setPaymentDate(new SimpleDateFormat("dd/MM/yyyy").parse(paymentDate));
//            } catch (ParseException ex) {
//                ex.printStackTrace();
//            }
//            acc.setPaymentMode(paymode);
//            acc.setAdmissonnfee(admissionfee);
//            acc.setBankname(bankname);
//            acc.setChequeno(chequeno);
//            acc.setChequeno(chequeno);
//            if (paymenttype == 1) {
//                acc.setCoursetotalfee(Course_fee);
//
//            } else {
//                int fee = 0;
//                acc.setCoursetotalfee(fee);
//            }
//            
//            
//             acc.setCourse(noofcourse);
//            
//            acc.setCourseFee1(coursefee1);
//            acc.setCourseFee2(coursefee2);
//            acc.setCourseFee3(coursefee3);
//            acc.setCourseFee4(coursefee4);
//            acc.setCourseFee5(coursefee5);
//            
//            acc.setCourseName(courses);
//            acc.setCourseName1(coursename1);
//            acc.setCourseName2(coursename2);
//            acc.setCourseName3(coursename3);
//            acc.setCourseName4(coursename4);
//            acc.setCourseName5(coursename5);
//            
//            acc.setPaymentmodecount(paymentmodecount); acc.setCourse(noofcourse);
//            
//            acc.setCourseFee1(coursefee1);
//            acc.setCourseFee2(coursefee2);
//            acc.setCourseFee3(coursefee3);
//            acc.setCourseFee4(coursefee4);
//            acc.setCourseFee5(coursefee5);
//            
//            acc.setCourseName(courses);
//            acc.setCourseName1(coursename1);
//            acc.setCourseName2(coursename2);
//            acc.setCourseName3(coursename3);
//            acc.setCourseName4(coursename4);
//            acc.setCourseName5(coursename5);
//            
//            acc.setPaymentmodecount(paymentmodecount);
//            acc.setCourse(noofcourse);
//            
//            acc.setCourseFee1(coursefee1);
//            acc.setCourseFee2(coursefee2);
//            acc.setCourseFee3(coursefee3);
//            acc.setCourseFee4(coursefee4);
//            acc.setCourseFee5(coursefee5);
//            
//            acc.setCourseName(courses);
//            acc.setCourseName1(coursename1);
//            acc.setCourseName2(coursename2);
//            acc.setCourseName3(coursename3);
//            acc.setCourseName4(coursename4);
//            acc.setCourseName5(coursename5);
//            
//            acc.setPaymentmodecount(paymentmodecount);
//            acc.setDiscper(Discount);
//            acc.setDisamount(discAmount);
//            acc.setFinalamount(totalAmount);
//            acc.setTotaladvancedfee(paidAmount);
//            acc.setTotalfee(beforedisc);
//            acc.setTotalremfee(remaining_amount);
//            acc.setCourse(noofcourse);
//            acc.setPreviousBalance(pbal);
//            account.add(acc);
//            ad.setRemaininFee(remaining_amount);
//            try {
//                ad.setNextPaymentDate(new SimpleDateFormat("dd/MM/yyyy").parse(duedate));
//            } catch (ParseException ex) {
//                ex.printStackTrace();
//            }
//
//            ad.setStudentAccount(account);
//            boolean b = add.saveStudentAccount(acc);
//            add.updateAdmission(ad);
//            HttpSession session1 = request.getSession();
//            Admin Branch = (Admin) session1.getAttribute("BRANCH_ADMIN");
//            if (Branch.getAdminOfBranch() == null) {
//                if (b) {
//
//                    String Rent = "Admission No- ";
//                    String agains = Rent + ad.getAdmissionNo();
//                    Payment pay = new Payment();
//                    pay.setAmount(paidAmount);
//                    pay.setBankName(bankname);
//                    pay.setAdminOfBranch(Branch);
//                    pay.setPaymentMode(paymode);
//                    pay.setPaymentType("Credit");
//                    pay.setTransctionNo(chequeno);
//                    pay.setPaymentAgains(agains);
//                     try {
//                pay.setPaymentDate(new SimpleDateFormat("dd/MM/yyyy").parse(paymentDate));
//            } catch (ParseException ex) {
//                ex.printStackTrace();
//            }
//                    new PaymentDao().savePayment(pay);
//                    int i = 1;
//                    HttpSession session = request.getSession();
//                    session.setAttribute("i", i);
//                    session.setAttribute("msg", "Payment Save Successfully.");
////                out.println("<script type=\"text/javascript\">");
////                out.println("alert('Subject Added successfully');");
////                out.println("location='Admin/admin/addSubject.jsp';");
////                out.println("</script>");
//                    response.sendRedirect("Admin/admin/All_Student.jsp");
//                } else {
//                    int i = 2;
//                    HttpSession session = request.getSession();
//                    session.setAttribute("i", i);
//                    session.setAttribute("msg", "Something Went Wrong..");
//                    response.sendRedirect("Admin/admin/All_Student.jsp");
//                }
//            } else {
//
//                if (b) {
//
//                    String Rent = "Admission No- ";
//                    String agains = Rent + ad.getAdmissionNo();
//                    Payment pay = new Payment();
//                    pay.setAmount(paidAmount);
//                    pay.setBankName(bankname);
//                    pay.setAdminOfBranch(Branch);
//                    pay.setPaymentMode(paymode);
//                    pay.setPaymentType("Credit");
//                    pay.setTransctionNo(chequeno);
//                    pay.setPaymentAgains(agains);
//                        try {
//                pay.setPaymentDate(new SimpleDateFormat("dd/MM/yyyy").parse(paymentDate));
//            } catch (ParseException ex) {
//                ex.printStackTrace();
//            }
//                    new PaymentDao().savePayment(pay);
//                    int i = 1;
//                    HttpSession session = request.getSession();
//                    session.setAttribute("i", i);
//                    session.setAttribute("msg", "Payment Save Successfully.");
////                out.println("<script type=\"text/javascript\">");
////                out.println("alert('Subject Added successfully');");
////                out.println("location='Admin/admin/addSubject.jsp';");
////                out.println("</script>");
//                    response.sendRedirect("Admin/branchReception/AllOldStudent.jsp");
//                } else {
//                    int i = 2;
//                    HttpSession session = request.getSession();
//                    session.setAttribute("i", i);
//                    session.setAttribute("msg", "Something Went Wrong..");
//                    response.sendRedirect("Admin/branchReception/AllOldStudent.jsp");
//                }
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
