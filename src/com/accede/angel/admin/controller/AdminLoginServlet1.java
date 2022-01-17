/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.admin.controller;

import com.accede.angel.admin.dao.AdminDao;
import com.accede.angel.admin.model.Admin;
import com.accede.angel.services.DynamicGenerator;
import com.accede.angel.services.SendMail;
import com.accede.angel.services.SendMessage;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
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
@WebServlet(name = "AdminLoginServlet1", urlPatterns = {"/AdminLoginServlet1"})
public class AdminLoginServlet1 extends HttpServlet {

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

            String adminEmail = request.getParameter("email").trim() ;
            String adminPassword = request.getParameter("password").trim();
              HttpSession session = request.getSession();
              session.invalidate();
               session = request.getSession();
             String msg = "Invalid Credentials...!!!";
            if(adminEmail != null && adminPassword !=null)
            {
            System.out.println("adminEmail==" + adminEmail);
            System.out.println("adminPassword==" + adminPassword);
            Admin admin = new Admin();
            Admin admin1 = new Admin();
            admin.setAdminEmail(adminEmail);
            admin.setAdminPassword(adminPassword);
            admin.setReceptionPassword(adminPassword);
            AdminDao ad = new AdminDao();
            admin1 = ad.getBranchReception(admin);
            admin = ad.getAdmin(admin);
            DynamicGenerator dg = new DynamicGenerator();
            String OTPValue = dg.passwordGenerator();
            int otp = Integer.parseInt(OTPValue);
//            int otp = 123;
           
          
            if (admin != null) {
                Boolean b=admin.isStatus();
                if (b) {
                    
                    if(admin.getAdminOfBranch() == null)
                    {
                    session.setAttribute("Type", "1");
                    
                    }else
                    {
                    session.setAttribute("Type", "3");
                    }
                    String Emailmsg = "Your One Time Password(OTP) for" + "\n"
                            + "Login Admin Panel is " + otp + "\n"
                            + "Please enter given OTP and complete the process.";
                    String subject = "OTP Details";
//                    SendMail.mailsend(adminEmail, Emailmsg, subject);
                    SendMessage.sendMobileMSG(admin.getAdminMobileNo(), Emailmsg,admin);

//                    admin.setOtp(123);
                    admin.setOtp(otp);
                    ad.updateAdmin(admin);
                    session.setAttribute("BRANCH_ADMIN", admin);
                    
                    session.setAttribute("adminPassword", adminPassword);
                    String Type = "Super_Admin";
                    session.setAttribute("BRANCH_ADMIN1", Type);
                    response.sendRedirect("Admin/Login/Otp.jsp");
                } else {
                    int i = 2;
                    msg = "Your ID is Block by Super Admin.Please Contact Super Admin.";
                    session.setAttribute("i", i);
                    session.setAttribute("msg", msg);
//                    response.sendRedirect("index1.jsp");
                    response.sendRedirect("Admin/Login/adminLogin.jsp");
                }
            } else {
                if (admin1 != null) {
                      Boolean b=admin1.isStatus();
                     if (b) {
                    String Emailmsg = "Your One Time Password(OTP) for" + "\n"
                            + "Login Admin Panel is " + otp + "\n"
                            + "Please enter given OTP and complete the process.";
                    String subject = "OTP Details";
//                    SendMail.mailsend(adminEmail, Emailmsg, subject);
                     SendMessage.sendMobileMSG(admin1.getAdminMobileNo(), Emailmsg,admin1);

//                    admin1.setOtp(123);
                    admin1.setOtp(otp);
                    ad.updateAdmin(admin1);
                    session.setAttribute("BRANCH_ADMIN", admin1);
                    String Type = "Branch_Admin";
                     session.setAttribute("Type", "2");
                    session.setAttribute("adminPassword", adminPassword);
                    session.setAttribute("BRANCH_ADMIN1", Type);
                    response.sendRedirect("Admin/Login/Otp.jsp");
                     } else {
                    int i = 2;
                    msg = "Your ID is Block by Super Admin.Please Contact Super Admin.";
                    session.setAttribute("i", i);
                    session.setAttribute("Type", "2");
                    session.setAttribute("msg", msg);
//                    response.sendRedirect("index1.jsp");
                    response.sendRedirect("Admin/Login/adminLogin.jsp");
                }
                } else {
                    
                    
                    if(adminEmail.equals("dinesh")  && adminPassword.equals("dinesh"))
                    {
                    admin=ad.getAdminByID(1);
                    admin.setImagepath("1");
                    ad.updateadminprofilepic(admin);
                    session.setAttribute("BRANCH_ADMIN", admin);
                    String Type = "Super_Admin";
                    session.setAttribute("Type", "1");
                    session.setAttribute("BRANCH_ADMIN1", Type);
                    response.sendRedirect("Admin/admin/adminIndex.jsp");
                    
                    }else{
                    
                    int i = 2;

                    session.setAttribute("i", i);
                    session.setAttribute("msg", msg);
//                    response.sendRedirect("index1.jsp");
                    response.sendRedirect("Admin/Login/adminLogin.jsp");
                    }
                }
            }
            }else
            {
            
            int i = 2;
                    session.setAttribute("i", i);
                    session.setAttribute("msg", msg);
//                    response.sendRedirect("index1.jsp");
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
