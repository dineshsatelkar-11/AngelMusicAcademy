/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.accede.angel.admin.controller;

import com.accede.angel.admin.dao.PreviousStudentDAO;
import com.accede.angel.admin.model.PreviousStudent;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
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
@WebServlet(name = "PreviousStudentServlet", urlPatterns = {"/PreviousStudentServlet"})
public class PreviousStudentServlet extends HttpServlet {

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
       
        String studentname = request.getParameter("name");
            String coursename = request.getParameter("coursename");
            String mobilenumber = request.getParameter("mobilenumber");
            String joinigdate = request.getParameter("joinigdate");     
            
            PreviousStudent ps=new PreviousStudent();
            ps.setStudentname(studentname);
            ps.setCoursename(coursename);
            ps.setMobilenumber(mobilenumber);
            Date date1=new Date();
            try
            {
                System.out.println("joinigdate="+joinigdate);
                
                  date1=new SimpleDateFormat("yyyy-MM-dd").parse(joinigdate); 
                  System.out.println("joinigdate="+joinigdate);

            }catch(Exception e)
            {
                  System.out.println("erroe="+e);
            }
                 
            
            ps.setJoiningdate(date1);
            PreviousStudentDAO psdao =new PreviousStudentDAO();
            boolean b=psdao.Savebranch(ps);
            
            
            
            if (b) {

                int i = 1;
                HttpSession session = request.getSession();
                session.setAttribute("i", i);
                session.setAttribute("msg", "Student Added Successfully !!!");

                response.sendRedirect("Admin/admin/PreviousStudent_1.jsp");
            }
            else
            {
            
                int i = 2;
                HttpSession session = request.getSession();
                session.setAttribute("i", i);
                session.setAttribute("msg", "Student No Allready Added !!!");
                response.sendRedirect("Admin/admin/PreviousStudent_1.jsp");
           
            
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
