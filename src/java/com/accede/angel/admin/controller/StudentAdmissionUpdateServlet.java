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

/**
 *
 * @author Admin
 */
@WebServlet(name = "StudentAdmissionUpdateServlet", urlPatterns = {"/StudentAdmissionUpdateServlet"})
public class StudentAdmissionUpdateServlet extends HttpServlet {

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
                 AdmissionDao ad = new AdmissionDao();
                CustomerAccount CustomerAccount = CustomerAccountDao.getCustomerAccountById(customerAccountid);
                 Admission Admission = ad.getAdmissionByAccount(CustomerAccount);
                 System.out.println("Admission="+Admission);
                String fname = request.getParameter("fname");

                String email = request.getParameter("email");
                String address = request.getParameter("address");
                
                
                CustomerAccount.setName(fname);
                CustomerAccount.setAddress(address);
                CustomerAccount.setEmail(email);
                
              
                String Address = request.getParameter("Address");
                int Package = Integer.parseInt(request.getParameter("Package"));
                PackageCourse PackageCourse = new PackageDao().getPackageCourseByID(Package);
                int noofcourseselect = Integer.parseInt(request.getParameter("noofcourseselect"));
                int noofDaysselect = Integer.parseInt(request.getParameter("noofDaysselect"));
                int noofBatchTimeselect = Integer.parseInt(request.getParameter("noofBatchTimeselect"));
                int discper = Integer.parseInt(request.getParameter("discper"));
                int discamt = Integer.parseInt(request.getParameter("discamt"));
            
               
                String[] days = request.getParameterValues("Days");
                
                String[] coursename = request.getParameterValues("Courses");
                String[] batchtime = request.getParameterValues("BatchTime");
                System.out.println("days==" + days);
                List list = Arrays.asList(coursename);
                List list1 = Arrays.asList(days);
                List list2 = Arrays.asList(batchtime);
                System.out.println("coursename==" + coursename);
                System.out.println("batchtime==" + batchtime);
              
            
               
                StudentAccount StudentAccount = new StudentAccount();
               
                
               
             
          
                Admission.setFirstName(fname);
//                Admission.setLastName(lname);
            
                Admission.setContactNo(CustomerAccount.getMobileNo());
                Admission.setEmail(email);
             
                Admission.setAddress(Address);
                Admission.setCourseName(list.toString());
                Admission.setDaysInWeek(list1.toString());
                Admission.setBatchTimings(list2.toString());
             
              
           
               
                Admission.setNoofBatchTimeselect(noofBatchTimeselect);
                Admission.setNoofDaysselect(noofDaysselect);
                Admission.setNoofcourseselect(noofcourseselect);
              
                Admission.setAddress(address);
                Admission.setPackageCourse(PackageCourse);
                
                Admission.setFee(PackageCourse.getFee());
              
                Admission.setDisamount(discamt);
                Admission.setDiscper(discper);
           
           
               
                
                Boolean b = ad.update(Admission);
                if (b) {
  
                  
                       
                        
                        CustomerAccountDao.updateCustomerAccount(CustomerAccount);
                      
                        int i = 1;
                        session.setAttribute("i", i);
                       
                      
                      
                       
                        session.setAttribute("msg", "Student Details Update Successfully");
                        
                        response.sendRedirect("Admin/branchReception/branchReceptionIndex.jsp");
                   
                    
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
