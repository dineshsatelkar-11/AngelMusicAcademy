/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.accede.angel.admin.controller;

import com.accede.angel.admin.dao.CourseDao;
import com.accede.angel.admin.dao.LessonDao;
import com.accede.angel.admin.dao.LessonVideoDao;
import com.accede.angel.admin.dao.StudentWiseVideoDao;
import com.accede.angel.admin.model.Admin;
import com.accede.angel.admin.model.Course;
import com.accede.angel.admin.model.LessonPdf;
import com.accede.angel.admin.model.LessonVideo;
import com.accede.angel.admin.model.StudentWiseVideo;
import com.accede.angel.services.DynamicGenerator;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Accede
 */
@WebServlet(name = "UploadVideoStudentWise", urlPatterns = {"/UploadVideoStudentWise"})
public class UploadVideoStudentWise extends HttpServlet {

    private static final String UPLOAD_DIRECTORY = "UploadVideoStudentWise";
    private static final int THRESHOLD_SIZE = 1024 * 1024 * 3;  // 3MB
    private static final int MAX_FILE_SIZE = 1024 * 1024 * 40; // 40MB
    private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50; // 50MB

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

        PrintWriter out = response.getWriter();

        HttpSession session1 = request.getSession();
        HttpSession session = request.getSession();
        Admin Branch = (Admin) session1.getAttribute("BRANCH_ADMIN");
        if (Branch != null) {
            String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
            System.out.println("upload directory is" + UPLOAD_DIRECTORY);

            StudentWiseVideoDao ld = new StudentWiseVideoDao();
            StudentWiseVideo a = new StudentWiseVideo();
            long p6 = 0;
            if (ServletFileUpload.isMultipartContent(request)) {
                try {

                    List<FileItem> multiparts = new ServletFileUpload(
                            new DiskFileItemFactory()).parseRequest(request);
                    for (FileItem item : multiparts) {
                        //System.out.println("in for");
                        if (!item.isFormField()) {

                            a.setVideoPath(uploadPath + File.separator + item.getName());
                            item.write(new File(uploadPath + File.separator + item.getName()));
                            a.setVideoName(item.getName());
                        } else {

                            System.err.println(item.getString() + item.getFieldName());

                            if (item.getFieldName().equals("course")) {
                                String courseno = item.getString();
                                CourseDao CourseDao = new CourseDao();
                                Course course = CourseDao.getCourseByName(courseno);
                                long courseid = course.getCourseId();

                                a.setCourseid(courseid);
                            }
                            if (item.getFieldName().equals("studentid")) {
                                String studentid = item.getString();
                                p6 = Long.parseLong(studentid);

                                a.setStudentid(p6);
                            }

                            if (item.getFieldName().equals("description")) {
                                String lesson = item.getString();

                                a.setVideodescription(lesson);
                            }
                            if (item.getFieldName().equals("Date_of_Video")) {
                                String dov = item.getString();
                                try {
                                    a.setDateofvideo(new SimpleDateFormat("yyyy-MM-dd").parse(dov));
                                } catch (ParseException ex) {
                                    ex.printStackTrace();
                                }
                            }

                        }
                    }

                    boolean b = ld.saveStudentWiseVideo(a);

                    if (b) {

                        int i = 1;

                        session.setAttribute("i", i);
                        session.setAttribute("msg", "Video Upload Successfully");
                        String type = (String) session.getAttribute("BRANCH_ADMIN1");
                        if (type.equals("Branch_Admin")) {
                            response.sendRedirect("Admin/branchReception/UploadVideo.jsp?asd=" + p6);
                        } else {
                            response.sendRedirect("Admin/branchAdmin/UploadVideo.jsp?asd=" + p6);
                        }
                    } else {

                        int i = 2;

                        session.setAttribute("i", i);
                        session.setAttribute("msg", "Something Went Wrong..");
                        String type = (String) session.getAttribute("BRANCH_ADMIN1");
                        if (type.equals("Branch_Admin")) {
                            response.sendRedirect("Admin/branchReception/UploadVideo.jsp?asd=" + p6);
                        } else {
                            response.sendRedirect("Admin/branchAdmin/UploadVideo.jsp?asd=" + p6);
                        }
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        } else {
            int i = 2;

            session.setAttribute("i", i);
            session.setAttribute("msg", "Your Session is Terminate......");
            response.sendRedirect("Admin/Login/adminLogin.jsp");

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
