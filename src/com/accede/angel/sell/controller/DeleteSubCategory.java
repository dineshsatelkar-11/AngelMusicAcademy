/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.accede.angel.sell.controller;

import com.accede.angel.sell.dao.CategoryDao;
import com.accede.angel.sell.dao.SubCatDao;
import com.accede.angel.sell.model.Category;
import com.accede.angel.sell.model.SubCategory;
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
@WebServlet(name = "DeleteSubCategory", urlPatterns = {"/DeleteSubCategory"})
public class DeleteSubCategory extends HttpServlet {

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
            long batchTimeId=Long.parseLong(request.getParameter("deletecourse"));
           SubCatDao bd = new SubCatDao();
           SubCategory c=new SubCategory();
           c=bd.getelementByID(batchTimeId);
           c.setDeletestatus(false);
           Boolean b=bd.updateSubCategoryi(c);
             if(b){
              
                 int i=1;
                  HttpSession session = request.getSession();
                session.setAttribute("i", i);
//                out.println("<script type=\"text/javascript\">");
//                out.println("alert('Subject Added successfully');");
//                out.println("location='Admin/admin/addSubject.jsp';");
//                out.println("</script>");
                  session.setAttribute("msg", "Sub Category Deleted Successfully");
                response.sendRedirect("Admin/admin/AddSubCat.jsp");
            }
            else{
                   int i=2;
                  HttpSession session = request.getSession();
                session.setAttribute("i", i);
                  session.setAttribute("msg", "Sub Category Allready Assign to Product .");
                response.sendRedirect("Admin/admin/AddSubCat.jsp");
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