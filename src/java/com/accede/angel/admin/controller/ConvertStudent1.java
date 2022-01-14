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
 * @author Accede
 */
@WebServlet(name = "ConvertStudent1", urlPatterns = {"/ConvertStudent1"})
public class ConvertStudent1 extends HttpServlet {

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
            
            Admission ad = new Admission();
            AdmissionDao add = new AdmissionDao();
            long custid1 = Long.parseLong(request.getParameter("studentidd"));
            ad = add.getAdmissionByID(custid1);
            ad.setShiftToOldStudent(true);
            boolean b = add.updateAdmission(ad);

            if (b) {
                
                
                CustomerAccountDao CustomerAccountDao = new CustomerAccountDao();
                CustomerAccount CustomerAccount = ad.getCustomerAccount();
               
                AdmissionDao AdmissionDao = new AdmissionDao();
                Admission Admission = AdmissionDao.getAdmissionByAccount(CustomerAccount);
             
                StudentVanishHistory StudentVanishHistory = new StudentVanishHistory();
               

                StudentVanishHistory.setAdminOfBranch(Branch);
                StudentVanishHistory.setAdmission(Admission);
              
                StudentVanishHistory.setCustomerAccount(CustomerAccount);
               
                StudentVanishHistory.setStatus("Shifted to Regular");
                
                StudentVanishHistoryDao StudentVanishHistoryDao = new StudentVanishHistoryDao();
                StudentVanishHistoryDao.saveStudentVanishHistory(StudentVanishHistory);
                
                
                Admission.setNextPaymentDate(new Date());
                new AdmissionDao().update(Admission);
                
                
                  Dates dates = new Dates();
                        PaymentFollowup PaymentFollowup = new PaymentFollowup();

                        PaymentFollowup.setCustomerAccount(CustomerAccount);
                        Date nextdate = dates.getEndingDate(new Date(), 1);
                        PaymentFollowup.setRequestDate(new Date());

                        PaymentFollowup.setTypeofoffollowup("Music Class");

                        PaymentFollowup.setNextfollowupdate(nextdate);

                        String message = "Student Course Payment," + "\n"
                                + "Admission No:-. " + Admission.getAdmissionNo() + "\n"
                                + "Mobile No:-. " + CustomerAccount.getMobileNo() + "\n"
                                + "Total Fee Amount. " + (Admission.getFee() - Admission.getDisamount() + Admission.getRemaininFee()) + "\n";
                               

                        PaymentFollowup.setAdminOfBranch(Admission.getAdminOfBranch());
                        PaymentFollowupDao PaymentFollowupDao = new PaymentFollowupDao();
                        PaymentFollowupDao.savePaymentFollowup(PaymentFollowup);
                        int paymentId = new PaymentFollowupDao().getLastPaymentFollowupID();
                        if (paymentId != 0) {
                            PaymentFollowupMessage PaymentFollowupMessage = new PaymentFollowupMessage();
                            PaymentFollowup = PaymentFollowupDao.getPaymentFollowupByID(paymentId);
                            PaymentFollowupMessage.setDescription(message);
                            PaymentFollowupMessage.setFollowupdate(new Date());
                            PaymentFollowupMessage.setPaymentFollowup(PaymentFollowup);
                            PaymentFollowupDao.savePaymentFollowupMessage(PaymentFollowupMessage);
                        }

                  
                int i = 1;
               
                session.setAttribute("i", i);
                session.setAttribute("msg", "Student Succefully Shift To Student List.");
//                out.println("<script type=\"text/javascript\">");
//                out.println("alert('Subject Added successfully');");
//                out.println("location='Admin/admin/addSubject.jsp';");
//                out.println("</script>");
                response.sendRedirect("Admin/branchReception/AllStudent.jsp");
            } else {
                int i = 2;
               
                session.setAttribute("i", i);
                session.setAttribute("msg", "Something Went Wrong..");
                response.sendRedirect("Admin/branchReception/AllStudent.jsp");
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
