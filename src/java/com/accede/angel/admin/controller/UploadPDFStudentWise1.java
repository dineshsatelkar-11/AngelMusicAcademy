///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package com.accede.angel.admin.controller;
//
//import com.accede.angel.admin.dao.AddPdfGalleryDao;
//import com.accede.angel.admin.dao.StudentPDFDao;
//import com.accede.angel.admin.model.AddPdfGallery;
//import com.accede.angel.admin.model.StudentPdf;
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.util.Date;
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
//@WebServlet(name = "UploadPDFStudentWise1", urlPatterns = {"/UploadPDFStudentWise1"})
//public class UploadPDFStudentWise1 extends HttpServlet {
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
//            String course = request.getParameter("course");
//            String studentid = request.getParameter("studentid");
//            String lesson = request.getParameter("lesson");
//            String description = request.getParameter("description");
//            String PDF = request.getParameter("PDF");
//
//            StudentPDFDao apd = new StudentPDFDao();
//            StudentPdf s = new StudentPdf();
//            int lessonno = Integer.parseInt(lesson);
//            int pdfid = Integer.parseInt(PDF);
//            long courseid = Long.parseLong(course);
//            long stid = Long.parseLong(studentid);
//            s.setCourseid(courseid);
//            s.setLessonno(lessonno);
//            s.setPdfGalleryid(pdfid);
//            s.setPdfdescription(description);
//            s.setStudentid(stid);
//            s.setUploadedDate(new Date());
//            Boolean d = apd.saveStudentPdf(s);
//            if (d) {
//
//                int i = 1;
//                HttpSession session = request.getSession();
//                session.setAttribute("i", i);
////                out.println("<script type=\"text/javascript\">");
////                out.println("alert('Subject Added successfully');");
////                out.println("location='Admin/admin/addSubject.jsp';");
////                out.println("</script>");
//                session.setAttribute("msg", "PDF Uploaded Successfully");
//                response.sendRedirect("Admin/branchAdmin/UploadPdfStudentWise.jsp?asd="+stid);
//            } else {
//                int i = 2;
//                HttpSession session = request.getSession();
//                session.setAttribute("i", i);
//                session.setAttribute("msg", "Something Went Wrong");
//                response.sendRedirect("Admin/branchAdmin/UploadPdfStudentWise.jsp?asd="+stid);
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
