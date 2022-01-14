/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.admin.controller;

import com.accede.angel.admin.dao.AdmissionDao;
import com.accede.angel.admin.dao.CustomerAccountDao;
import com.accede.angel.admin.dao.PaymentFollowupDao;
import com.accede.angel.admin.dao.StudentVanishHistoryDao;
import com.accede.angel.admin.model.Admin;
import com.accede.angel.admin.model.Admission;
import com.accede.angel.admin.model.CustomerAccount;
import com.accede.angel.admin.model.PaymentFollowup;
import com.accede.angel.admin.model.PaymentFollowupMessage;
import com.accede.angel.admin.model.StudentVanishHistory;
import com.accede.angel.services.Dates;
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
@WebServlet(name = "ShiftToOldStudentWithFee", urlPatterns = {"/ShiftToOldStudentWithFee"})
public class ShiftToOldStudentWithFee extends HttpServlet {

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

                int custid = Integer.parseInt(request.getParameter("custid"));
                CustomerAccountDao CustomerAccountDao = new CustomerAccountDao();
                CustomerAccount CustomerAccount = CustomerAccountDao.getCustomerAccountById(custid);
                int PreviousBalance = Integer.parseInt(request.getParameter("PreviousBalance"));
                int deductionBalance = Integer.parseInt(request.getParameter("deductionBalance"));
                AdmissionDao AdmissionDao = new AdmissionDao();
                Admission Admission = AdmissionDao.getAdmissionByAccount(CustomerAccount);
                String tillDate = request.getParameter("nextdate");
                String fromDate = request.getParameter("fromdate");
                StudentVanishHistory StudentVanishHistory = new StudentVanishHistory();
                Date tilldate = new Date();
                Date frommdate = new Date();
                try {
                    frommdate = new SimpleDateFormat("yyyy-MM-dd").parse(fromDate);
                    StudentVanishHistory.setFromDate(new SimpleDateFormat("yyyy-MM-dd").parse(fromDate));
                } catch (ParseException ex) {
                    ex.printStackTrace();
                }
                try {
                    tilldate = new SimpleDateFormat("yyyy-MM-dd").parse(tillDate);
                    StudentVanishHistory.setTillDate(new SimpleDateFormat("yyyy-MM-dd").parse(tillDate));
                } catch (ParseException ex) {
                    ex.printStackTrace();
                }

                StudentVanishHistory.setAdminOfBranch(Branch);
                StudentVanishHistory.setAdmission(Admission);
                StudentVanishHistory.setBalanceamount(PreviousBalance);
                StudentVanishHistory.setCustomerAccount(CustomerAccount);
                StudentVanishHistory.setDeductionamount(deductionBalance);
                StudentVanishHistory.setStatus("Shifted to Old");
                
                StudentVanishHistoryDao StudentVanishHistoryDao = new StudentVanishHistoryDao();
                boolean b = StudentVanishHistoryDao.saveStudentVanishHistory(StudentVanishHistory);
                if (b) {
                    Admission.setShiftToOldStudent(false);
                    Admission.setRemaininFee(PreviousBalance - deductionBalance);
                    AdmissionDao.updateAdmission(Admission);

                    PaymentFollowup PaymentFollowup = new PaymentFollowup();
                    Dates dates = new Dates();
                    PaymentFollowup.setCustomerAccount(CustomerAccount);
                    Date nextdate = dates.getEndingDate(tilldate, -2);
                    PaymentFollowup.setRequestDate(new Date());
                    PaymentFollowup.setTypeofoffollowup("Music Class");

                    PaymentFollowup.setNextfollowupdate(nextdate);

                    String message = "Student Shifted to Old Student-Rejoin or not request ," + "\n"
                            + "From Date:-. " + frommdate + "\n"
                            + "Till Date:-. " + nextdate + "\n"
                            + "Previous Balance. " + PreviousBalance + "\n"
                            + "Deduction Amount. " + deductionBalance + "\n";

                    PaymentFollowup.setAdminOfBranch(Branch);
                    PaymentFollowupDao PaymentFollowupDao = new PaymentFollowupDao();
                    PaymentFollowupDao.savePaymentFollowup(PaymentFollowup);
                    int paymentId = new PaymentFollowupDao().getLastPaymentFollowupID();
                    if (paymentId != 0) {
                        PaymentFollowupMessage PaymentFollowupMessage = new PaymentFollowupMessage();
                        PaymentFollowup = PaymentFollowupDao.getPaymentFollowupByID(paymentId);
                        System.out.println("PaymentFollowup=" + PaymentFollowup);
                        PaymentFollowupMessage.setDescription(message);
                        PaymentFollowupMessage.setFollowupdate(new Date());
                        PaymentFollowupMessage.setPaymentFollowup(PaymentFollowup);
                        System.out.println("PaymentFollowupMessage=" + PaymentFollowupMessage);
                        PaymentFollowupDao.savePaymentFollowupMessage(PaymentFollowupMessage);
                    }

                    response.sendRedirect("Admin/branchReception/StudentProfileDetails.jsp?accountid=" + custid);

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
