/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.admin.controller;

import com.accede.angel.admin.dao.BankDetailDao;
import com.accede.angel.admin.model.BankDetails;
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
 * @author USER
 */
@WebServlet(name = "UpdateBankDetails", urlPatterns = {"/UpdateBankDetails"})
public class UpdateBankDetails extends HttpServlet {

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
            long bank_id=Long.parseLong(request.getParameter("Modal_Bank_Id"));
            System.out.println("Bank======"+bank_id);
            String bankName=request.getParameter("modal_Bank_name");
            String BranchName=request.getParameter("modal_Branch_name");
            long AccountNo=Long.parseLong(request.getParameter("modal_AccountNo"));
            String IfscCode=request.getParameter("modal_IfscCode");
            String PanNo=request.getParameter("modal_PanNO");
            long AadharNo=Long.parseLong(request.getParameter("modal_AadharNo"));
            String Address=request.getParameter("modal_Bankaddress");
             
            BankDetails bd=new BankDetails();
            BankDetailDao bdo=new BankDetailDao();
          bd=bdo.getBankByID(bank_id);
          
          bd.setBankName(bankName);
          bd.setBranchName(BranchName);
          bd.setBankAccountNo(AccountNo);
          bd.setIfscCode(IfscCode);
          bd.setPanNumber(PanNo);
          bd.setAadharNo(AadharNo);
         bd.setBankAddress(Address);
         
         boolean b=bdo.updateBank(bd);
         if(b)
            {
                int i=1;
                  HttpSession session = request.getSession();
                session.setAttribute("i", i);
                session.setAttribute("msg", "Bank Details Updated Successfully");
                response.sendRedirect("Admin/admin/EmployeeRegistr.jsp");
            }
            else
            {
                 int i=2;
                  HttpSession session = request.getSession();
                session.setAttribute("i", i);
                 session.setAttribute("msg", "Something Went Wrong");
                response.sendRedirect("Admin/admin/EmployeeRegistr.jsp" );
            }
          
          
            
            //String bankName=request.getParameter("modal_Bank_name");
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
