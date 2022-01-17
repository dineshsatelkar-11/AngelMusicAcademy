///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package com.accede.angel.admin.controller;
//
//import com.accede.angel.admin.dao.AdmissionDao;
//import com.accede.angel.admin.model.Admission;
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
// * @author Accede
// */
//@WebServlet(name = "UpdateCourse", urlPatterns = {"/UpdateCourse"})
//public class UpdateCourse extends HttpServlet {
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
//            System.out.println("noofcourse-" + noofcourse);
//            String Coursename = "";
//            String Coursefee = "";
//            if (noofcourse > 1) {
//                
//                for (int i = 0; i < noofcourse; i++) {
//                    String fee = request.getParameter("Coursefee" + i);
//                    System.out.println("fee-" + fee);
//                    String Course = request.getParameter("CourseName" + i);
//                    System.out.println("Course-" + Course);
//                    String chec = request.getParameter("checkbox" + i);
//                    System.out.println("chec-" + chec);
//
//                    if (request.getParameter("checkbox" + i) == null) {
//                        System.out.println("Coursename-" + Coursename);
//                        Coursename = Coursename.concat(Course);
//                        System.out.println("Coursename-" + Coursename);
//                        Coursefee = Coursefee.concat(fee);
//
//                        Coursename = Coursename.concat(" ");
//                        Coursefee = Coursefee.concat(" ");
//
//                    } else {
//                        //checkbox checked
//                    }
//
////                if (chec.equals("on")) {
////                } else {
////                   
////                }
//                }
//                String[] courses = Coursename.split(" ");
//                String[] fees = Coursefee.split(" ");
//                int size = courses.length;
//                System.out.println("size-" + size);
//                ad.setCourseName(Coursename);
//                ad.setCourseName1("Not Selected");
//                ad.setCourseName2("Not Selected");
//                ad.setCourseName3("Not Selected");
//                ad.setCourseName4("Not Selected");
//                ad.setCourseName5("Not Selected");
//                ad.setCourseFee1(0);
//                ad.setCourseFee2(0);
//                ad.setCourseFee3(0);
//                ad.setCourseFee4(0);
//                ad.setCourseFee5(0);
//                for (int j = 0; j < size; j++) {
//                    String name = courses[j];
//                    String f = fees[j];
//                    int coursefee = Integer.parseInt(f);
//                    if (j == 0) {
//                        ad.setCourseName1(name);
//                        ad.setCourseFee1(coursefee);
//                    } else if (j == 1) {
//                        ad.setCourseName2(name);
//                        ad.setCourseFee2(coursefee);
//                    } else if (j == 2) {
//                        ad.setCourseName3(name);
//                        ad.setCourseFee3(coursefee);
//                    } else if (j == 3) {
//                        ad.setCourseName4(name);
//                        ad.setCourseFee4(coursefee);
//                    } else {
//                        ad.setCourseName5(name);
//                        ad.setCourseFee5(coursefee);
//                    }
//                }
//                ad.setNoofCourse(size);
//            } else {
//                String fee = request.getParameter("Coursefee0");
//                String Course = request.getParameter("CourseName0");
//                String chec = request.getParameter("checkbox0");
//                 System.out.println("chec-" + chec);
//                if (request.getParameter("checkbox0") != null) {
// System.out.println("chec1-" + chec);
//                     ad.setCourseName("Not Selected");
//                ad.setCourseName1("Not Selected");
//                ad.setCourseName2("Not Selected");
//                ad.setCourseName3("Not Selected");
//                ad.setCourseName4("Not Selected");
//                ad.setCourseName5("Not Selected");
//                ad.setCourseFee1(0);
//                ad.setCourseFee2(0);
//                ad.setCourseFee3(0);
//                ad.setCourseFee4(0);
//                ad.setCourseFee5(0);
//                 ad.setNoofCourse(0);
//                   
//
//                } else {
//                    
//                     ad.setCourseName(Course);
//                    ad.setCourseName1(Course);
//                    ad.setCourseName2("Not Selected");
//                    ad.setCourseName3("Not Selected");
//                    ad.setCourseName4("Not Selected");
//                    ad.setCourseName5("Not Selected");
//                    ad.setCourseFee1(Integer.parseInt(fee));
//                    ad.setCourseFee2(0);
//                    ad.setCourseFee3(0);
//                    ad.setCourseFee4(0);
//                    ad.setCourseFee5(0);
//                    
//                    
//                    
//                   
//                }
//
//            }
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
//
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
