///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package com.accede.angel.admin.controller;
//
//import com.accede.angel.admin.dao.AdmissionDao;
//import com.accede.angel.admin.model.Admin;
//import com.accede.angel.admin.model.Admission;
//import java.io.IOException;
//import java.io.PrintWriter;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
////import org.apache.catalina.tribes.util.Arrays;
//
///**
// *
// * @author Accede
// */
//@WebServlet(name = "UpdateClient", urlPatterns = {"/UpdateClient"})
//public class UpdateClient extends HttpServlet {
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
//            long custid = Long.parseLong(request.getParameter("custid"));
//            ad = add.getAdmissionByID(custid);
//            int noofcourse = ad.getNoofCourse();
//            String fname = request.getParameter("fname");
//            String mname = request.getParameter("mname");
//            String lname = request.getParameter("lname");
//            String contact = request.getParameter("contact");
//            String email = request.getParameter("email");
//            String instname = request.getParameter("instname");
//
//            String gender = request.getParameter("gender");
//            String address = request.getParameter("address");
//            String occupation = request.getParameter("occupation");
//            String parentcontact = request.getParameter("parentcontact");
//            String nationality = request.getParameter("nationality");
//            String religion = request.getParameter("religion");
//            String qualification = request.getParameter("qualification");
//            String mothertongue = request.getParameter("mothertongue");
//            String mothername = request.getParameter("mothername");
//            int duration = Integer.parseInt(request.getParameter("duration"));
//            String batchtime = request.getParameter("batchtime");
//
//            for (int i = 0; i < noofcourse; i++) {
//
//                if (i == 0) {
//                    int CourseFee1 = Integer.parseInt(request.getParameter("CourseFee0"));
//                    ad.setCourseFee1(CourseFee1);
//                } else if (i == 1) {
//                    int CourseFee2 = Integer.parseInt(request.getParameter("CourseFee1"));
//                    ad.setCourseFee2(CourseFee2);
//                } else if (i == 2) {
//                    int CourseFee3 = Integer.parseInt(request.getParameter("CourseFee2"));
//                    ad.setCourseFee3(CourseFee3);
//                } else if (i == 3) {
//                    int CourseFee4 = Integer.parseInt(request.getParameter("CourseFee3"));
//                    ad.setCourseFee4(CourseFee4);
//                } else {
//                    int CourseFee5 = Integer.parseInt(request.getParameter("CourseFee4"));
//                    ad.setCourseFee5(CourseFee5);
//                }
//            }
//
//            String[] Day = request.getParameterValues("Day");
//            String daylist="";
//             for (int i = 0; i < Day.length; i++) 
//             {
//                 daylist=daylist.concat(Day[i]);
//                 daylist=daylist.concat(" ");
//                 
//             }
//            int Paymentmode = Integer.parseInt(request.getParameter("Paymentmode"));
//            String str1 = Arrays.toString(Day);
//            ad.setAddress(address);
//            ad.setBatchTimings(batchtime);
//            ad.setContactNo(contact);
//
//            ad.setDaysInWeek(daylist);
//            ad.setDuration(duration);
//            ad.setEmail(email);
//            ad.setFirstName(fname);
//            ad.setReligion(religion);
//            ad.setQualification(qualification);
//            ad.setPaymentmodecount(Paymentmode);
//            ad.setParentsNo(parentcontact);
//            ad.setOccupation(occupation);
//            ad.setNationality(nationality);
//            ad.setMothersName(mothername);
//            ad.setMotherTongue(mothertongue);
//            ad.setMiddleName(mname);
//            ad.setLastName(lname);
//            ad.setInstrumentName(instname);
//            ad.setGender(gender);
// HttpSession session1 = request.getSession();
//            Admin Branch = (Admin) session1.getAttribute("BRANCH_ADMIN");
//
//           boolean b= add.updateAdmission(ad);
//             if (Branch.getAdminOfBranch() == null) {
//                 if(b){
//                 int i=1;
//                  HttpSession session = request.getSession();
//                session.setAttribute("i", i);
//                session.setAttribute("msg", "Student Updated Successfully.");
////                out.println("<script type=\"text/javascript\">");
////                out.println("alert('Subject Added successfully');");
////                out.println("location='Admin/admin/addSubject.jsp';");
////                out.println("</script>");
//                response.sendRedirect("Admin/admin/All_Student.jsp");
//            }
//            else{
//                   int i=2;
//                  HttpSession session = request.getSession();
//                session.setAttribute("i", i);
//                session.setAttribute("msg", "Something Went Wrong..");
//                response.sendRedirect("Admin/admin/All_Student.jsp");
//        }
//             }
//             else
//             {
//                         if(b){
//                 int i=1;
//                  HttpSession session = request.getSession();
//                session.setAttribute("i", i);
//                session.setAttribute("msg", "Student Updated Successfully.");
////                out.println("<script type=\"text/javascript\">");
////                out.println("alert('Subject Added successfully');");
////                out.println("location='Admin/admin/addSubject.jsp';");
////                out.println("</script>");
//                response.sendRedirect("Admin/branchReception/AllStudent.jsp");
//            }
//            else{
//                   int i=2;
//                  HttpSession session = request.getSession();
//                session.setAttribute("i", i);
//                session.setAttribute("msg", "Something Went Wrong..");
//                response.sendRedirect("Admin/branchReception/AllStudent.jsp");
//        }
//             
//             }
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
