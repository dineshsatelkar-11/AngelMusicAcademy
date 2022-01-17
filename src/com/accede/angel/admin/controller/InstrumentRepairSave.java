/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.accede.angel.admin.controller;

import com.accede.angel.admin.dao.InstrumentDao;
import com.accede.angel.admin.dao.InstrumentRepairdao;
import com.accede.angel.admin.model.Instrument;
import com.accede.angel.admin.model.InstrumentRepair;
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
@WebServlet(name = "InstrumentRepairSave", urlPatterns = {"/InstrumentRepairSave"})
public class InstrumentRepairSave extends HttpServlet {

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
           String Instrument = request.getParameter("Instrument").toUpperCase();
            int rentAmount = Integer.parseInt(request.getParameter("RentCost"));
            InstrumentRepair instrument = new InstrumentRepair();
            instrument.setInstrumentRepairCost(rentAmount);
            instrument.setInstrumentName(Instrument);
            InstrumentRepairdao id = new InstrumentRepairdao();
            Boolean b = id.saveInstrument(instrument);
            if (b) {

                int i = 1;
                HttpSession session = request.getSession();
                session.setAttribute("i", i);

                session.setAttribute("msg", "Instrument Added Successfully");
                response.sendRedirect("Admin/admin/InstrumentRepair.jsp");
            } else {
                int i = 2;
                HttpSession session = request.getSession();
                session.setAttribute("i", i);
                session.setAttribute("msg", "Instrument Allready Added.");
                response.sendRedirect("Admin/admin/InstrumentRepair.jsp");
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
