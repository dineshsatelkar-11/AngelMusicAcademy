/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.admin.controller;

import com.accede.angel.admin.dao.AdmissionDao;
import com.accede.angel.admin.dao.CustomerAccountDao;
import com.accede.angel.admin.dao.PackageDao;
import com.accede.angel.admin.dao.PaymentDao;
import com.accede.angel.admin.dao.PaymentFollowupDao;
import com.accede.angel.admin.model.Admin;
import com.accede.angel.admin.model.Admission;
import com.accede.angel.admin.model.CustomerAccount;
import com.accede.angel.admin.model.PackageCourse;
import com.accede.angel.admin.model.Payment;
import com.accede.angel.admin.model.PaymentFollowup;
import com.accede.angel.admin.model.PaymentFollowupMessage;
import com.accede.angel.admin.model.StudentAccount;
import com.accede.angel.services.Dates;
import com.accede.angel.services.DynamicGenerator;
import com.accede.angel.services.SendMail;
import com.accede.angel.services.SendMessage;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import static org.hibernate.criterion.Projections.id;

/**
 *
 * @author Admin
 */
@WebServlet(name = "StudentAdmissionServlet", urlPatterns = {"/StudentAdmissionServlet"})
public class StudentAdmissionServlet extends HttpServlet {

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
                
                int customerAccountid = Integer.parseInt(request.getParameter("customerAccountid"));
                CustomerAccountDao CustomerAccountDao = new CustomerAccountDao();
                CustomerAccount CustomerAccount = CustomerAccountDao.getCustomerAccountById(customerAccountid);
                
                String fname = request.getParameter("fname");
//                String lname = request.getParameter("lname");
                int AdmissionFee = Integer.parseInt(request.getParameter("AdmissionFee"));
                String email = request.getParameter("email");
                String address = request.getParameter("address");
                
                
                CustomerAccount.setName(fname);
                CustomerAccount.setAddress(address);
                CustomerAccount.setEmail(email);
                
                String gender = request.getParameter("gender");
                String day = request.getParameter("day");
                String Months = request.getParameter("Month");
                String Year = request.getParameter("Year");
                String joindate = request.getParameter("joindate");
                System.out.println("joindate==" + joindate);
                String paymode = request.getParameter("paymode");
                String Address = request.getParameter("Address");
                int Package = Integer.parseInt(request.getParameter("Package"));
                PackageCourse PackageCourse = new PackageDao().getPackageCourseByID(Package);
                int noofcourseselect = Integer.parseInt(request.getParameter("noofcourseselect"));
                int noofDaysselect = Integer.parseInt(request.getParameter("noofDaysselect"));
                int noofBatchTimeselect = Integer.parseInt(request.getParameter("noofBatchTimeselect"));
                int discper = Integer.parseInt(request.getParameter("discper"));
                int discamt = Integer.parseInt(request.getParameter("discamt"));
                int FinalAmount = Integer.parseInt(request.getParameter("FinalAmount"));
                int PaidAmount = Integer.parseInt(request.getParameter("PaidAmount"));
                int BalanceAmount = Integer.parseInt(request.getParameter("BalanceAmount"));
                String[] days = request.getParameterValues("Days");
                
                String[] coursename = request.getParameterValues("Courses");
                String[] batchtime = request.getParameterValues("BatchTime");
                System.out.println("days==" + days);
                List list = Arrays.asList(coursename);
                List list1 = Arrays.asList(days);
                List list2 = Arrays.asList(batchtime);
                System.out.println("coursename==" + coursename);
                System.out.println("batchtime==" + batchtime);
                String amountinword = request.getParameter("amountinword");
                String monthno = "0";
                
                if (Months.equals("Jan")) {
                    monthno = "1";
                } else if (Months.equals("Feb")) {
                    monthno = "2";
                } else if (Months.equals("Mar")) {
                    monthno = "3";
                } else if (Months.equals("Apr")) {
                    monthno = "4";
                } else if (Months.equals("May")) {
                    monthno = "5";
                } else if (Months.equals("Jun")) {
                    monthno = "6";
                } else if (Months.equals("Jul")) {
                    monthno = "7";
                } else if (Months.equals("Aug")) {
                    monthno = "8";
                } else if (Months.equals("Sep")) {
                    monthno = "9";
                } else if (Months.equals("Oct")) {
                    monthno = "10";
                } else if (Months.equals("Nov")) {
                    monthno = "11";
                } else {
                    monthno = "12";
                }
                String Birthdate = day + "/" + monthno + "/" + Year;
                String admissionno = new DynamicGenerator().jrNoGenerator();
                String studentPassword = new DynamicGenerator().passwordGenerator();
                Admission Admission = new Admission();
                StudentAccount StudentAccount = new StudentAccount();
                Dates dates = new Dates();
                Date joingdate = new Date();
                Date Birthdate1 = new Date();
                
                try {
                    joingdate = new SimpleDateFormat("yyyy-MM-dd").parse(joindate);
                    Admission.setJoiningDate(joingdate);
                } catch (ParseException ex) {
                    ex.printStackTrace();
                }
                try {
                    Birthdate1 = new SimpleDateFormat("dd/MM/yyyy").parse(Birthdate);
                    Admission.setDateofBirth(Birthdate1);
                } catch (ParseException ex) {
                    ex.printStackTrace();
                }
                
                double age = dates.getAge(Birthdate1);
                Date duedate = dates.getEndingDate(joingdate, PackageCourse.getCourseDuration());
                Date nextPaymentDate = dates.getEndingDate(joingdate, PackageCourse.getPaymentMode()*30);
                Admission.setDueDate(duedate);
                Admission.setNextPaymentDate(nextPaymentDate);
                StudentAccount.setNextPaymentDate(nextPaymentDate);
                Admission.setFirstName(fname);
//                Admission.setLastName(lname);
                Admission.setAdmissionNo(admissionno);
                Admission.setContactNo(CustomerAccount.getMobileNo());
                Admission.setEmail(email);
                Admission.setAge(age);
                Admission.setAddress(Address);
                Admission.setCourseName(list.toString());
                Admission.setDaysInWeek(list1.toString());
                Admission.setBatchTimings(list2.toString());
                Admission.setAdmissionFee(AdmissionFee);
                Admission.setRemaininFee(BalanceAmount);
                Admission.setAdmissionDate(new Date());
                Admission.setStudentPassword(studentPassword);
                Admission.setGender(gender);
                Admission.setCustomerAccount(CustomerAccount);
                Admission.setNoofBatchTimeselect(noofBatchTimeselect);
                Admission.setNoofDaysselect(noofDaysselect);
                Admission.setNoofcourseselect(noofcourseselect);
                Admission.setDay(Integer.parseInt(day));
                Admission.setYear(Integer.parseInt(Year));
                Admission.setMonth(Months);
                Admission.setAddress(address);
                Admission.setPackageCourse(PackageCourse);
                
                Admission.setFee(PackageCourse.getFee());
                Admission.setAdminOfBranch(Branch);
                Admission.setDisamount(discamt);
                Admission.setDiscper(discper);
                Admission.setFinalamount(FinalAmount);
                
                StudentAccount.setPaymentMode(paymode);
                StudentAccount.setAmountinWord(amountinword);
                StudentAccount.setPackageFee(PackageCourse.getFee());
                StudentAccount.setDisamount(discamt);
                StudentAccount.setDiscper(discper);
                StudentAccount.setFinalamount(FinalAmount);
                StudentAccount.setPaid(PaidAmount);
                StudentAccount.setTotalremfee(BalanceAmount);
                StudentAccount.setCourseName(list.toString());
                StudentAccount.setDays(list1.toString());
                StudentAccount.setBatches(list2.toString());
                StudentAccount.setCustomerAccount(CustomerAccount);
                StudentAccount.setPackagename(PackageCourse.getPackagename());
                StudentAccount.setDescription(PackageCourse.getDescription());
                StudentAccount.setNoofBatchTimes(PackageCourse.getNoofBatchTimes());
                StudentAccount.setNoofcourse(PackageCourse.getNoofcourse());
                StudentAccount.setNoofdays(PackageCourse.getNoofdays());
                StudentAccount.setFeeType("Admission");
//                StudentAccount.setPaymentMode(PackageCourse.getPaymentMode());
                StudentAccount.setCourseDuration(PackageCourse.getCourseDuration());
                
                AdmissionDao ad = new AdmissionDao();
                
                Boolean b = ad.saveStudentAccount(StudentAccount);
                if (b) {
                    List<StudentAccount> account = new ArrayList<StudentAccount>();
                    account.add(StudentAccount);
                    Admission.setStudentAccount(account);
                    b = ad.saveAdmission(Admission);
                    if (b) {
                        if (BalanceAmount > 0) {
                            PaymentFollowup PaymentFollowup = new PaymentFollowup();
                            
                            PaymentFollowup.setCustomerAccount(CustomerAccount);
                            Date nextdate = dates.getEndingDate(new Date(), 2);
                            PaymentFollowup.setRequestDate(new Date());
                            PaymentFollowup.setNextfollowupdate(nextdate);
                            PaymentFollowup.setTypeofoffollowup("Music Class");
                            String message = "Student Admission," + "\n"
                                    + "Admission No:-. " + admissionno + "\n"
                                    + "Mobile No:-. " + CustomerAccount.getMobileNo() + "\n"
                                    + "Total Fee Amount. " + FinalAmount + "\n"
                                    + "Paid Amount. " + PaidAmount + "\n"
                                    + "Balance Amount. " + BalanceAmount + "\n";
                            
                            PaymentFollowup.setAdminOfBranch(Branch);
                            PaymentFollowupDao PaymentFollowupDao = new PaymentFollowupDao();
                            PaymentFollowupDao.savePaymentFollowup(PaymentFollowup);
                            int paymentId = new PaymentFollowupDao().getLastPaymentFollowupID();
                            if (paymentId != 0) {
                                PaymentFollowupMessage PaymentFollowupMessage = new PaymentFollowupMessage();
                                PaymentFollowup = PaymentFollowupDao.getPaymentFollowupByID(paymentId);
                                PaymentFollowupMessage.setDescription(message);
                                PaymentFollowupMessage.setFollowupdate(nextdate);
                                PaymentFollowupMessage.setPaymentFollowup(PaymentFollowup);
                                PaymentFollowupDao.savePaymentFollowupMessage(PaymentFollowupMessage);
                            }
                        }
                        
                        CustomerAccountDao.updateCustomerAccount(CustomerAccount);
                        String Rent = "Admissionno No- ";
                        String agains = Rent + admissionno;
                        Payment pay = new Payment();
                        pay.setAmount(PaidAmount);
                        pay.setDescription("Student Admission Payment");
                        pay.setAdminOfBranch(Branch);
                        pay.setPaymentMode(paymode);
                        pay.setPaymentType("Credit");
                        pay.setCustomerAccount(CustomerAccount);
                        pay.setPaymentAgains(agains);
                        new PaymentDao().savePayment(pay);
                        
                        float bal = CustomerAccount.getAccountBalance();
                        bal = bal + BalanceAmount;
                        CustomerAccount.setAccountBalance(bal);
                        int i = 1;
                        session.setAttribute("i", i);
                        long admissionid = ad.getLastAdmissionID();
                        String Emailmsg = "Dear Candidate," + "\n"
                                + "Its our Pleasure that you joined our Institute. " + "\n"
                                + "Thanks for paying an amount of Rs. " + PaidAmount + "\n"
                                + "\n\n" + "Feel your site at http://angelm.in/"
                                + "\n\n" + "NOTE:PLEASE READ EVERYTHING BELOW.\n"
                                + "Login Details for Student \n"
                                + "User Name :-" + admissionno + "\n"
                                + "Password:-" + studentPassword + "\n\n\n";
                        String subject = "Login Credentials";
                        SendMail.mailsend(email, Emailmsg, subject);
                        SendMessage.sendMobileMSG(CustomerAccount.getMobileNo(), Emailmsg,Branch);
                        session.setAttribute("printInvoiceID", admissionid);
                        
                        response.sendRedirect("Admin/branchReception/CaptureIm.jsp");
                    } else {
                        int i = 2;
                        session.setAttribute("i", i);
                        session.setAttribute("msg", "Mobile No Already Register......");
                        response.sendRedirect("Admin/branchReception/branchReceptionIndex.jsp");
                    }
                    
                } else {
                    int i = 2;
                    session.setAttribute("i", i);
                    session.setAttribute("msg", "Something Went Wrong......");
                    response.sendRedirect("Admin/branchReception/branchReceptionIndex.jsp");
                    
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
