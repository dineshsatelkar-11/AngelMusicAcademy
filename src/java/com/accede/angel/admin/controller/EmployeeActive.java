/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.accede.angel.admin.controller;

import com.accede.angel.admin.dao.EmployeeDao;
import com.accede.angel.admin.model.Employee;
import com.accede.angel.admin.model.EmployeeActiveHistory;
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
 * @author a2z
 */
@WebServlet(name = "EmployeeActive", urlPatterns = {"/EmployeeActive"})
public class EmployeeActive extends HttpServlet {

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
            
             int empid = Integer.parseInt(request.getParameter("empid"));
              String status = request.getParameter("status");
              
              Employee a = new Employee();
              EmployeeActiveHistory EmployeeActiveHistory=new EmployeeActiveHistory();
              EmployeeDao ad = new EmployeeDao();
              a= ad.getEmployeeByID(empid);
               if (status.equals("1")) {
                   
                a.setStatus(false);
                EmployeeActiveHistory.setStatus("Deactivated");
                
            } else {
                a.setStatus(true);
                  EmployeeActiveHistory.setStatus("Activated");
            }
               boolean c = ad.updateEmployee(a);
               if (c) {
                   EmployeeActiveHistory.setEmployee(a);
                   ad.saveEmployeeActiveHistory(EmployeeActiveHistory);
                int i = 1;
                HttpSession session = request.getSession();
                session.setAttribute("i", i);
                session.setAttribute("msg", "Employee Update Succefully");
                response.sendRedirect("Admin/admin/AllEmployee.jsp");
            } else {
                int i = 2;
                HttpSession session = request.getSession();
                session.setAttribute("i", i);
                session.setAttribute("msg", "Something Went Wrong..");
                response.sendRedirect("Admin/admin/AllEmployee.jsp");
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
