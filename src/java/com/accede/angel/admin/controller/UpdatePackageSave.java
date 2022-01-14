/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.accede.angel.admin.controller;

import com.accede.angel.admin.dao.PackageDao;
import com.accede.angel.admin.model.Admin;
import com.accede.angel.admin.model.PackageCourse;
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
@WebServlet(name = "UpdatePackageSave", urlPatterns = {"/UpdatePackageSave"})
public class UpdatePackageSave extends HttpServlet {

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
            Admin Branch = (Admin) session1.getAttribute("BRANCH_ADMIN");
            if (Branch != null) {
                
                  int packageid = Integer.parseInt(request.getParameter("packageid"));
                  PackageCourse packageCourse=new PackageDao().getPackageCourseByID(packageid);
            String PackageName = request.getParameter("Package");
            String Description = request.getParameter("Description");
          
            int NoofDays = Integer.parseInt(request.getParameter("NoofDays"));
            int NoofCourses = Integer.parseInt(request.getParameter("NoofCourses"));
            int Payment_Mode = Integer.parseInt(request.getParameter("Payment_Mode"));
            int Duration = Integer.parseInt(request.getParameter("Duration"));
            int Fee = Integer.parseInt(request.getParameter("Fee"));
            int NoofBatches = Integer.parseInt(request.getParameter("NoofBatches"));
        
          
            packageCourse.setCourseDuration(Duration);
            packageCourse.setDescription(Description);
            packageCourse.setNoofcourse(NoofCourses);
            packageCourse.setNoofdays(NoofDays);
            packageCourse.setPackagename(PackageName);
            packageCourse.setPaymentMode(Payment_Mode);
            packageCourse.setFee(Fee);
            packageCourse.setNoofBatchTimes(NoofBatches);
           
            PackageDao PackageDao=new PackageDao();
             boolean b=PackageDao.updatePackage(packageCourse);
                 
                if (b) {
                    int i = 1;
                    HttpSession session = request.getSession();
                    session.setAttribute("i", i);
                    session.setAttribute("msg", "Package Update Successfully");
                    response.sendRedirect("Admin/branchReception/Package.jsp");
                } else {
                    int i = 2;
                    HttpSession session = request.getSession();
                    session.setAttribute("i", i);
                       session.setAttribute("msg", "Something Went Wrong");
                    response.sendRedirect("Admin/branchReception/Package.jsp");
                }}else {
                int i = 2;
                HttpSession session = request.getSession();
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
