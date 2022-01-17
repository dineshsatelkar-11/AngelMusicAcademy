/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.accede.angel.admin.controller;

import com.accede.angel.admin.dao.CourseDao;
import com.accede.angel.admin.dao.InstrumentDao;
import com.accede.angel.admin.dao.InstrumentSubcategoryDao;

import com.accede.angel.admin.model.Course;
import com.accede.angel.admin.model.Instrument;
import com.accede.angel.admin.model.InstrumentSubcategory;

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
 * @author Accede
 */
@WebServlet(name = "AddInstrumentSubcategory", urlPatterns = {"/AddInstrumentSubcategory"})
public class AddInstrumentSubcategory extends HttpServlet {

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
            int instrumentid=Integer.parseInt(request.getParameter("instrument"));
            String Desc=request.getParameter("Desc");
            InstrumentDao sd=new InstrumentDao();
            Instrument instrument=sd.getInstrumentByID(instrumentid);
            InstrumentSubcategory is=new InstrumentSubcategory();
            is.setInstrument(instrument);
            is.setInstrumentSubcategoryName(Desc);
            InstrumentSubcategoryDao cd=new InstrumentSubcategoryDao();
            Boolean b=cd.saveInstrumentSubcategory(is);
            if(b)
            {
                int i=1;
                  HttpSession session = request.getSession();
                session.setAttribute("i", i);
                response.sendRedirect("Admin/admin/addInstrumentSubcategory.jsp");
            }
            else
            {
                 int i=2;
                  HttpSession session = request.getSession();
                session.setAttribute("i", i);
                response.sendRedirect("Admin/admin/addInstrumentSubcategory.jsp" );
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
