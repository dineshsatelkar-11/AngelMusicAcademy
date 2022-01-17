/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.accede.angel.admin.controller;

import com.accede.angel.admin.dao.ExternalAccountSuperDao;
import com.accede.angel.admin.dao.SuperAdminPaymentDao;
import com.accede.angel.admin.model.ExternalAccountSuper;
import com.accede.angel.admin.model.SuperAdminPayment;
import com.accede.angel.services.SendMessage;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "ExternalAccountpaidSave", urlPatterns = {"/ExternalAccountpaidSave"})
public class ExternalAccountpaidSave extends HttpServlet {

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
          
                int Eid = Integer.parseInt(request.getParameter("empid"));
            ExternalAccountSuperDao bd = new ExternalAccountSuperDao();
            ExternalAccountSuper ee = bd.getEmployeeByID(Eid);
            System.out.println("Modal_Employee_Id====" + Eid);
            int Advance = Integer.parseInt(request.getParameter("Advance"));
            String Credit=request.getParameter("paymenttype");
           
            
            SuperAdminPayment SuperAdminPayment=new SuperAdminPayment();
            SuperAdminPayment.setAmount(Advance);
            String Remark="Account Holder Name  :-  "+ee.getAccountHolderName();
            SuperAdminPayment.setDescription(Remark);
            SuperAdminPayment.setPaymentAgainsType("External Account");
            SuperAdminPayment.setPaymentAgains(request.getParameter("empid"));
            SuperAdminPayment.setPaymentMode("Cash");
            SuperAdminPayment.setPaymentType(Credit);
        boolean b=    new SuperAdminPaymentDao().saveSuperAdminPayment(SuperAdminPayment);
            if(b)
            {
                
                int i = 1;
                HttpSession session = request.getSession();
                session.setAttribute("i", i);
                session.setAttribute("msg", "Employee Advance Give  successfully");
                response.sendRedirect("Admin/admin/PaiExternalAmount.jsp?asd="+Eid);
            } else {
                int i = 2;
                HttpSession session = request.getSession();
                session.setAttribute("i", i);
                session.setAttribute("msg", "Something Went Wrong..");
                response.sendRedirect("Admin/admin/PaiExternalAmount.jsp?asd="+Eid);
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
