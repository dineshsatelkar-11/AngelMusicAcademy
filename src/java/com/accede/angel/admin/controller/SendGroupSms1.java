/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.accede.angel.admin.controller;

import com.accede.angel.admin.dao.AdmissionDao;
import com.accede.angel.admin.dao.CustomerAccountDao;
import com.accede.angel.admin.dao.SmsDao;
import com.accede.angel.admin.model.Admin;
import com.accede.angel.admin.model.CustomerAccount;
import com.accede.angel.admin.model.SmsModel;
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
 * @author Admin
 */
@WebServlet(name = "SendGroupSms1", urlPatterns = {"/SendGroupSms1"})
public class SendGroupSms1 extends HttpServlet {

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
            Admin Branch = (Admin) session1.getAttribute("BRANCH_ADMIN");
            if (Branch != null) {
                String sms = request.getParameter("sms");
                long smsid = Long.parseLong(sms);
                SmsDao cd = new SmsDao();
                SmsModel SmsModel = cd.getSmsModelByID(smsid);
                if(SmsModel != null)
                {
                CustomerAccountDao CustomerAccountDao = new CustomerAccountDao();
                AdmissionDao AdmissionDao = new AdmissionDao();
                int i = 0;
                List<CustomerAccount> cl = null;
                cl = CustomerAccountDao.getCustomerAccount();
                if (cl != null && cl.size() > 0) {
                    for (CustomerAccount p : cl) {
                        
                         SendMessage.sendMobileMSG(p.getMobileNo(), SmsModel.getSms());
                    }
                }
               
                 i=1;
                  HttpSession session = request.getSession();
                session.setAttribute("i", i);
                  session.setAttribute("msg", "SMS  Send Successfully");
                response.sendRedirect("Admin/admin/GroupSMS.jsp");
                
                }else
                {
                 int i=2;
                  HttpSession session = request.getSession();
                session.setAttribute("i", i);
                  session.setAttribute("msg", "Something Went Wrong ");
                response.sendRedirect("Admin/admin/GroupSMS.jsp");
                
                }
            } else {

                int i = 2;
                HttpSession session = request.getSession();
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
