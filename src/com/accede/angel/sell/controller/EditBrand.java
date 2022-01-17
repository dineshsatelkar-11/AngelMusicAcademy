/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.sell.controller;

import com.accede.angel.sell.dao.BrandDao;
import com.accede.angel.sell.dao.ModelDao;
import com.accede.angel.sell.model.AddModel;
import com.accede.angel.sell.model.Brand;
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
 * @author asd
 */
@WebServlet(name = "EditBrand", urlPatterns = {"/EditBrand"})
public class EditBrand extends HttpServlet {

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
            String courseName = request.getParameter("modal_prd_name").toUpperCase();

            int courseid = Integer.parseInt(request.getParameter("modal_prd_id"));
//            SubjectDao sd=new SubjectDao();
//            Subject subject=sd.getSubjectByID(subjectid);

            BrandDao cd = new BrandDao();
            Brand cr1 = new Brand();
            Brand cr2 = new Brand();
            cr1 = cd.getelementByID(courseid);
            cr2 = cd.getelementByID(courseid);

            Boolean b = true;

            cr1.setBrand(courseName);

            b = cd.saveBrand(cr1);

            if (b) {
                int i = 1;
                HttpSession session = request.getSession();
                session.setAttribute("i", i);
                session.setAttribute("msg", "Brand Updated Successfully");
                response.sendRedirect("Admin/admin/AddBrand.jsp");
            } else {
                boolean c = cr2.isDeletestatus();
                if (!c) {
                    cr2.setDeletestatus(true);
                    boolean d = cd.updateBrand(cr2);
                    if (d) {
                        int i = 1;
                        HttpSession session = request.getSession();
                        session.setAttribute("i", i);
                        session.setAttribute("msg", "Brand Updated Successfully");
                        response.sendRedirect("Admin/admin/AddBrand.jsp");
                    } else {
                        int i = 2;
                        HttpSession session = request.getSession();
                        session.setAttribute("i", i);
                        session.setAttribute("msg", "Brand Already Added ");
                        response.sendRedirect("Admin/admin/AddBrand.jsp");
                    }
                } else {
                    int i = 2;
                    HttpSession session = request.getSession();
                    session.setAttribute("i", i);
                    session.setAttribute("msg", "Brand Already Added ");
                    response.sendRedirect("Admin/admin/AddBrand.jsp");
                }
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
