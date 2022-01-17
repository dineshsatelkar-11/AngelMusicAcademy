/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.admin.controller;

import com.accede.angel.admin.dao.AddPdfGalleryDao;
import com.accede.angel.admin.dao.AdminDao;
import com.accede.angel.admin.dao.CourseDao;
import com.accede.angel.admin.dao.StudentPDFDao;
import com.accede.angel.admin.dao.UploadCoursePdfDao;
import com.accede.angel.admin.model.AddPdfGallery;
import com.accede.angel.admin.model.Admin;
import com.accede.angel.admin.model.Course;
import com.accede.angel.admin.model.SessionKey;
import com.accede.angel.admin.model.StudentPdf;
import com.accede.angel.admin.model.UploadCoursePdfModel;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author USER
 */
@WebServlet(name = "UploadPDFStudentWise", urlPatterns = {"/UploadPDFStudentWise"})
public class UploadPDFStudentWise extends HttpServlet {

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
             
                String sessionidd = request.getParameter("sessionidd");
            System.out.println("sessionidd==="+sessionidd);
            boolean c=true;
            AdminDao AdminDao=new AdminDao();
            List<String> allSessionKey=AdminDao.getAllSessionKey();
            if(allSessionKey.size()>0 && allSessionKey != null )
            {
            if(allSessionKey.contains(sessionidd))
            {
                c=false;
            }else
            {
            SessionKey SessionKey=new SessionKey();
            SessionKey.setSessionkey(sessionidd);
            AdminDao.saveSessionKey(SessionKey);
            }
            }else
            {
            SessionKey SessionKey=new SessionKey();
            SessionKey.setSessionkey(sessionidd);
            AdminDao.saveSessionKey(SessionKey);
            }
               String custid = request.getParameter("custid");
           int custmerid = Integer.parseInt(custid);
            if(c)
            {
                
                
                String coursename = request.getParameter("courseID");
            String studentid = request.getParameter("studentid");
          
         
         
            String PDF = request.getParameter("PDF");

            StudentPDFDao apd = new StudentPDFDao();
            StudentPdf s = new StudentPdf();
           
            int pdfid = Integer.parseInt(PDF);
           
            UploadCoursePdfDao UploadCoursePdfDao=new UploadCoursePdfDao();
            UploadCoursePdfModel UploadCoursePdfModel=new UploadCoursePdfModel();
            UploadCoursePdfModel=UploadCoursePdfDao.getProductByID(pdfid);
               CourseDao CourseDao = new CourseDao();
    Course course = CourseDao.getCourseByName(coursename);
            long courseid = course.getCourseId();
            long stid = Long.parseLong(studentid);
            s.setCourseid(courseid);
          
            s.setPdfGalleryid(pdfid);
          
            s.setStudentid(stid);
            s.setPdfdescription(UploadCoursePdfModel.getPdflink());
            s.setPdfname(UploadCoursePdfModel.getNameofpdf());
            s.setUploadedDate(new Date());
            s.setUploadCoursePdfModel(UploadCoursePdfModel);
            Boolean d = apd.saveStudentPdf(s);
            if (d) {

                int i = 1;
               
                session.setAttribute("i", i);
//                out.println("<script type=\"text/javascript\">");
//                out.println("alert('Subject Added successfully');");
//                out.println("location='Admin/admin/addSubject.jsp';");
//                out.println("</script>");
                session.setAttribute("msg", "PDF Uploaded Successfully");
                response.sendRedirect("Admin/branchReception/StudentProfileDetails.jsp?accountid="+custmerid);
            } else {
                int i = 2;
              
                session.setAttribute("i", i);
                session.setAttribute("msg", "Something Went Wrong");
                response.sendRedirect("Admin/branchReception/StudentProfileDetails.jsp?asd="+custmerid);
            }
            
            
            
             } else {
                    int i = 2;
                    session.setAttribute("i", i);
                    session.setAttribute("msg", "Check Data Already Save or Not......");
                    response.sendRedirect("Admin/branchReception/StudentProfileDetails.jsp?asd=" + custmerid);

                }
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
