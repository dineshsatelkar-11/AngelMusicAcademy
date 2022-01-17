/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.sell.controller;

import com.accede.angel.sell.dao.BrandDao;
import com.accede.angel.sell.dao.CategoryDao;
import com.accede.angel.sell.model.Brand;
import com.accede.angel.sell.model.Category;
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
 * @author Varsha
 */
@WebServlet(name = "AddBrandServ", urlPatterns = {"/AddBrandServ"})
public class AddBrandServ extends HttpServlet {

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
            try {

                String Brand = request.getParameter("Brand").toUpperCase();

                Brand cm = new Brand();
                Brand cm1 = new Brand();
                cm.setBrand(Brand);

                BrandDao cd = new BrandDao();
                boolean b = cd.saveBrand(cm);
                if (b) {
                    int i = 1;
                    HttpSession session = request.getSession();
                    session.setAttribute("i", i);
                    session.setAttribute("msg", "Add Brand Sucessfully !!!");

                    response.sendRedirect("Admin/admin/AddBrand.jsp");

                } else {

                    cm1 = cd.getBrand(cm);
                    if (!cm1.isDeletestatus()) {

                        cm1.setDeletestatus(true);
                        boolean b1 = cd.updateBrand(cm1);
                        if (b1) {
                            int i = 1;
                            HttpSession session = request.getSession();
                            session.setAttribute("i", i);
                            session.setAttribute("msg", "Add Brand Sucessfully !!!");

                            response.sendRedirect("Admin/admin/AddBrand.jsp");

                        } else {

                             int i = 2;
                        HttpSession session = request.getSession();
                        session.setAttribute("i", i);
                        session.setAttribute("msg", "Brand Allreday Added!!!");

                        response.sendRedirect("Admin/admin/AddBrand.jsp");

                        }

                    } else {
                      
                         int i = 2;
                            HttpSession session = request.getSession();
                            session.setAttribute("i", i);
                            session.setAttribute("msg", "Brand Allreday Added!!!");

                            response.sendRedirect("Admin/admin/AddBrand.jsp");
                        
                      

                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
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
