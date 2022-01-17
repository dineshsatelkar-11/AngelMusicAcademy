/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.admin.controller;

import com.accede.angel.admin.dao.CourseDao;
import com.accede.angel.admin.dao.StudentWiseVideoDao;
import com.accede.angel.admin.model.Admin;
import com.accede.angel.admin.model.Course;
import com.accede.angel.admin.model.StudentWiseVideo;
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
 * @author Admin
 */
@WebServlet(name = "UploadStudentVideo", urlPatterns = {"/UploadStudentVideo"})
public class UploadStudentVideo extends HttpServlet {

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
                StudentWiseVideoDao ld = new StudentWiseVideoDao();
                StudentWiseVideo a = new StudentWiseVideo();
                String coursename = request.getParameter("courseID");
                String description = request.getParameter("description");
                String link = request.getParameter("link");
                String Date_of_Video = request.getParameter("Date_of_Video");
                String studentid = request.getParameter("studentid");
                     String custid = request.getParameter("custid");
                   
                   
                 CourseDao CourseDao = new CourseDao();
    Course course = CourseDao.getCourseByName(coursename);
                try {
                    a.setDateofvideo(new SimpleDateFormat("yyyy-MM-dd").parse(Date_of_Video));
                } catch (ParseException ex) {
                    ex.printStackTrace();
                }
                a.setCourseid(course.getCourseId());
                a.setStudentid(Long.parseLong(studentid));
                a.setVideoPath(link);
                a.setVideodescription(description);
                a.setCourseName(coursename);
                   int custmerid = Integer.parseInt(custid);
              boolean b = ld.saveStudentWiseVideo(a);

                    if (b) {
                    
                       int i = 1;
               
                session.setAttribute("i", i);
//                out.println("<script type=\"text/javascript\">");
//                out.println("alert('Subject Added successfully');");
//                out.println("location='Admin/admin/addSubject.jsp';");
//                out.println("</script>");
                session.setAttribute("msg", "Video Uploaded Successfully");
                response.sendRedirect("Admin/branchReception/StudentProfileDetails.jsp?accountid="+custmerid);
                    
                    }else{}

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
