/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.admin.controller;

import com.accede.angel.admin.dao.AdminDao;
import com.accede.angel.admin.dao.AdmissionDao;
import com.accede.angel.admin.dao.CustomerAccountDao;
import com.accede.angel.admin.dao.PaymentDao;
import com.accede.angel.admin.dao.PaymentFollowupDao;
import com.accede.angel.admin.model.Admin;
import com.accede.angel.admin.model.Admission;
import com.accede.angel.admin.model.CustomerAccount;
import com.accede.angel.admin.model.Payment;
import com.accede.angel.admin.model.PaymentFollowup;
import com.accede.angel.admin.model.PaymentFollowupMessage;
import com.accede.angel.admin.model.SessionKey;
import com.accede.angel.admin.model.StudentAccount;
import com.accede.angel.services.Dates;
import com.accede.angel.services.SendMail;
import com.accede.angel.services.SendMessage;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
@WebServlet(name = "StudentMonthlyPayment", urlPatterns = {"/StudentMonthlyPayment"})
public class StudentMonthlyPayment extends HttpServlet {

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
               int custid = Integer.parseInt(request.getParameter("custid"));
            if(c)
            {
                String paymode = request.getParameter("paymode");
                String paidAmountinword = request.getParameter("paidAmountinword");
             
                int paidAmount = Integer.parseInt(request.getParameter("paidAmount"));
                int totalAmount = Integer.parseInt(request.getParameter("totalAmount"));
                int pbal = Integer.parseInt(request.getParameter("pbal"));
                int remaining_amount = Integer.parseInt(request.getParameter("remaining_amount"));
                CustomerAccountDao CustomerAccountDao = new CustomerAccountDao();
                CustomerAccount CustomerAccount = CustomerAccountDao.getCustomerAccountById(custid);
                Dates dates = new Dates();
                AdmissionDao AdmissionDao = new AdmissionDao();
                Admission Admission = AdmissionDao.getAdmissionByAccount(CustomerAccount);
                List<StudentAccount> allAccount = new ArrayList<StudentAccount>();
                Date nextPaymentDate = dates.getEndingDate(Admission.getNextPaymentDate(), Admission.getPackageCourse().getPaymentMode()*30);
                StudentAccount StudentAccount = new StudentAccount();
                StudentAccount.setPaymentMode(paymode);
                StudentAccount.setAmountinWord(paidAmountinword);
                StudentAccount.setPackageFee(Admission.getPackageCourse().getFee());
                StudentAccount.setDisamount(Admission.getDisamount());
                StudentAccount.setDiscper(Admission.getDiscper());
                StudentAccount.setFinalamount(totalAmount);
                StudentAccount.setPaid(paidAmount);
                StudentAccount.setPreviousBalance(pbal);
                StudentAccount.setTotalremfee(remaining_amount);
                StudentAccount.setCourseName(Admission.getCourseName());
                StudentAccount.setDays(Admission.getDaysInWeek());
                StudentAccount.setBatches(Admission.getBatchTimings());
                StudentAccount.setCustomerAccount(CustomerAccount);
                StudentAccount.setPackagename(Admission.getPackageCourse().getPackagename());
                StudentAccount.setDescription(Admission.getPackageCourse().getDescription());
                StudentAccount.setNoofBatchTimes(Admission.getPackageCourse().getNoofBatchTimes());
                StudentAccount.setNoofcourse(Admission.getPackageCourse().getNoofcourse());
                StudentAccount.setNoofdays(Admission.getPackageCourse().getNoofdays());
                StudentAccount.setNextPaymentDate(nextPaymentDate);
                StudentAccount.setCourseDuration(Admission.getPackageCourse().getCourseDuration());
                StudentAccount.setFeeType("Monthly Payment");
                List<StudentAccount> account = new ArrayList<StudentAccount>();
                account = Admission.getStudentAccount();
                Boolean b = AdmissionDao.saveStudentAccount(StudentAccount);
                if (b) {
                    account.add(StudentAccount);
                    Admission.setStudentAccount(account);
                    Admission.setNextPaymentDate(nextPaymentDate);
                    Admission.setRemaininFee(remaining_amount);

                    b = AdmissionDao.updateAdmission(Admission);
                    if (b) {
                        if (remaining_amount > 0) {
                            PaymentFollowup PaymentFollowup = new PaymentFollowup();

                            PaymentFollowup.setCustomerAccount(CustomerAccount);
                            Date nextdate = dates.getEndingDate(new Date(), 2);
                            PaymentFollowup.setRequestDate(new Date());
                            String nextpaymentdate = request.getParameter("nextpaymentdate");
                             PaymentFollowup.setTypeofoffollowup("Music Class");
                            try {

                                PaymentFollowup.setNextfollowupdate(new SimpleDateFormat("yyyy-MM-dd").parse(nextpaymentdate));
                            } catch (ParseException ex) {
                                ex.printStackTrace();
                            }

                            String message = "Student Course Payment," + "\n"
                                    + "Admission No:-. " + Admission.getAdmissionNo() + "\n"
                                       + "Mobile No:-. " + CustomerAccount.getMobileNo() + "\n"
                                    + "Total Fee Amount. " + totalAmount + "\n"
                                    + "Paid Amount. " + paidAmount + "\n"
                                    + "Balance Amount. " + remaining_amount + "\n";

                            PaymentFollowup.setAdminOfBranch(Branch);
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

                        }

                        float bal = CustomerAccount.getAccountBalance();
                        bal = bal - pbal + remaining_amount;
                        CustomerAccount.setAccountBalance(bal);
                        CustomerAccountDao.updateCustomerAccount(CustomerAccount);
                        String Rent = "Admissionno No- ";
                        String agains = Rent + Admission.getAdmissionNo();
                        Payment pay = new Payment();
                        pay.setAmount(paidAmount);
                        pay.setDescription("Student Monthly Course Payment");
                        pay.setAdminOfBranch(Branch);
                        pay.setPaymentMode(paymode);
                        pay.setPaymentType("Credit");
                        pay.setCustomerAccount(CustomerAccount);
                        pay.setPaymentAgains(agains);
                        new PaymentDao().savePayment(pay);

                        int i = 1;
                        session.setAttribute("i", i);
                        long printInvoiceID = AdmissionDao.getLastAdmissionID();
                        session.setAttribute("printInvoiceID", printInvoiceID);
                        String Emailmsg = "Dear Candidate," + "\n"
                                + "Thanku for paying an amount of Rs. " + paidAmount + "\n"
                                + "Next Payment Date is . " + nextPaymentDate + "\n";

                        String subject = "Payment Details";
                        SendMail.mailsend(Admission.getEmail(), Emailmsg, subject);
//                        SendMessage.sendMobileMSG(Admission.getContactNo(), Emailmsg);
                         SendMessage.sendMobileMSG(Admission.getContactNo(), Emailmsg,Branch);
                        session.setAttribute("msg", "Payment Save Successfully.");
                           session.setAttribute("printInvoiceID", "Student");
                    session.setAttribute("admissionid", Admission.getAdmissionId());
                        response.sendRedirect("Admin/branchReception/StudentProfileDetails.jsp?accountid=" + custid);

                    } else {

                        int i = 2;
                        session.setAttribute("i", i);
                        session.setAttribute("msg", "Something Went Wrong......");
                        response.sendRedirect("Admin/branchReception/StudentProfileDetails.jsp?accountid=" + custid);

                    }
                } else {
                    int i = 2;
                    session.setAttribute("i", i);
                    session.setAttribute("msg", "Something Went Wrong......");
                    response.sendRedirect("Admin/branchReception/StudentProfileDetails.jsp?accountid=" + custid);

                }
                
                  } else {
                    int i = 2;
                    session.setAttribute("i", i);
                    session.setAttribute("msg", "Check Data Already Save or Not......");
                    response.sendRedirect("Admin/branchReception/StudentProfileDetails.jsp?accountid=" + custid);

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
