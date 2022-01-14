/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.accede.angel.admin.controller;

import com.accede.angel.admin.dao.CustomerAccountDao;
import com.accede.angel.admin.dao.InstrumentRepairdao;
import com.accede.angel.admin.dao.PaymentDao;
import com.accede.angel.admin.dao.PaymentFollowupDao;
import com.accede.angel.admin.dao.RepairDao;
import com.accede.angel.admin.model.Admin;
import com.accede.angel.admin.model.CustomerAccount;
import com.accede.angel.admin.model.InstrumentRepair;
import com.accede.angel.admin.model.Payment;
import com.accede.angel.admin.model.PaymentFollowup;
import com.accede.angel.admin.model.PaymentFollowupMessage;
import com.accede.angel.admin.model.Repair;
import com.accede.angel.admin.model.RepairDetails;
import com.accede.angel.services.Dates;
import com.accede.angel.services.DynamicGenerator;
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
@WebServlet(name = "CustRepairUpdate", urlPatterns = {"/CustRepairUpdate"})
public class CustRepairUpdate extends HttpServlet {

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

                long repairid = Long.parseLong(request.getParameter("repairid"));

                RepairDao RepairDao = new RepairDao();
                Repair Repair = RepairDao.getRepairByID(repairid);

                int totalamt = Integer.parseInt(request.getParameter("totalamt"));
                int discper = Integer.parseInt(request.getParameter("discper"));
                int discamt = Integer.parseInt(request.getParameter("discamt"));
                int FinalAmount = Integer.parseInt(request.getParameter("FinalAmount"));
                int Paid = Integer.parseInt(request.getParameter("Paid"));
                String paymode = request.getParameter("paymode");
                int Bal = Integer.parseInt(request.getParameter("Bal"));

                String Return_by_Date = request.getParameter("Return_by_Date");
                String amountinword = request.getParameter("amountinword");

                List<RepairDetails> allRepairDetails = new ArrayList<RepairDetails>();

                Repair.setPaymode(paymode);

                Repair.setAdminOfBranch(Branch);
                Repair.setTotalamt(totalamt);

                Repair.setPaid(Paid);
                Repair.setDiscper(discper);
                Repair.setDiscamt(discamt);
                Repair.setFinalAmount(FinalAmount);
                Repair.setBal(Bal);

                Repair.setAmountinWord(amountinword);

                int j = 0;

                for (RepairDetails p : Repair.getRepairDetails()) {

                    j++;

                    p.setInstrumentRepairCost(Integer.parseInt(request.getParameter("amt" + j)));
                    p.setInstrumentBrand(request.getParameter("brand" + j));
                    p.setInstrumentModel(request.getParameter("model" + j));
                    p.setInstrumentRemark(request.getParameter("remark" + j));

                    RepairDao.updateRepairDetails(p);

                }

                Date FollowpDate = new Date();

                try {
                    FollowpDate = new SimpleDateFormat("yyyy-MM-dd").parse(Return_by_Date);

                } catch (ParseException ex) {
                    ex.printStackTrace();
                }

                Repair.setReceivedDate(FollowpDate);
                Repair.setDuedateSmsdate(FollowpDate);

                System.out.print("Repair=" + Repair);
                boolean b = RepairDao.saveRepair(Repair);
                if (b) {

                  
                    
                    int i = 1;
                    session.setAttribute("i", i);
session.setAttribute("printInvoiceID", "Repair");
                    session.setAttribute("repairid", Repair.getRepairId() );
                  
                    session.setAttribute("msg", "Repair Request Update  Successfully.");

                    response.sendRedirect("Admin/branchReception/CustRepair.jsp?accountid=" + Repair.getCustomerAccount().getId());

                } else {

                    int i = 2;
                    session.setAttribute("i", i);
                    session.setAttribute("msg", "Something Went Wrong......");
                    response.sendRedirect("Admin/branchReception/CustRepair.jsp?accountid=" + Repair.getCustomerAccount().getId());
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
