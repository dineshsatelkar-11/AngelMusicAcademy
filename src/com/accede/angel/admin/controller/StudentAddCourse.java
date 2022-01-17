///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package com.accede.angel.admin.controller;
//
//import com.accede.angel.admin.dao.AdmissionDao;
//import com.accede.angel.admin.dao.CourseDao;
//import com.accede.angel.admin.model.Admission;
//import com.accede.angel.admin.model.Course;
//import java.io.IOException;
//import java.io.PrintWriter;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
///**
// *
// * @author USER
// */
//@WebServlet(name = "StudentAddCourse", urlPatterns = {"/StudentAddCourse"})
//public class StudentAddCourse extends HttpServlet {
//
//    /**
//     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
//     * methods.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            Admission ad = new Admission();
//            AdmissionDao add = new AdmissionDao();
//            long studentid = Long.parseLong(request.getParameter("studentid"));
//            System.out.println("studentid-" + studentid);
//            ad = add.getAdmissionByID(studentid);
//            int noofcourse = ad.getNoofCourse();
//            String fee = request.getParameter("coursefee");
//            System.out.println("fee-" + fee);
//            long course =Long.parseLong(request.getParameter("course"));
//            System.out.println("course-" + course);
//            System.out.println("noofcourse-" + noofcourse);
//            String Coursename = ad.getCourseName();
//            String Courseid = ad.getCourseid();
//            int fee1 = Integer.parseInt(fee);
//            if (noofcourse > 5) {
//
//                int i = 2;
//                HttpSession session = request.getSession();
//                session.setAttribute("i", i);
//                session.setAttribute("msg", "Student Allready Selected Maximum Courses.");
//                response.sendRedirect("Admin/branchReception/AllStudent.jsp");
//            } else {
//
//                if (noofcourse == 0) {
//                    noofcourse = noofcourse + 1;
//                    ad.setCourseFee1(fee1);
//                     Course c = new CourseDao().getCourseByIDDD(course);
//                    ad.setCourseName1(c.getCourseName());
//
//                    ad.setCourseName(c.getCourseName());
//                    ad.setNoofCourse(noofcourse);
//
//                   
//                    String courseid1 = Long.toString(c.getCourseId());
//
//                    ad.setCourseid(Courseid);
//                } else if (noofcourse == 1) {
//                    noofcourse = noofcourse + 1;
//                    ad.setCourseFee2(fee1);
//                     Course c = new CourseDao().getCourseByIDDD(course);
//                    ad.setCourseName2(c.getCourseName());
//                    Coursename = Coursename.concat(" ");
//                    Coursename = Coursename.concat(c.getCourseName());
//                    ad.setCourseName(Coursename);
//                    ad.setNoofCourse(noofcourse);
//                
//                    String courseid1 = Long.toString(c.getCourseId());
//                    Courseid = Courseid.concat(" ");
//                    Courseid = Courseid.concat(courseid1);
//                    ad.setCourseid(Courseid);
//
//                } else if (noofcourse == 2) {
//                    noofcourse = noofcourse + 1;
//                    ad.setCourseFee3(fee1);
//                     Course c = new CourseDao().getCourseByIDDD(course);
//                    ad.setCourseName3(c.getCourseName());
//                    Coursename = Coursename.concat(" ");
//                    Coursename = Coursename.concat(c.getCourseName());
//                    ad.setCourseName(Coursename);
//                    ad.setNoofCourse(noofcourse);
//                   
//                    String courseid1 = Long.toString(c.getCourseId());
//                    Courseid = Courseid.concat(" ");
//                    Courseid = Courseid.concat(courseid1);
//                    ad.setCourseid(Courseid);
//                } else if (noofcourse == 3) {
//                    noofcourse = noofcourse + 1;
//                    ad.setCourseFee4(fee1);
//                     Course c = new CourseDao().getCourseByIDDD(course);
//                    ad.setCourseName4(c.getCourseName());
//                    Coursename = Coursename.concat(" ");
//                    Coursename = Coursename.concat(c.getCourseName());
//                    ad.setCourseName(Coursename);
//                    ad.setNoofCourse(noofcourse);
//                  
//                    String courseid1 = Long.toString(c.getCourseId());
//                    Courseid = Courseid.concat(" ");
//                    Courseid = Courseid.concat(courseid1);
//                    ad.setCourseid(Courseid);
//                } else {
//                    noofcourse = noofcourse + 1;
//                    ad.setCourseFee5(fee1);
//                     Course c = new CourseDao().getCourseByIDDD(course);
//                    ad.setCourseName5(c.getCourseName());
//                    Coursename = Coursename.concat(" ");
//                    Coursename = Coursename.concat(c.getCourseName());
//                    ad.setCourseName(Coursename);
//                    ad.setNoofCourse(noofcourse);
//                   
//                    String courseid1 = Long.toString(c.getCourseId());
//                    Courseid = Courseid.concat(" ");
//                    Courseid = Courseid.concat(courseid1);
//                    ad.setCourseid(Courseid);
//                }
//            }
//
//            boolean b = add.updateAdmission(ad);
//            if (b) {
//                int i = 1;
//                HttpSession session = request.getSession();
//                session.setAttribute("i", i);
//                session.setAttribute("msg", "Student Course Update Successfully");
////                out.println("<script type=\"text/javascript\">");
////                out.println("alert('Subject Added successfully');");
////                out.println("location='Admin/admin/addSubject.jsp';");
////                out.println("</script>");
//                response.sendRedirect("Admin/branchReception/AllStudent.jsp");
//            } else {
//                int i = 2;
//                HttpSession session = request.getSession();
//                session.setAttribute("i", i);
//                session.setAttribute("msg", "Something Went Wrong..");
//                response.sendRedirect("Admin/branchReception/AllStudent.jsp");
//            }
//        }
//    }
//
//    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
//    /**
//     * Handles the HTTP <code>GET</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    /**
//     * Handles the HTTP <code>POST</code> method.
//     *
//     * @param request servlet request
//     * @param response servlet response
//     * @throws ServletException if a servlet-specific error occurs
//     * @throws IOException if an I/O error occurs
//     */
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        processRequest(request, response);
//    }
//
//    /**
//     * Returns a short description of the servlet.
//     *
//     * @return a String containing servlet description
//     */
//    @Override
//    public String getServletInfo() {
//        return "Short description";
//    }// </editor-fold>
//
//}
