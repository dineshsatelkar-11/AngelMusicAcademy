/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.sell.controller;

import com.accede.angel.admin.dao.SuperAdminPaymentDao;
import com.accede.angel.admin.model.SuperAdminPayment;
import com.accede.angel.sell.dao.VendorDao;
import com.accede.angel.sell.dao.VendorTransactionDao;
import com.accede.angel.sell.model.Venderregistration;
import com.accede.angel.sell.model.VendorTransaction;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
@WebServlet(name = "UpdateBalance", urlPatterns = {"/UpdateBalance"})
public class UpdateBalance extends HttpServlet {

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
            long v_id = Long.parseLong(request.getParameter("Vendor_Id"));
            System.out.println("id=====" + v_id);
            float remainingbalance = Float.parseFloat(request.getParameter("Remaining_Amount"));
             System.out.println("remainingbalance=====" + remainingbalance);
            float new_Amount=Float.parseFloat(request.getParameter("New_Amount"));
             System.out.println("new_Amount=====" + new_Amount);
             String remark=request.getParameter("remark");
             String tx_date=request.getParameter("Transacion_Date");
             Venderregistration v=new Venderregistration();
             VendorDao dao=new VendorDao();
             v=dao.getvenderbyid(v_id);
             v.setBalanceAmount(remainingbalance);
             boolean b=dao.updatevendor(v);
             
            VendorTransaction vt=new VendorTransaction();
            vt.setVendor_Id(v_id);
            vt.setReason(remark);
            vt.setTransactionType("Debit");
            vt.setTransactionAmount(new_Amount);
            vt.setVendorid(v);
            try {
                vt.setTransaction_Date(new SimpleDateFormat("dd/MM/yyyy").parse(tx_date));
            } catch (ParseException ex) {
                ex.printStackTrace();
            }
            
            VendorTransactionDao vdao=new VendorTransactionDao();
            boolean b1=vdao.SaveTransactionDetails(vt);
             if(b)
            {
                
                  SuperAdminPayment SuperAdminPayment=new SuperAdminPayment();
            SuperAdminPayment.setAmount((int)new_Amount);
            SuperAdminPayment.setDescription(remark);
            SuperAdminPayment.setPaymentAgainsType("Vendor");
            SuperAdminPayment.setPaymentAgains(request.getParameter("Vendor_Id"));
            SuperAdminPayment.setPaymentMode("Cash");
            SuperAdminPayment.setPaymentType("Debit");
            new SuperAdminPaymentDao().saveSuperAdminPayment(SuperAdminPayment);
                
                int i=1;
                  HttpSession session = request.getSession();
                session.setAttribute("i", i);
                session.setAttribute("msg", "Transaction Updated Successfully");
                response.sendRedirect("Admin/admin/UpdateBalanceAmount.jsp");
            }
            else
            {
                 int i=2;
                  HttpSession session = request.getSession();
                session.setAttribute("i", i);
                 session.setAttribute("msg", "Something Went Wrong");
                response.sendRedirect("Admin/admin/UpdateBalanceAmount.jsp" );
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
